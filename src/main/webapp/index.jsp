<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>index</title>
</head>
<body>
<h1>******</h1>
<% if(session.getAttribute("memId")==null){%>
<h2><a href="member/createAccount.jsp">회원가입</a></h2>
<h2><a href="member/loginForm.jsp">로그인</a></h2>
<%}else{%>
<h2><a href="member/logOut.jsp">로그아웃</a></h2>
<h2><a href="member/updateForm.jsp">회원정보수정</a></h2>
<h2><a href="">게시글 작성</a></h2>
<%}%>
</body>
</html>