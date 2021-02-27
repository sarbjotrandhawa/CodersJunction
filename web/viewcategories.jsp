<%-- 
    Document   : viewcategories
    Created on : Oct 28, 2016, 10:43:05 AM
    Author     : jatinder
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Categories</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="adminheader.jsp" %>
        <div class="container">
            <div style="text-align: center; margin-top: 20px; margin-bottom:20px" class="label-info"><h2>CATEGORIES</h2></div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Category Name</th>
                <th>Description</th>
                <th>Photo</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
                 <%        
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from category ");
                while (rs.next()) {
                    String catname = rs.getString("category_name");
                    String des = rs.getString("description");
                    String photo = rs.getString("photo");
            %>

            <tr>
                <td><%=catname%></td>
                <td><%=des%></td>
                <td><img src="<%=photo%>" height="50" width="50"/></td>
                <td><a href="editcategory.jsp?cn=<%=catname%>&des=<%=des%>&photo=<%=photo%>">Edit</a></td>
                <td><a href="deletecategory.jsp?detail=<%=catname%>">Delete</a></td>
            </tr>


            <%
                }
            %>
            </tbody>
        </table>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
