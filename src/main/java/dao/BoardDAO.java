package dao;

import bean.BoardDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    public boolean makeBoard(Map<String, String> map){
        String sql= "INSERT INTO board (id, name, email, title, content)" +
                "VALUES(?,?,?,?,?)";

        getConnection();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, map.get("id"));
            pstmt.setString(2, map.get("name"));
            pstmt.setString(3, map.get("email"));
            pstmt.setString(4, map.get("title"));
            pstmt.setString(5, map.get("content"));

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

    public List<BoardDTO> boardList(int startNum, int endNum){
        List<BoardDTO> list = new ArrayList<BoardDTO>();
        String sql = "SELECT * FROM board order by ref desc, seq asc LIMIT ?,?";

        getConnection();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startNum);
            pstmt.setInt(2, endNum);
            rs = pstmt.executeQuery();

            while(rs.next()){
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setSeq(rs.getInt("seq"));
                boardDTO.setId(rs.getString("id"));
                boardDTO.setName(rs.getString("name"));
                boardDTO.setEmail(rs.getString("email"));
                boardDTO.setTitle(rs.getString("title"));
                boardDTO.setContent(rs.getString("content"));
                boardDTO.setRef(rs.getInt("ref"));
                boardDTO.setLev(rs.getInt("lev"));
                boardDTO.setStep(rs.getInt("step"));
                boardDTO.setPseq(rs.getInt("pseq"));
                boardDTO.setReply(rs.getInt("reply"));
                boardDTO.setHit(rs.getInt("hit"));
                boardDTO.setLogtime(rs.getDate("logtime"));

                list.add(boardDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            list = null;
        }finally {
            try{
                if(rs !=null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(SQLException e){
                e.printStackTrace();
            }
        }
        return list;
    }

    public int getTotalA(){
        int totalA = 0;
        String sql="SELECT count(*) from board";
        getConnection();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.next();
            totalA = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if(rs != null) rs.close();
                if(conn != null) conn.close();
                if(pstmt != null) pstmt.close();
            } catch(SQLException e){
                e.printStackTrace();
            }
        }
        return totalA;
    }



}
