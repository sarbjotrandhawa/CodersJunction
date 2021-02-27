<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
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
                xmlhttp.open("GET", "changeuserpasswordresponse.jsp?pass=" + oldpwd, true);
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
        <div class="container">
            <h1 class="jumbotron" style="text-align: center;">Change Password</h1>
            <form action="changeuserpasswordresponse.jsp" method="get" onsubmit="return checkconfirm()" class="form-horizontal">

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Username :</label>
                    <div class="col-sm-5">
                        <input type ="text" class="form-control" name="username" value=<%=session.getAttribute("name")%> disabled />
                    </div>

                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Old Password :</label>
                    <div class="col-sm-5">
                        <input type ="password" class="form-control" id ="old" name="pass" placeholder="Enter old password" onfocusout="checkOld()"/>     <span id="oldpwd1"></span>
                    </div>

                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">New Password :</label>
                    <div class="col-sm-5">
                        <input type ="password" class="form-control" id = "newpass" name="newpassword" placeholder="Enter new password" required />     <span id="newpwd"></span>
                    </div>

                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Confirm Password :</label>
                    <div class="col-sm-5">
                        <input type ="password" class="form-control" id="conpass" name="confirmpassword" placeholder="Confirm new password" required />     <span id="confirmpwd"></span>
                    </div>

                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <input type="submit" class="btn btn-default" value="Change" style="width: 100px; text-align: center;text-height: 29px; color: red"/>
                    </div> 

            </form>
            <%@include file="footer.jsp" %>
    </body>
</html>
