<%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/12/24
  Time: 10:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 작성</title>
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
    <form action="makeBoard.jsp" method="post" id="board_form">
        <table>
            <tr>
                <th><label for="title">제목</label></th>
                <td>
                    <input type="text" maxlength="255" name="title" id="title">
                    <div id="title_message"></div>
                </td>
            </tr>

            <tr>
                <th><label for="content">내용</label></th>
                <td>
                    <textarea name="content" id="content" maxlength="4000"></textarea>
                    <div id="content_message"></div>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="글쓰기" onclick="create_board()">
                    <input type="reset" value="다시작성">
                </td>
            </tr>
        </table>
    </form>
<script>
    function create_board(){
        document.getElementById('title_message').innerText = "";
        document.getElementById('content_message').innerText = "";

        if(document.getElementById('title').value === ""){
            document.getElementById('title').focus();
            document.getElementById('title_message').innerText = "제목을 입력하세요";
        }else if(document.getElementById('content').value === ""){
            document.getElementById('content').focus();
            document.getElementById('title_message').innerText = "제목을 입력하세요";
        }else{
            document.getElementById('board_form').submit();
        }
    }
</script>
</body>
</html>
