<%-- 
    Document   : forgetpassword
    Created on : Oct 27, 2016, 10:28:33 AM
    Author     : jatinder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget User Password</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <style>

        #securityform
        {
            display:none;
        }

    </style>
    <script>
        function checkUsername()
        {

            var xmlhttp = new XMLHttpRequest();
            var username = document.getElementById("username").value;

            xmlhttp.onreadystatechange = function()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {

                    var getquestion = xmlhttp.responseText;
                    getquestion = getquestion.trim();

                    if (getquestion == "false")
                    {
                        alert(username + " doesnot exist");
                    }
                    else
                    {
                        document.getElementById("securityform").style.display = "block";
                        document.getElementById("secques").value = getquestion;
                        document.getElementById("hiddenuser").value = username;
                    }

                }
            };
            xmlhttp.open("GET", "fetchusersecurityquestion.jsp?p=" + username, true);
            xmlhttp.send();
        }
    </script>

    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <h1 class="jumbotron" style="text-align: center;">Forget Password</h1>

            <div class="form-group">
                <label class="control-label col-sm-4" style="text-align: right;" >Enter Username :</label>
                <div class="col-sm-5">
                    <input id="username" class="form-control" type="text" placeholder="Enter username" required/><br>
                </div>

            </div>

            <div class="form-group" >
                <div class="col-sm-offset-4 col-sm-8">
                    <input type="submit" class="btn btn-default" style="width: 100px; text-align: center;text-height: 29px; color: red; margin-bottom: 50px" onclick="checkUsername()" value="Check"/>
                </div> 
                

                <div id="securityform" >
                    <form  action="submitusersecurityanswer.jsp" method="get" class="form-horizontal" style="margin-top: 50px" >
                       
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Security Question :</label>
                            <div class="col-sm-5">
                                <input id="secques" type="text" class="form-control" name="secquestion" readonly />
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" style="text-align: right;">Security Answer :</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="secanswer" />
                            </div>

                        </div>
                        
                        
                        

                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-5">
                                <input  type="text" id="hiddenuser" name="username" hidden/><br>
                                <input type="submit" class="btn btn-default" value="Submit" style="width: 100px; text-align: center;text-height: 29px; color: red; margin-bottom: 50px"/>
                            </div> 



                    </form>
                </div>
                <%String msg1 = request.getParameter("msg");
                    if (msg1 != null) {
                %>
                <h1 style="color: red" ><%=msg1%></h1>
                <%
                    }
                %>
            </div>
            <%@include file="footer.jsp" %>
    </body>
</html>
