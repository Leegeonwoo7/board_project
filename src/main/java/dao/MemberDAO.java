package dao;

import bean.MemberDTO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.sql.*;

//import java.lang.reflect.Member;

public class MemberDAO {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement pstmt;
//    private String driver = "com.mysql.cj.jdbc.Driver";
//    private String url = "jdbc:mysql://localhost:3306/board_project";
//    private String username = "root";
//    private String password = "1234";
    private String driver;
    private String username;
    private String password;
    private String url;
    private String host;
    private String port;
//    private String sid;

    private static MemberDAO memberDAO = new MemberDAO();
    public static MemberDAO getInstance(){return memberDAO; }

    public MemberDAO(){
        try {
            Reader reader = new InputStreamReader(getClass().getClassLoader().getResourceAsStream("dev.json"), "UTF-8");
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(reader, JsonObject.class);
            JsonObject database = jsonObject.getAsJsonObject("mysql").getAsJsonObject("database");
            driver = database.get("driver").getAsString();
            host = database.get("host").getAsString();
            port = database.get("port").getAsString();
            username = database.get("username").getAsString();
            password = database.get("password").getAsString();
            url = "jdbc:mysql://" + host + ":" + port + "/board_project";

            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public void getConnection(){
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //set


    public boolean isValidateId(String id){
        boolean validate = false;
        String sql = "select * from member where id=?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()){ //중복되면 true로 반환
                validate = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch(SQLException e){
                e.printStackTrace();
            }
        }
        return validate;
    }

    public boolean makeAccount(MemberDTO memberDTO){
        String sql = "INSERT INTO member (id, name, password, gender, email, email_addr, phone, address_code, address_address, address_address_detail, logtime)" +
                "VALUES (?,?,?,?,?,?,?,?,?,?,now())";


        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDTO.getId());
            pstmt.setString(2, memberDTO.getName());
            pstmt.setString(3, memberDTO.getPassword());
            pstmt.setString(4, memberDTO.getGender());
            pstmt.setString(5, memberDTO.getEmail());
            pstmt.setString(6, memberDTO.getEmailAddr());
            pstmt.setString(7, memberDTO.getPhone());
            pstmt.setString(8, memberDTO.getAddr1());
            pstmt.setString(9, memberDTO.getAddr2());
            pstmt.setString(10, memberDTO.getAddr3());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    public MemberDTO login(String id, String password){
        MemberDTO memberDTO = null;
        String sql = "select * from member where id=? and password=?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if(rs.next()){
                memberDTO = new MemberDTO();
                memberDTO.setId(rs.getString("id"));
                memberDTO.setName(rs.getString("name"));
                memberDTO.setPassword(rs.getString("password"));
                memberDTO.setGender(rs.getString("gender"));
                memberDTO.setEmail(rs.getString("email"));
                memberDTO.setEmailAddr(rs.getString("email_addr"));
                memberDTO.setPhone(rs.getString("phone"));
                memberDTO.setAddr1(rs.getString("address_code"));
                memberDTO.setAddr2(rs.getString("address_address"));
                memberDTO.setAddr3(rs.getString("address_address_detail"));
                return memberDTO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try{
                if(rs != null) rs.close();
                if(conn != null) conn.close();
                if(pstmt != null) pstmt.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return memberDTO;
    }

    public MemberDTO getMemberById(String id){
        MemberDTO memberDTO = null;
        String sql = "SELECT * FROM member WHERE id = ?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if(rs.next()){
                memberDTO = new MemberDTO();
                memberDTO.setName(rs.getString("name"));
                memberDTO.setId(rs.getString("id"));
                memberDTO.setPhone(rs.getString("phone"));
                memberDTO.setGender(rs.getString("gender"));
                memberDTO.setEmail(rs.getString("email"));
                memberDTO.setEmailAddr(rs.getString("email_addr"));
                memberDTO.setAddr1(rs.getString("address_code"));
                memberDTO.setAddr2(rs.getString("address_address"));
                memberDTO.setAddr3(rs.getString("address_address_detail"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try{
                if(rs!=null) rs.close();
                if(pstmt!=null) pstmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return memberDTO;
    }

    public boolean updateMember(MemberDTO memberDTO){
        String sql = "UPDATE member " +
                "SET name=?," +
                " password=?," +
                " gender=?," +
                " email=?," +
                " email_addr=?," +
                " phone=?," +
                " address_code=?," +
                " address_address=?," +
                " address_address_detail=?" +
                "where id = ?";
        getConnection();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDTO.getName());
            pstmt.setString(2, memberDTO.getPassword());
            pstmt.setString(3, memberDTO.getGender());
            pstmt.setString(4, memberDTO.getEmail());
            pstmt.setString(5, memberDTO.getEmailAddr());
            pstmt.setString(6, memberDTO.getPhone());
            pstmt.setString(7, memberDTO.getAddr1());
            pstmt.setString(8, memberDTO.getAddr2());
            pstmt.setString(9, memberDTO.getAddr3());
            pstmt.setString(10, memberDTO.getId());;
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            try{
                if(pstmt!=null)pstmt.close();
                if(conn!=null)conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return true;
    }
}
