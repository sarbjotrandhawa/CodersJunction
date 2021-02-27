<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Question</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center;">Add Question</h1>

            <form action="addquestionresponse.jsp" method="get" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Title :</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="title" placeholder="Enter Question Title" required/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Description :</label>
                    <div class="col-sm-5">
                        <textarea rows="5" cols="20" name="description" class="form-control" placeholder="Enter Description" required></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Content :</label>
                    <div class="col-sm-5">
                        <textarea rows="10" cols="20" name="content" class="form-control" placeholder="Enter Content" ></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Keywords :</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="keywords" placeholder="Enter Keywords"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Choose Category :</label>
                    <div class="col-sm-5">
                        <select name="category">
                            <%                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs = stmt.executeQuery("select * from category");

                                while (rs.next()) {

                            %>

                            <option><%=rs.getString("category_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Add"/>
                    </div>

                </div>

            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
