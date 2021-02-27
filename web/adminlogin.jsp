<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center">Admin Login</h1>

            <form action="adminloginresponse.jsp" method="post" class="form-horizontal" >
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Admin Name :</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="username" placeholder="Enter Admin Name" required/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Password :</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" name="password" Placeholder="Enter Password" required/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Log In"/>
                    </div>
                </div>
            </form>
             <div class="col-sm-2"></div>
        <div style="text-align: center;"><a href="forgetpassword.jsp">Forgot Password</a></div>
            <div style="text-align: center">
            <%String msg1 = request.getParameter("msg");
                if (msg1 != null) {
            %>
            <h1 style="color: red" ><%=msg1%></h1>
            <%
                }
            %>
            </div>
        </div>



       



       
        <%@include file="footer.jsp" %>
    </body>
</html>
