<%@ page import="dao.BoardDAO" %>
<%@ page import="bean.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/13/24
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int pg = Integer.parseInt(request.getParameter("pg"));
    int endNum = pg * 5;
    int startNum = endNum - 4;

    BoardDAO boardDAO = BoardDAO.getInstance();
    List<BoardDTO> list = boardDAO.boardList(startNum, endNum);

    int totalA = boardDAO.getTotalA();//총글수
    int totalP = (totalA+4)/5; //총 페이지 수

%>
<html>
<head>
    <title>Title</title>
    <style>
        #currentPaging:hover {
            text-decoration: underline;
            background-color: red;
            font-size:10pt;
        }
        #paging:hover {
            text-decoration: underline;
            font-size:10pt;
        }
    </style>

</head>
<body>
    <table border="1" cellpadding="6" frame="hsides" rules="rows">
        <tr>
            <th width="100">글번호</th>
            <th width="300">제목</th>
            <th width="150">작성자</th>
            <th width="150">작성일</th>
            <th width="100">조회수</th>
        </tr>

        <%if(list != null){%>
            <% for(BoardDTO boardDTO : list){%>
                <tr>
                    <td align="center"><%=boardDTO.getSeq()%></td>
                    <td>
                        <%for(int i=0; i<boardDTO.getLev(); i++){%>
                            &emsp;
                        <%}%> <!-- getLev for-->
                        <%if(boardDTO.getPseq()!=0){%>
                            <img src="../img/reply.gif" alt="reply">
                        <%}%> <!--Pseq if -->
                    <%=boardDTO.getTitle()%>
                    </td>
                    <td align="center">
                        <%=boardDTO.getId()%>
                    </td>
                    <td align="center">
                        <%=new SimpleDateFormat("yyyy.MM.dd").format(boardDTO.getLogtime())%>
                    </td>
                    <td align="center">
                        <%=boardDTO.getHit()%>
                    </td>
                </tr>
            <%}%> <!--each for-->
        <%}%><!-- if -->
    </table>

    <div style="text-align:center; width: 850px; position: absolute; z-index: 1000; cursor: pointer">
        <%for (int i=1; i<=totalP; i++){%>
            <%if(i==pg){%>
                <a id="currentPaging" href="boardList.jsp?pg=<%=i%>"><%=i%></a>
            <%}else{%> <!-- ebd if / else -->
                <a id="paging" href="boardList.jsp?pg=<%=i%>"><%=i%></a>
            <%}%> <!-- end else-->
        <%}%> <!-- for -->
    </div>
</body>
</html>
