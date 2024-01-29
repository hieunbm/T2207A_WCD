<%@ page import="wcd.jpa.entities.Classes" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: quanghoatrinh
  Date: 22/01/2024
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <jsp:include page="/layout/css.jsp"/>
</head>
<body>
<jsp:include page="/layout/header.jsp"/>
<div class="container">
    <h1>List Class Demo</h1>
    <%--        <a href="create-student">Create</a>--%>
    <!--  Table students -->
    <table class="table">
        <thead>
        <th>Id</th>
        <th>Name</th>
        <th>Room</th>
        <th>Semester</th>
        <th>Student Count</th>
        <th></th>
        <th></th>
        </thead>
        <tbody>
        <% for (Classes s : (List<Classes>)request.getAttribute("classes")){ %>
        <tr>
            <td><%= s.getId()  %></td>
            <td><%= s.getName()  %></td>
            <td><%= s.getRoom()  %></td>
            <td><%= s.getSemester()  %></td>
            <td><%= s.getStudents().size()  %></td>
            <td><a href="edit-student?id=<%= s.getId() %>">Edit</a> </td>
            <td><a class="text-danger" onclick="deleteStudent(<%= s.getId() %>)" href="javascript:void(0);">Delete</a> </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteStudent(id) {
        if(confirm("Are you sure?")) {
            var url = `list-student?id=` + id;
            fetch(url, {
                method: 'DELETE'
                // body: formData
            }).then(rs => {
                if (confirm("Delete successfully! Reload page?"))
                    window.location.reload();
            }).error(err => {
                alert(err)
            })
        }
    }
</script>
</body>
</html>