<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Password</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="adminheader.jsp" %>
        <script>

            function checkOld()
            {
                var xmlhttp = new XMLHttpRequest();
                var oldpwd = document.getElementById("old").value;
                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {

                        document.getElementById("oldpwd1").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", "changepasswordresponse.jsp?pass=" + oldpwd, true);
                xmlhttp.send();
            }

            function checkconfirm()
            {
                var newpass = document.getElementById("newpass").value;
                var conpass = document.getElementById("conpass").value;
                if (newpass == conpass)
                {
                    return true;
                }
                else
                {
                    document.getElementById("confirmpwd").innerHTML = "password not Matched";
                    return false;

                }
            }
        </script>
        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center;">Admin Change Password</h1>
            <form action="changepasswordresponse.jsp" method="get" onsubmit="return checkconfirm()" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Admin Name :</label>
                    <div class="col-sm-5">
                        <input type ="text" name="username" class="form-control" value=<%=session.getAttribute("name")%> disabled="true"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;" >Old Password :</label>
                    <div class="col-sm-5">
                        <input type ="password" id ="old" class="form-control" Placeholder="Enter Old Password" name="pass" onfocusout="checkOld()"/><span id="oldpwd1" style ="color: red"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;" >New Password :</label>
                    <div class="col-sm-5">
                        <input type ="password" id = "newpass" class="form-control" Placeholder="Enter New Password" name="newpassword" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;" >Confirm Password :</label>
                    <div class="col-sm-5">
                        <input type ="password" id="conpass" class="form-control" Placeholder="Confirm New Password" name="confirmpassword" required />
                        <span id="confirmpwd" style ="color: red"></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Change"/>
                    </div>
                </div>

            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
