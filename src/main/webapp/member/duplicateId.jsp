<%@ page import="dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/11/24
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean validate = memberDAO.isValidateId(id);
%>
<html>
<head>
    <title>아이디 중복검사</title>
</head>
<body>
    <%if(validate){ %>
        <form action="duplicateId.jsp">
            <font color="red"><strong>선택하신 아이디 <%=id%>은 사용 불가능</strong></font>
            <br>
            아이디 <input type="text" name="id">
                 <input type="submit" value="중복체크">
        </form>
    <%}else{%>
        <font color="blue"><strong>선택하신 아이디 <%=id%> 는 사용가능</strong></font>
        <br><br>
        <input type="button" value="사용하기" onclick="closeWindow('<%=id%>')">
    <%}%>

<script>
    function closeWindow(id){
        opener.document.getElementById("create_account_id").value = id;
        window.close();
    }
</script>
</body>
</html>