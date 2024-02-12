<%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/12/24
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
%>
<html>
<head>
    <title>logOut</title>
</head>
<body>
<script>
    window.onload=function (){
        alert("로그아웃")
        location.href="../index.jsp";
    }
</script>
</body>
</html>
