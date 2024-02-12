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


%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%if(memberDTO != null){%>
    <%=memberDTO.getName()%>님 환영합니다<br>
    <tr>
        <td colspan="2">
            <input type="button" onclick="location.href='updateForm.jsp?id=<%=id%>'" value="회원수정">
            <input type="button" onclick="history.back()" value="뒤로가기">
        </td>
    </tr>
<%}else{%>
    회원가입에 실패하였습니다 다시 로그인해주세요
    <input type="button" onclick="history.back()" value="뒤로가기">
<%}%>
</body>
</html>
