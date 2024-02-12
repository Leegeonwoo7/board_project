<%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/12/24
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = (String)session.getAttribute("memName");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <img src="../img/흰둥이.jpeg" width="50" alt="홈으로" onclick="location.href='../index.jsp'">
    <%=name%>님 환영합니다
    <input type="button" id="update_btn" value="회원정보수정" onclick="location.href='updateForm.jsp'">
    <input type="button" value="로그아웃" onclick="location.href='logOut.jsp'">
</body>
</html>
