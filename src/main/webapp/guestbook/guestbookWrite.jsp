<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dao.GuestBookDAO" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/13/24
  Time: 1:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = (String)session.getAttribute("memName");
    String email = (String)session.getAttribute("memEmail");
    String id = (String)session.getAttribute("memId");
    String homepage = request.getParameter("homepage");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Map<String, String> map = new HashMap<>();
    map.put("name", name);
    map.put("email", email);
    map.put("homepage", homepage);
    map.put("title", title);
    map.put("content", content);

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String logtime = dateFormat.format(new Date());
    map.put("logtime", logtime);

    GuestBookDAO guestbookDAO = GuestBookDAO.getInstance();
    boolean isComplete = guestbookDAO.guestbookWrite(map);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    <%if (isComplete){%>
        window.onload = function (){
            alert("작성하신 글을 등록했습니다");
            location.href="guestbookList.jsp?pg=1";
        }
    <%}else{%>
        window.onload = function (){
         alert("글 등록에 실패하였습니다.");
         location.href="guestbookForm.jsp";
        }
    <%}%>
</script>
</body>
</html>
