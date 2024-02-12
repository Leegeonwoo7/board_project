<%@ page import="bean.MemberDTO" %>
<%@ page import="dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/12/24
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String email1 = request.getParameter("email");
    String email2 = request.getParameter("email_addr");
    String phone = request.getParameter("phone");
    String addr1 = request.getParameter("address_code");
    String addr2 = request.getParameter("address_address");
    String addr3 = request.getParameter("address_address_detail");

    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setId(id);
    memberDTO.setName(name);
    memberDTO.setPassword(password);
    memberDTO.setPhone(phone);
    memberDTO.setEmail(email1);
    memberDTO.setEmailAddr(email2);
    memberDTO.setGender(gender);
    memberDTO.setAddr1(addr1);
    memberDTO.setAddr2(addr2);
    memberDTO.setAddr3(addr3);

    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean isComplete = memberDAO.updateMember(memberDTO);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% if(isComplete){%>
        <h3><%=name%></h3>
        <h3><%=password%></h3>
        <h3><%=gender%></h3>
        <h3><%=email1%></h3>
        <h3><%=email2%></h3>
        <h3><%=phone%></h3>
        <h3><%=addr1%></h3>
        <h3><%=addr2%></h3>
        <h3><%=addr3%></h3>
        <h2>수정완료</h2>
        <button onclick="location.href='loginForm.jsp'">다시로그인 하기</button>
    <%}else{%>
    <h2>수정이 불가능합니다 다시 시도해주세요</h2>
    <%}%>
</body>
</html>
