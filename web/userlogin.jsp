<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>

    </head>
    <body style="background-image: url('images/para.jpg');background-attachment: fixed;background-size: 100% 100%;"> 
        
        <%@include file="header.jsp" %>
        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center;">User Login</h1>

            <form action="userloginresponse.jsp" method="post" class="form-horizontal" >
                <div class="form-group">
                    <label class="control-label col-sm-4"  style="text-align: right;" >Username :</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="username" placeholder="Enter username" required/>
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
                        <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="LOG IN"/>
                        <a href="forgetuserpassword.jsp"><h3 style="color: chartreuse; height: 25px; text-align: center">Forgot Password ?</h3></a>
                    </div>
                </div>

            </form>
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

