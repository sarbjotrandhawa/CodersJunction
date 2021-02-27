
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Questions</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center;">My Questions</h1>
            <%            String name = (String) session.getAttribute("name");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from questions where posted_by='" + name + "'");

                while (rs.next()) {
            %>

            <div>
                <h1><a href="fetchquestion.jsp?qid=<%=rs.getString("question_id")%>"><%=rs.getString("title")%></a></h1>
                <p><%=rs.getString("description")%></p>
                <%
                    String catname = rs.getString("category_name");
                    String quesid = rs.getString("question_id");
                    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                    ResultSet rs1 = stmt1.executeQuery("select * from category where category_name='" + catname + "'");
                    if (rs1.next()) {
                %>
                <span class="label label-warning"> <a href = "editquestion.jsp?qid=<%=quesid%>">Edit</a></span>
                <span class="label label-danger"> <a href = "deletequestion.jsp?qid=<%=quesid%>">Delete</a></span>


                <div style="text-align: right">
                    <span><a href="viewcategoryquestions.jsp?cate=<%=catname%>"><img src= "<%=rs1.getString("photo")%>" width="40" height="40"/><%=catname%></a></span><br>
                            <%
                                }


                            %>
                    <span><%=rs.getString("posted_on")%></span>  
                </div>
            </div><br><hr>
            <%
                }
            %>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
