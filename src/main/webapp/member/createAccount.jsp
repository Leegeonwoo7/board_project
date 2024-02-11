<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
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
<form action="#" id="create_account_form" method="post">
    <table>
        <tr>
            <th><label for="create_account_name">이름</label></th>
            <td>
                <input type="text" name="name" id="create_account_name" placeholder="이름입력">
                <div id="validate_name_message"></div>
            </td>
        </tr>

        <tr>
            <th><label for="create_account_id">아이디</label></th>
            <td>
                <input type="text" name="id" id="create_account_id" placeholder="ID입력">
                <input type="button" onclick="validate_duplicate_id()" value="중복검사">
                <div id="validate_id_message"></div>
            </td>
        </tr>


        <tr>
            <th><label for="create_account_password">비밀번호</label></th>
            <td>
                <input type="password" name="password" id="create_account_password" placeholder="비밀번호 입력">
                <div id="validate_password_message"></div>
            </td>
        </tr>

        <tr>
            <th><label for="create_account_re_password">재확인</label></th>
            <td><input type="password" name="re_password" id="create_account_re_password" placeholder="비밀번호 입력"></td>
        </tr>

        <tr>
            <th>성별</th>
            <td>
                <input type="radio" name="gender" id="male" value="0" checked="checked">
                <label for="male">남자</label>
                <input type="radio" name="gender" id="female" value="1">
                <label for="female">여자</label>
            </td>
        </tr>

        <tr>
            <th><label for="create_account_email">이메일</label></th>
            <td>
                <input type="text" name="email" id="create_account_email" placeholder="이메일 입력">
                <label for="create_account_email_addr">@</label>
                <input type="text" name="email_addr" id="create_account_email_addr" placeholder="주소입력">
                <select name="email_menu" id="create_account_email_menu" oninput="email_choice_input()">
                    <option value="직접입력">직접입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="gmail.com">gamile.com</option>
                    <option value="hanmail.com">hanmail.com</option>
                </select>
            </td>
        </tr>

        <tr>
            <th><label for="create_account_phone">휴대폰</label></th>
            <td><input type="text" name="phone" id="create_account_phone" placeholder="-는 제외하고 입력"></td>
        </tr>

        <tr>
            <th><label for="create_account_address">주소</label></th>
            <td>
                <input type="text" name="address-code" id="create_account_address_code">
                <!-- 카카오 API 추가-->
                <input type="button" onclick="" value="우편번호검색">
                <br>
                <input type="text" name="address-address" id="create_account_address" placeholder="주소"><br>
                <input type="text" name="address-address-detail" id="create_account_address_detail" placeholder="상세주소"><br>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" onclick="create_account()" value="회원가입">
                <input type="reset" value="다시작성">
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript">
    function create_account(){
        document.getElementById('validate_name_message').innerText = "";
        document.getElementById('validate_id_message').innerText = "";
        document.getElementById('validate_password_message').innerText = "";

        if (document.getElementById('create_account_name').value === ""){
            document.getElementById('create_account_name').focus();
            document.getElementById('validate_name_message').innerText = "이름을 입력해주세요";
        }else if(document.getElementById('create_account_id').value === ""){
            document.getElementById('create_account_id').focus();
            document.getElementById('validate_id_message').innerText = "아이디를 입력해주세요";
        }else if(document.getElementById('create_account_password').value === "" ||
            document.getElementById('create_account_password').value !==
            document.getElementById('create_account_re_password').value){
            document.getElementById('create_account_password').focus();
            document.getElementById('validate_password_message').innerText = "비밀번호를 확인해주세요";
        }else{
            document.getElementById('create_account_form').submit();
        }
    }

    function email_choice_input(){
        document.getElementById('create_account_email_addr').value =
            document.getElementById('create_account_email_menu').value;
    }

    //ID중복검사
    function validate_duplicate_id(){
        let isDuplicateChecked = false;
        let id = document.getElementById('create_account_id').value;
        if(id === ""){
            document.getElementById('validate_id_message').innerText = "아이디를 먼저 입력하세요";
        }else{
            window.open("http://localhost:8080/member/duplicateId.jsp?id="+ id
                ,"validate_duplicate_id"
                ,"width=450 height=150 left=300 top=300");
            isDuplicateChecked = true;
            alert("중복확인이 완료되었습니다");
        }

    }
</script>

</body>
</html>