<%@ page import="dao.BoardDAO" %>
<%@ page import="bean.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/12/24
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    String id = (String)session.getAttribute("memId");
    String name = (String)session.getAttribute("memName");
    String email = (String)session.getAttribute("email");

    BoardDTO boardDTO = new BoardDTO();
    boardDTO.setId(id);
    boardDTO.setName(name);
    boardDTO.setEmail(email);
    boardDTO.setTitle(title);
    boardDTO.setContent(content);

    BoardDAO boardDAO = BoardDAO.getInstance();
    boolean isComplete = boardDAO.makeBoard(boardDTO);

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% if (isComplete){ %>
    게시글을 등록하였습니다.
<%}else{%>
    등록에 실패하였습니다. 다시시도하세요
<%}%>


</body>
</html>
