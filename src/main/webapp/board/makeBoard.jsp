<%@ page import="dao.BoardDAO" %>
<%@ page import="bean.BoardDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
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

    Map<String, String> map =new HashMap<>();
    map.put("id", id);
    map.put("name", name);
    map.put("email",email);
    map.put("title",title);
    map.put("content", content);

    BoardDAO boardDAO = BoardDAO.getInstance();
    boolean isComplete = boardDAO.makeBoard(map);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    <% if (isComplete){%>
    window.onload=function (){
        alert("작성하신 글을 등록하였습니다.");
        location.href = "boardList.jsp?pg=1";
    }
    <%}else{%>
    window.onload=function () {
        alert("작성 실패하였습니다 다시시도하세요");
    }
    <%}%>
</script>
</body>
</html>
