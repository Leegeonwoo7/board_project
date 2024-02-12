//이메일 메뉴 선택시 값 넣기
// function email_choice_input(){
//     document.getElementById('create_account_email_addr').value =
//         document.getElementById('create_account_email_menu').value;
// }

//ID중복검사
// let isDuplicateChecked = false;
// function validate_duplicate_id(){
//     let id = document.getElementById('create_account_id').value;
//     if(id === ""){
//         document.getElementById('validate_id_message').innerText = "아이디를 먼저 입력하세요";
//     }else{
//         window.open("http://localhost:8080/member/duplicateId.jsp?id="+ id
//             ,"validate_duplicate_id"
//             ,"width=450 height=150 left=300 top=300");
//         isDuplicateChecked = true;
//         alert("중복확인이 완료되었습니다");
//     }
// }

//회원가입 클릭, 유효성검사
// function create_account(){
//     alert("클릭");
//     document.getElementById('validate_name_message').innerText = "";
//     document.getElementById('validate_id_message').innerText = "";
//     document.getElementById('validate_password_message').innerText = "";
//
//     if (document.getElementById('create_account_name').value === ""){
//         document.getElementById('validate_name_message').innerText = "이름을 입력해주세요";
//     }else if(document.getElementById('create_account_id').value === ""){
//         document.getElementById('validate_id_message').innerText = "아이디를 입력해주세요";
//     }else if(document.getElementById('create_account_password').value === "" ||
//         document.getElementById('create_account_password').value !==
//         document.getElementById('create_account_re_password').value){
//         document.getElementById('validate_password_message').innerText = "비밀번호를 확인해주세요";
//     }
// }