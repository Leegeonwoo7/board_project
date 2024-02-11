<%@ page import="bean.MemberDTO" %>
<%@ page import="dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/12/24
  Time: 2:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String email_addr = request.getParameter("email_addr");
    String phone = request.getParameter("phone");
    String address_code = request.getParameter("address_code");
    String address_address = request.getParameter("address_address");
    String address_address_detail = request.getParameter("address_address_detail");

    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setName(name);
    memberDTO.setId(id);
    memberDTO.setPassword(password);
    memberDTO.setGender(gender);
    memberDTO.setEmail(email);
    memberDTO.setEmailAddr(email_addr);
    memberDTO.setPhone(phone);
    memberDTO.setAddr1(address_code);
    memberDTO.setAddr2(address_address);
    memberDTO.setAddr3(address_address_detail);

    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean isSuccess = memberDAO.makeAccount(memberDTO);
%>
<html>
<head>
    <title>회원가입 성공여부</title>
</head>
<body>
<% if(isSuccess){ %>
    회원가입에 성공하였습니다.
    <input type="button" onclick="location.href='loginForm.jsp'" value="로그인">
<%}else{%>
    회원가입에 실패하였습니다
<%}%>

</body>
</html>
