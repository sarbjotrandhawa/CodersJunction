
<%@page import="java.sql.*"%>
<head>
    <title>Learning a Education Category Flat Bootstrap Responsive  Website Template | Home :: w3layouts</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Agility  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
          Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500,700,900' rel='stylesheet' type='text/css'>
    <!--google fonts-->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    <style> 
        input[name=search] {
            width: 190px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            background-image: url('images/search.png'); background-size: 26px ;
            background-position: 10px 10px; 
            background-repeat: no-repeat;
            padding: 12px 20px 12px 40px;
            -webkit-transition: width 0.4s ease-in-out;
            transition: width 0.4s ease-in-out;
        }

        input[name=search]:focus {
            width: 60%;
        }
    </style>



    <script>

        function go(obj)
        {
            var search = obj.value;
            if (search != "")
            {
                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {

                        var res = xmlhttp.responseText;

                        document.getElementById("search12").innerHTML = res;

                    }
                };
                xmlhttp.open("GET", "searchresponse.jsp?search=" + search, true);
                xmlhttp.send();
            }

        }
        
        function notsel(obj)
            {
                var qid = obj.id;
                window.location.href = "fetchquestion.jsp?qid=" + qid + "";


            }
        var s = 0;

        function getnot1()
        {
            if (s == 0)
            {
                document.getElementById("notdiv").style.display = "block";
                s = 1;
            }
            else
            {
                document.getElementById("notdiv").style.display = "none";
                s = 0;
            }
        }


    </script>
    <style>
        #notdiv
        {
            display: none;
        }
    </style>
</head>
<div class="header-main" style="background-color: #616f67;">
    <div class="logo">
        <h1><a href="index.jsp"><span class="books"></span>Coders Zone</a></h1>

        <div style="position: absolute;top:15px;left:250px;">
            <input type="text" name="search" placeholder="Search.." style="margin-left: 15%;" onkeyup="go(this)">
            <div id="search12" style="margin-left: 40px; background-color: #fff;">

            </div>
        </div>

    </div>



    <div class="top-nav">
        <span class="menu"> <img src="images/icon.png" alt=""></span>	
        <nav class="cl-effect-21" id="cl-effect-21">   		       											
            <ul class="res">
                <li><a href="index.jsp" class="active">Home</a></li>              						
                <li><a href="fetchcategories.jsp">Categories</a></li>
                    <%
                        if (session.getAttribute("name") == null) {
                    %>
                 <li><a href="allquestions.jsp">Questions</a></li>
                <li><a href="userlogin.jsp">Log In</a></li>	
                <li><a href="usersignup.jsp">Sign Up</a></li>
                    <%
                    } else {
                        String username12 = session.getAttribute("name").toString();

                    %>                                 
                      <li><a href="compilerdemo.jsp">Compiler</a></li>
                <li> <a onclick="getnot1()"><span style="margin: 0;" class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                        <%                                                String username = (String) session.getAttribute("name");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "root");
                            int count = 0;

                            if (username != null) {

                                Statement stmt5 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs5 = stmt5.executeQuery("select COUNT(*) As rowcount from followedusers where user='" + username + "' and status='unseen'");
                                if (rs5.next()) {
                                    count = rs5.getInt("rowcount");
                                }

                                if (count > 0) {
                        %>
                        <span style="background-color: #fff;color:#000;border-radius: 50%;padding: 5px 10px;margin-top: -50px; margin-left: -10px;position: absolute; "><%=count%> </span>              
                        <%
                                }
                            }
                        %>               


                    </a>

                    <div style="position: absolute;width:250px;top:80px;right:100px; display: none; height:300px;z-index: 10000;background-color: #fff;" id="notdiv">
                        <%
                            Statement stmt11 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs11 = stmt11.executeQuery("select * from followedusers where user='" + username + "' and status='unseen'");

                            while (rs11.next()) {
                                String qid = rs11.getString("qid");
                                Statement stmt13 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs13 = stmt13.executeQuery("select * from questions where question_id=" + qid + "");
                                rs13.next();
                                String qtitle = rs13.getString("title");

                        %>
                        <div id="<%=qid%>" class="notsec" onclick="notsel(this)" style="padding:5px" >
                            New Answers have been posted to Question: <span style="color: #1b6d85"><%=qtitle%></span>

                        </div>

                        <%
                            }
                        %>
                    </div></li>						


                <%
                    String name13 = session.getAttribute("name").toString();
                    Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    String photo = "";
                    ResultSet rs3 = stmt3.executeQuery("select * from user where username='" + name13 + "'");
                    if (rs3.next()) {
                        photo = rs3.getString("photo");
                    }
                %>

                 
                <li class="dropdown">
                    <% String username192 = session.getAttribute("name").toString();%>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="<%=photo%>" width="30" height="30" style="border-radius: 50%"><%=username12%><span class="caret"></span></a>
                    <ul class="dropdown-menu" style="background-color: #1b6d85">
                        <li><a href="userprofile.jsp?name=<%=username192%>">My Profile</a></li>
                        <li><a href ="changepassword.jsp">Change Password</a></li>
                        <li><a href ="editprofile.jsp">Edit Profile</a></li>
                        <li><a href ="changeuserphoto.jsp">Change Photo</a></li>
                        <li><a href ="addquestion.jsp">Add Question</a></li>
                        <li><a href ="viewquestions.jsp">View Question</a></li>
                        <li><a href="userlogout.jsp">Logout</a></li>
                    </ul>
                </li>

                <%
                    }
                %>
            </ul>
        </nav>
        <!-- script-for-menu -->
        <script>
            $("span.menu").click(function() {
                $("ul.res").slideToggle(300, function() {
                    // Animation complete.
                });
            });
        </script>
        <!-- /script-for-menu -->

    </div>
    <div class="clearfix"> </div>
</div>
<div style="height:50px;"></div>