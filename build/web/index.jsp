
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*"%>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
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
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <script src="js/bootstrap.min.js" type="text/javascript"></script> 
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
            function getquestions(obj)
            {
                var category = obj.id;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("showquestions").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", "gettechnologyquestions.jsp?cate=" + category, true);
                xmlhttp.send();
            }
            function notsel(obj)
            {
                var qid = obj.id;
                window.location.href = "fetchquestion.jsp?qid=" + qid + "";


            }
            var s = 0;

            function getnot()
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



            function myFunction() {
                setInterval(function() {
                    window.location = "index.jsp";
                }, 90000);
            }
        </script>


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

        </script>        
    </head>
    <body onload="myFunction()">





        <div style="position: absolute;top:20px;left:350px;">
            <input type="text" name="search" placeholder="Search.." style="margin-left: 15%;" onkeyup="go(this)">
            <div id="search12" style="margin-left: 40px; background-color: #fff;">

            </div>
        </div>

        <!--header strat here-->
        <div class="banner agileits">
            <div class="header">
                <div class="container">
                    <div class="header-main">
                        <div class="logo">
                            <h1><a href="index.jsp"><span class="books"></span>Coders Zone</a></h1>

                        </div>


                        <div class="top-nav">
                            <span class="menu"> <img src="images/icon.png" alt=""></span>	
                            <nav class="cl-effect-21" id="cl-effect-21">   		       											
                                <ul class="res">
                                    <li><a href="index.jsp" class="active">Home</a></li>




                                    <%
                                        if (session.getAttribute("name") == null && session.getAttribute("adminname") == null) {


                                    %>
                                    <li><a href="fetchcategories.jsp">Categories</a></li>
                                    <li><a href="allquestions.jsp">Questions</a></li>
                                    <li><a href="userlogin.jsp">Log In</a></li>	
                                    <li><a href="usersignup.jsp">Sign Up</a></li>
                                        <%                                        } else if (session.getAttribute("name") != null) {
                                            String username12 = session.getAttribute("name").toString();

                                        %>                                 

                                    <li><a href="fetchcategories.jsp">Categories</a></li>
                                    <li><a href="compilerdemo.jsp">Compiler</a></li>

                                    <li> <a onclick="getnot()"><span style="margin: 0;" class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                            <%                                                String username = (String) session.getAttribute("name");
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                                                int count = 0;

                                                if (username != null) {

                                                    Statement stmt5 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                                    ResultSet rs5 = stmt5.executeQuery("select COUNT(*) As rowcount from followedusers where user='" + username + "' and status='unseen'");
                                                    if (rs5.next()) {
                                                        count = rs5.getInt("rowcount");
                                                    }
                                                    System.out.println("count is : " + count);
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
                                            <div id="<%=qid%>" class="notsec" onclick="notsel(this)" style="padding: 5px" >
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
                                    } else {

                                        String name13 = session.getAttribute("adminname").toString();

                                    %>

                                    <li><a href="viewcategories.jsp">Categories</a></li>
                                    <li><a href ="addcategory.jsp">Add Category</a></li>

                                    <li class="dropdown">

                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=name13%><span class="caret"></span></a>
                                        <ul class="dropdown-menu" style="background-color: #1b6d85">                        

                                            <li><a href ="updatepassword.jsp">Change Password</a></li>
                                            <li><a href="adminlogout.jsp">Logout</a></li>
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
                    </div><div style="height:50px;"></div>
                    <!-- /copy start -->
                    <div class="container">

                        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="border:solid #fff40c thick; height: 460px">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                                <li data-target="#myCarousel" data-slide-to="3"></li>
                                <li data-target="#myCarousel" data-slide-to="4"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox" >

                                <div class="item active" style="height: 438px;width:300">
                                    <img src="images/home1.jpg" alt="Chania" height="350" width="1200" >
                                    <div class="carousel-caption">
                                        <h2 style="color: #c7254e">Programming</h2>
                                        <p>Programming is method to make computer able to execute various tasks</p>
                                    </div>
                                </div>

                                <div class="item" style="height: 438px;width:300">
                                    <img src="images/home3.jpg" alt="Chania" height="350" width="1200">
                                    <div class="carousel-caption">
                                        <h2 style="color: #c7254e">C++</h2>
                                        <p>C++ is object oriented language</p>
                                    </div>
                                </div>

                                <div class="item" style="height: 438px;width:300">
                                    <img src="images/home4.png" alt="Flower" height="350" width="1200">
                                    <div class="carousel-caption">
                                        <h2 style="color: #c7254e">Mixed</h2>
                                        <p>Image shows variety of computer languages.</p>
                                    </div>
                                </div>

                                <div class="item" style="height: 438px;width:300">
                                    <img src="images/home5.jpg" alt="Flower" height="350" width="1200">
                                    <div class="carousel-caption">
                                        <h2 style="color: #c7254e">ANDROID</h2>
                                        <p>Android is mobile operating system</p>
                                    </div>
                                </div>

                                <div class="item" style="height: 438px;width:300">
                                    <img src="images/home6.jpg" alt="Flower" height="350" width="1200">
                                    <div class="carousel-caption">
                                        <h2 style="color: #c7254e">JS HTML CSS</h2>
                                        <p>Web Based Languages</p>
                                    </div>
                                </div>

                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <!-- /copy ends -->
                </div>
            </div>
        </div>
        <!--header end here-->
        <!-- FlexSlider -->
        <script defer src="js/jquery.flexslider.js"></script>
        <script type="text/javascript">
                                $(function() {
                                });
                                $(window).load(function() {
                                    $('.flexslider').flexslider({
                                        animation: "slide",
                                        start: function(slider) {
                                            $('body').removeClass('loading');
                                        }
                                    });
                                });
        </script>
        <!-- FlexSlider -->
        <!--banner end here-->
        <!--educate logos start here-->
        <div class="educate alert-success">
            <div class="container">
                <div class="education-main alert-success" >
                    <ul class="ch-grid">

                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");

                            Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs3 = stmt3.executeQuery("select * from category");

                            int i = 0;
                            while (rs3.next()) {
                                i++;
                                String cname = rs3.getString("category_name");

                        %>
                        <div class="col-md-3 w3agile alert-success">
                            <li>
                                <div class="ch-item" id="<%=cname%>" onclick="getquestions(this)" >				
                                    <div class="ch-info">
                                        <div class="ch-info-front ch-img-1">
                                            <span class="glyphicon glyphicon-grain" aria-hidden="true"> </span>
                                            <h5><%=cname%></h5>
                                        </div>
                                        <div class="ch-info-back" style="background-color: #fff40c">                                          
                                            <p><img src="<%=rs3.getString("photo")%>" width="50" height="50"/></p>
                                            <p style="background-color: #c7254e"><%=rs3.getString("description")%></p>
                                        </div>	
                                    </div>
                                </div>
                                    
                            </li>
                        </div> 
                
                <%
                    if(i==3)
                    {
                      %>  <a href="fetchcategories.jsp"> 
                <div class="col-md-3 w3agile">
                            <li>
                                <div class="ch-item">				
                                    <div class="ch-info">
                                        <div class="ch-info-front ch-img-1">
                                            <span class="glyphicon glyphicon-grain" aria-hidden="true"> </span>
                                            <h5>View More</h5>
                                        </div>
                                        <div class="ch-info-back" style="background-color: #fff40c;">
                                            <p style="margin-top: 25px"><img src="./images\viewmore.png" width="150" height="150"/></p>
                                            
                                        </div>	
                                    </div>
                                </div>
                            </li>
                </div> </a>
                   <% 
                    }
                    if (i == 3) {
                                    break;
                                }
                            }
                %>
<!--                       <%
//                                if (i == 4) {
//                                    break;
//                                }
//                            }
                        %> -->
                        <div class="clearfix"> </div>
                    </ul>
                </div>
            </div>
        </div>
        <!--educate logos end here-->
        <script src="js/responsiveslides.min.js"></script>
        <script>
                                    // You can also use "$(window).load(function() {"
                                    $(function() {
                                        $("#slider2").responsiveSlides({
                                            auto: true,
                                            pager: true,
                                            speed: 300,
                                            namespace: "callbacks",
                                        });
                                    });
        </script>

        <!--clients star here-->

        <div class="container-fluid alert-success" style="margin-bottom: -100px">
            <div class="row " ><h1 style="margin-left: 115px">Recent Questions</h1>
                <div class="col-sm-1 alert-success"  ></div>
                <div class="col-sm-10 " id="showquestions" style="max-height: 500px; overflow-y: scroll;background-color: #ffffff;">
                    
                    <%
                        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs = stmt.executeQuery("select * from questions order by posted_on desc");
                        StringTokenizer st;
                        while (rs.next()) {
                            String name = rs.getString("posted_by");
                            String id = rs.getString("question_id");
                            int views = rs.getInt("views");
                            String keyword = rs.getString("keywords");
                            st = new StringTokenizer(keyword, ",");

                            Statement stmt5 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs5 = stmt5.executeQuery("select  COUNT(*) As anscount from answers where question_id='" + id + "'");

                            int count = 0;
                            rs5.next();
                            count = rs5.getInt("anscount");


                    %>  
                    <br>
                    <div>
                        <div style="text-align: center;float: left;margin-top: 5px; width:10%; border: 1px solid #31b0d5;padding: 2px; margin-right: 10px;"> <span><%=views%></span><br><span> <a href="fetchquestion.jsp?qid=<%=id%>">Views</a></span></div>
                        <div style="text-align: center;float: left;margin-top: 5px; width:10%;border: 1px solid #31b0d5;padding: 2px;"><span><%=count%></span><br><span><a href="fetchquestion.jsp?qid=<%=id%>">Answers</a></span></div>
                        <div style="float: left;  width:72%; margin-left: 10px;" ><a href="fetchquestion.jsp?qid=<%=id%>" title="Title" style="font-size: 25px"><b><%=rs.getString("title")%></b></a><br>


                            <%
                                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs1 = stmt1.executeQuery("select * from user where username='" + name + "'");
                                if (rs1.next()) {
                            %>

                            <div style="float: left;width: 60%; ">

                                <%
                                    while (st.hasMoreTokens()) {
                                %>
                                <span class="label label-default" ><%=st.nextToken()%></span>
                                <%
                                    }
                                %>
                            </div>
                            <div style="float: left; width: 30%; text-align: right;">
                                <a href="userprofile.jsp?name=<%=name%>"> <img src="<%=rs1.getString("photo")%>" width="25" height="25" style="border-radius:50%" title="Posted By"></a>
                                    <%}%>
                                <a href="userprofile.jsp?name=<%=name%>" style="font-size: 15px;" title="Posted By"><%=name%></a>
                                <br><span style="color:#777;font-size: 10px;" title="Posted On"><%=rs.getString("posted_on")%></span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div> 
                    <hr style="border-bottom: 0.5px solid #eeeeee">
                    <% }%>
                </div>
<div class="col-sm-1 alert-success"  ></div>
            </div>


        </div>

        <!--clients end here-->
        <!--footer start here-->

        <!--footer end here-->		
        <%@include file="footer.jsp" %>
    </body>
</html>