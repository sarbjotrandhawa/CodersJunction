<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User SignUp</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <script>

            function checkUser()
            {
                var xmlhttp = new XMLHttpRequest();
                var username = document.getElementById("name").value;
                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {

                        var res = xmlhttp.responseText;
                        res = res.trim();
                        if (res == "exist")
                        {

                            document.getElementById("the_form").action = "";
                            document.getElementById("msg").innerHTML = res;


                        }
                        else
                        {
                            document.getElementById("msg").innerHTML = res;
                            document.getElementById("the_form").action = "usersignupresponse.jsp";

                        }

                    }
                };
                xmlhttp.open("GET", "checkuser.jsp?user=" + username, true);
                xmlhttp.send();
            }
            function checkphone()
            {
                var len = document.getElementById("checkph").value.length;
        alert(len);        
        if(len==10)
                {
                    return true;
                }
                else
                {
                    alert("enter valied phone number");
                    return false;
                }
            }
            
            
            
        </script>
        <div class="container">
            <h1 class="jumbotron" style="text-align: center;">User Sign Up</h1>
            <form action="  " id="the_form" method="post" enctype="multipart/form-data" class="form-horizontal" onsubmit="return checkphone()">
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Username :</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="uname" id="name" placeholder="Enter Username" onfocusout="checkUser()" />     <span id="msg"></span>
                    </div>

                </div>                   

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Password :</label>
                    <div class="col-sm-5">
                        <input type="password" name="pwd"  class="form-control" placeholder="Enter Password"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Email :</label>
                    <div class="col-sm-5">
                        <input type="email"  class="form-control" name="email" placeholder="Enter Email"/>
                    </div>
                </div>  

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;" >Phone No. :</label>
                    <div class="col-sm-5">
                        <input type="text"  class="form-control" name="phone" placeholder="Enter Phone No. " id="checkph"/>
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Security Question:</label>
                    <div class="col-sm-5" >
                        <select name="s_ques" >
                            <option>Birth Year ?</option>
                            <option>Birth Place ?</option>
                            <option>Nick Name ?</option>
                            <option>Favourite Color?</option>
                            <option>Favourite fruit?</option>
                        </select>
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;" >Security Answer :</label>
                    <div class="col-sm-5">
                        <input type="text" name="s_ans"  class="form-control" placeholder="Enter Answer"/>
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Photo :</label>
                    <div class="col-sm-5">
                        <input type="file"  class="form-control" name="photo" />
                    </div>
                </div>  

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Sign Up"/>
                    </div>  </div>         
            </form>
        </div>
               
        <%@include file="footer.jsp" %>
    </body>
</html>
