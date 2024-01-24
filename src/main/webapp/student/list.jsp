<%--
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
         <th scope="col">First</th>
         <th scope="col">Last</th>
         <th scope="col">Handle</th>
     </tr>
     </thead>
     <tbody>
     <tr>
         <th scope="row">1</th>
         <td>Mark</td>
         <td>Otto</td>
         <td>@mdo</td>
     </tr>
     <tr>
         <th scope="row">2</th>
         <td>Jacob</td>
         <td>Thornton</td>
         <td>@fat</td>
     </tr>
     <tr>
         <th scope="row">3</th>
         <td colspan="2">Larry the Bird</td>
         <td>@twitter</td>
     </tr>
     </tbody>
 </table>
</body>
</html>
