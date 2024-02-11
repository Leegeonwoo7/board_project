package dao;

import java.sql.*;

public class MemberDAO {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement pstmt;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306";
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
        String sql = "select * from member where id = ?";

        getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                validate = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) rs.close();
                if (conn != null) rs.close();
            } catch(SQLException e){
                e.printStackTrace();
            }
        }
        return validate;
    }
}
