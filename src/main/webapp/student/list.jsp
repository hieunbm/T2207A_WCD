<%@ page import="wcd.jpa.entities.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="wcd.jpa.entities.Subject" %><%--
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
 <a href="create-student"></a>
 <table class="table">
     <thead>
     <tr>
         <th scope="col">#</th>
         <th scope="col">Name</th>
         <th scope="col">Email</th>
         <th scope="col">Address</th>
         <th scope="col">Classes</th>
         <th scope="col">Subjects</th>
         <th scope="col">Action</th>
         <th scope="col">Action</th>
     </tr>
     </thead>
     <tbody>
     <% for (Student s : (List<Student>)request.getAttribute("students")){ %>
     <tr>
         <th scope="row"><%= s.getId() %></th>
         <td><%= s.getName()%></td>
         <td><%= s.getEmail()%></td>
         <td><%=s.getAddress()%></td>
         <td><%=s.getClasses().getName()%></td>
         <td>
             <ul>
                 <% for (Subject j: s.getSubjects()){ %>
                 <li><%= j.getName() %></li>
                 <% }%>
             </ul>
         </td>
         <td><a href="edit-student?id=<%=s.getId()%>">Edit</a></td>
         <td><a class="text-danger" onclick="deleteStudent(<%=s.getId()%>)" href="javascript:void(0);">Delete</a></td>
     </tr>
     <%}%>
     </tbody>
 </table>
 <script type="text/javascript">
     function deleteStudent(id) {
         var url = `list-student?id=`+id;
         fetch(url,{
             method: 'DELETE'
             // body: formData
         }).then(rs=>{
             if(confirm("Reload page?"))
                 window.location.reload();
         }).error(err=>{
             alert(err)
         })
     }
 </script>
</body>
</html>
