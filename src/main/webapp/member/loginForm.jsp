<%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/12/24
  Time: 4:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="login.jsp" id="login_form" method="post">
        <table>
            <tr>
                <th><label for="login_id">아이디</label></th>
                <td><input type="text" name="login_id" id="login_id"></td>
            </tr>
            <tr>
                <th><label for="login_password">비밀번호</label></th>
                <td><input type="password" name="login_password" id="login_password"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" onclick="login()" value="로그인">
                    <input type="button" onclick="location.href='createAccount.jsp'" value="회원가입">
                </td>
            </tr>
        </table>
    </form>

    <script>
        function login(){
            document.getElementById('login_form').submit();
        }
    </script>
</body>
</html>
