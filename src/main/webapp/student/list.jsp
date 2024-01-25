<%@ page import="com.entities.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/22/2024
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
 <jsp:include page="/layout/header.jsp"/>
 <table class="table">
     <thead>
     <tr>
         <th scope="col">#</th>
         <th scope="col">Name</th>
         <th scope="col">Email</th>
         <th scope="col">Address</th>
     </tr>
     </thead>
     <tbody>
     <% for (Student s : (List<Student>)request.getAttribute("students")){ %>
     <tr>
         <th scope="row"><%= s.id %></th>
         <td><%= s.name%></td>
         <td><%= s.email%></td>
         <td><%=s.address%></td>
     </tr>
     <%}%>
     </tbody>
 </table>
</body>
</html>
