<%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/13/24
  Time: 1:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, th, td{
            border: 1px solid black;
            border-collapse: collapse;
        }
        div{
            color: red;
        }
    </style>
</head>
<body>
    <form action="guestbookWirte.jsp" method="post" id="guestbook_form">
        <table>
            <tr>
                <th><label for="name">작성자</label></th>
                <td><input type="text" name="name" id="name" placeholder="작성자 입력"></td>
            </tr>

            <tr>
                <th><label for="email">이메일</label></th>
                <td><input type="email" id="email" name="email" placeholder="이메일 입력"></td>
            </tr>

            <tr>
                <th><label for="homepage">홈페이지</label></th>
                <td><input type="text" id="homepage" name="homepage" value="http://"></td>
            </tr>
            
            <tr>
                <th><label for="title">제목</label></th>
                <td>
                    <input type="text" name="title" id="title" placeholder="제목 입력">
                    <div id="title_message"></div>
                </td>

            </tr>
            
            <tr>
                <th><label for="content">내용</label></th>
                <td>
                    <textarea name="content" id="content"></textarea>
                    <div id="content_message"></div>
                </td>
            </tr>

            <tr>
                <td colspan="3">
                    <input type="button" value="글작성" onclick="create_guestbook()">
                    <input type="reset" value="다시작성">
                    <input type="button" value="글목록" onclick="">
                </td>
            </tr>
        </table>
    </form>

    <script>
        function create_guestbook(){
            document.getElementById('title_message').innerText = "";
            document.getElementById('content_message').innerText = "";

            if(document.getElementById('title').value === ""){
                document.getElementById('title').focus();
                document.getElementById('title_message').innerText = "제목을 입력하세요";
            }else if (document.getElementById('content').value === ""){
                document.getElementById('content').focus();
                document.getElementById('content_message').innerText = "내용을 입력하세요";
            }else{
                document.getElementById("guestbook_form").submit();
            }
        }
    </script>
</body>
</html>
