package dao;

import java.sql.*;

public class GuestBookDAO {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement pstmt;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/board_project";
    private String username = "root";
    private String password = "1234";

    private static GuestBookDAO guestBookDAO = new GuestBookDAO();
    public static GuestBookDAO getInstance(){ return guestBookDAO; }

    public GuestBookDAO(){
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
}
