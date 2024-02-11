package dao;

import bean.MemberDTO;

import java.sql.*;

public class MemberDAO {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement pstmt;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/board_project";
    private String username = "root";
    private String password = "1234";

    private static MemberDAO memberDAO = new MemberDAO();
    public static MemberDAO getInstance(){return memberDAO; }

    public MemberDAO(){
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void getConnection(){
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

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
}
