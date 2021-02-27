<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Profile Photo</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body style="overflow: hidden">
        <%@include file="header.jsp" %>
        <%            String name = (String) session.getAttribute("name");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from user where username='" + name + "'");
            String pic = "";
            if (rs.next()) {
                pic = rs.getString("photo");
            }
        %>
        <div class="container" >
            <h1 class="jumbotron" style="text-align: center;">Change Profile Photo</h1>
            <form action ="changeuserphotoresponse.jsp" method="post" enctype="multipart/form-data" class="form-horizontal">

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Current Photo</label>
                    <div class="col-sm-5">
                        <img src="<%=pic%>"  class="img-thumbnail" alt="Current Photo" width="154" height="106"/>
                    </div>
                </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" style="text-align: right;">Choose New Photo</label>
                        <div class="col-sm-5">
                            <input  type="file"  name="photo" />
                        </div>
                    </div>
                        <br>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: black" value="Change"/>
                            </div> 


                            </form>
                        </div>
                        
                    </div>
                        <%@include file="footer.jsp" %>
                        </body>
                        </html>
