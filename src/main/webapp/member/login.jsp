<%@ page import="bean.MemberDTO" %>
<%@ page import="dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/12/24
  Time: 4:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("login_id");
    String password = request.getParameter("login_password");

    MemberDAO memberDAO = MemberDAO.getInstance();
    MemberDTO memberDTO = memberDAO.login(id,password);

    if (memberDTO == null){
        response.sendRedirect("loginFail.jsp");
    }else{
        String email1 = memberDTO.getEmail();
        String email2 = memberDTO.getEmailAddr();
        String email = email1 + "@" + email2;

        session.setAttribute("memName", memberDTO.getName());
        session.setAttribute("memId", id);
        session.setAttribute("eamil", email);
        response.sendRedirect("loginSuccess.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
