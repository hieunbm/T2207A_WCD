<%@ page import="wcd.jpa.entities.Student" %><%--
  Created by IntelliJ IDEA.
  User: quanghoatrinh
  Date: 01/02/2024
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% Student student = (Student) request.getAttribute("student");%>
<h1>Hello <%= student.getName() %></h1>
<h2>Hello Everybody</h2>
</body>
</html>