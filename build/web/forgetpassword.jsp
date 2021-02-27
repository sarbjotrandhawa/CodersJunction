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
        <title>Forget Password</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
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
            xmlhttp.open("GET", "fetchsecurityquestion.jsp?p=" + username, true);
            xmlhttp.send();
        }
    </script>
    <style>

        #securityform
        {
            display:none;
        }

    </style>
    <body>
        <%@include file="header.jsp" %>
        <div class="container" > 
            <div>
            <h1 class="jumbotron" style="text-align: center;">Forget Password</h1>
            <div class="form-group">
                <label class="control-label col-sm-4" style="text-align: right;" >Admin Name :</label>
                <div class="col-sm-5">
                    <input id="username" type="text" class="form-control" required/>
                </div><br>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-7">
                    <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" onclick="checkUsername()"/>

                </div><br>
            </div> 
            </div>
            <div id ="securityform" class="form-group">
                <form  action="submitsecurityanswer.jsp" method="get" class="form-horizontal" >
                    <div class="form-group">
                        <label class="control-label col-sm-4" style="text-align: right;" >Security Question :</label>
                        <div class="col-sm-5">
                            <input id="secques" type="text" name="secquestion" class="form-control" readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-4" style="text-align: right;" >Security Answer :</label>
                        <div class="col-sm-5">
                            <input type="text" name="secanswer" class="form-control" placeholder="Enter Security Answer"/>
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-7">
                            <input  type="text" id="hiddenuser" name="username" hidden/>
                            <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Submit"/>
                        </div>
                    </div>     
                </form>
            </div>
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
