<%-- 
    Document   : adminhome
    Created on : Oct 24, 2016, 12:29:20 PM
    Author     : jatinder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body> 
        <%@include file="header.jsp" %>

        <%            String adminname = (String) session.getAttribute("name");
        %>
        <h1>WELCOME <%=adminname%></h1>
        <a href ="changepassword.jsp">Change Password</a><br>
        <a href ="editprofile.jsp">Edit Profile</a><br>
        <a href ="changeuserphoto.jsp">Change Photo</a><br>
        <a href ="addquestion.jsp">Add Question</a><br>
        <a href ="viewquestions.jsp">View Question</a><br>

        <%String msg1 = request.getParameter("msg");
            if (msg1 != null) {
        %>
        <h1 style="color: red" ><%=msg1%></h1>
        <%
            }
        %>
        <%@include file="footer.jsp" %>
    </body>
</html>
