
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
    </head>
    <body>  
                <%@include file="adminheader.jsp" %>


        <%          
        
                String adminname = session.getAttribute("adminname").toString();

        %>
        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center">WELCOME <%=adminname%></h1>
            <div style="text-align: center">
        <a href ="updatepassword.jsp">Change Password</a><br>
        <a href ="addcategory.jsp">Add Category</a><br>
        <a href ="viewcategories.jsp">View Categories</a><br>
        <a href ="adminlogout.jsp?name=<%=adminname%>">Logout</a>
        </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
