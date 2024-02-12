package dao;

import bean.BoardDTO;

import java.sql.*;

public class BoardDAO {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement pstmt;
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/board_project";
    private String username = "root";
    private String password = "1234";

    private static BoardDAO boardDAO = new BoardDAO();
    public static BoardDAO getInstance() { return boardDAO; }

    public BoardDAO(){
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

    public boolean makeBoard(BoardDTO boardDTO){
        String sql= "INSERT INTO board (id, name, email, title, content)" +
                "VALUES(?,?,?,?,?)";

        getConnection();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardDTO.getId());
            pstmt.setString(2, boardDTO.getName());
            pstmt.setString(3, boardDTO.getEmail());
            pstmt.setString(4, boardDTO.getTitle());
            pstmt.setString(5, boardDTO.getContent());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return true;
    }


}
