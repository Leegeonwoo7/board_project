<%@ page import="dao.GuestBookDAO" %>
<%@ page import="bean.GuestBookDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: leegeonwoo
  Date: 2/13/24
  Time: 1:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    GuestBookDAO guestBookDAO = GuestBookDAO.getInstance();

    int pg = Integer.parseInt(request.getParameter("pg"));
    int totalA = guestBookDAO.getTotalA();
    int totalP = (totalA + 1) / 2;

    int endNum = pg*2;
    int startNum = endNum -1;

    List<GuestBookDTO> list = guestBookDAO.guestbookList(startNum, endNum);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form>
        <table>
            <%if(list != null){%>
                <%for(int i=0; i<list.size(); i++) {%>
                    <% GuestBookDTO guestBookDTO = list.get(i); %>
                    <tr>
                        <th>작성자</th>
                        <td><%=guestBookDTO.getName()%></td>
                        <th>작성일</th>
                        <td align="center">
                            <% if(guestBookDTO.getLogtime() != null){%>
                                <%=new SimpleDateFormat("yyyy.MM.dd").format(guestBookDTO.getLogtime())%>
                            <%}%> <!-- end logtime if -->
                        </td>
                    </tr>

                    <tr>
                        <th>이메일</th>
                        <td align="center"><%=guestBookDTO.getEmail()%></td>
                    </tr>

                    <tr>
                        <th>홈페이지</th>
                        <td align="center"><%=guestBookDTO.getHomepage()%></td>
                    </tr>

                <tr>
                    <th>제목</th>
                    <td align="center"><%=guestBookDTO.getTitle()%></td>
                </tr>

                <tr>
                    <td><%=guestBookDTO.getContent()%></td>
                </tr>
                <%} %> <!-- end for -->
            <%}%> <!-- end if -->
        </table>
    </form>
</body>
</html>
