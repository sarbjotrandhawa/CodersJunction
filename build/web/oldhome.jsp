<%@page import="java.util.StringTokenizer"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
    <head>
        <title>Home Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            .notsec:hover{
                background-color: #777;   
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
        </script>
        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width: 70%;
                margin: auto;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">Coder's Zone</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="home.jsp">Home</a></li>
                        <li><a href="adminlogin.jsp">Admin</a></li>
                        <li><a href="usersignup.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="userlogin.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <li><a onclick="getnot()"> Notifications
                                <%                                    String username = (String) session.getAttribute("name");
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                                    if (username != null) {

                                        Statement stmt5 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                        ResultSet rs5 = stmt5.executeQuery("select COUNT(*) As rowcount from followedusers where user='" + username + "' and status='unseen'");
                                        int count = 0;
                                        if (rs5.next()) {
                                            count = rs5.getInt("rowcount");
                                        }

                                        if (count > 0) {
                                %>
                                <span style="background-color: #fff;padding: 5px; border-radius: 50%;"><%=count%> </span>              
                                <%
                                        }
                                    }
                                %>               

                            </a>

                            <div style="position: absolute;width:250px;top:40px;left:-10px; display: none; height:300px;z-index: 10000;background-color: #fff;" id="notdiv">
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
                                <div id="<%=qid%>" class="notsec" onclick="notsel(this)" style="padding: 5px">
                                    New Answers have been posted to Question: <span style="color: #1b6d85"><%=qtitle%></span>

                                </div>

                                <%
                                    }
                                %>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <br>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                    <li data-target="#myCarousel" data-slide-to="4"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <img src="images/home1.jpg" alt="Chania" width="460" height="345">
                        <div class="carousel-caption">
                            <h2>Programming</h2>
                            <p>Programming is method to make computer able to execute various tasks</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="images/home3.jpg" alt="Chania" width="460" height="345">
                        <div class="carousel-caption">
                  <h2>C++</h2>
                            <p>C++ is object oriented language</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="images/home4.png" alt="Flower" width="460" height="345">
                        <div class="carousel-caption">
                            <h2>Mixed</h2>
                            <p>Image shows variety of computer languages.</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="images/home5.jpg" alt="Flower" width="460" height="345">
                        <div class="carousel-caption">
                            <h2>ANDROID</h2>
                            <p>Android is mobile operating system</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="images/home6.jpg" alt="Flower" width="460" height="345">
                        <div class="carousel-caption">
                            <h2>JS HTML CSS</h2>
                            <p>Web Based Languages</p>
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" rodata-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="container-fluid"   >


            <div class="row" style="background-color: #fff">
                <div class="col-sm-8" id="showquestions" >

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
                        <div style="text-align: center;float: left;margin-top: 5px; width:10%; border: 1px solid #31b0d5;padding: 2px; margin-right: 10px;"> <span><%=views%></span><br><span> <a href="fetchquestion.jsp?qid=<%=id%>">views</a></span></div>
                        <div style="text-align: center;float: left;margin-top: 5px; width:10%;border: 1px solid #31b0d5;padding: 2px;"><span><%=count%></span><br><span><a href="fetchquestion.jsp?qid=<%=id%>">answers</a></span></div>
                        <div style="float: left;  width:72%; margin-left: 10px;" ><a href="fetchquestion.jsp?qid=<%=id%>"><%=rs.getString("title")%></a><br>


                            <%
                                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs1 = stmt1.executeQuery("select * from user where username='" + name + "'");
                                if (rs1.next()) {
                            %>

                            <div style="float: left;width: 60%; ">

                                <%
                                    while (st.hasMoreTokens()) {
                                %>
                                <span class="label label-danger" style="background-color: #99ccff"><%=st.nextToken()%></span>
                                <%
                                    }
                                %>
                            </div>
                            <div style="float: left; width: 30%; text-align: right;">
                                <a href="userprofile.jsp?name=<%=name%>"> <img src="<%=rs1.getString("photo")%>" width="10" height="10" style="border-radius:50%"></a>
                                    <%}%>
                                <a href="userprofile.jsp?name=<%=name%>" style="font-size: 10px;"><%=name%></a>
                                <br><span style="color:#777;font-size: 8px;"><%=rs.getString("posted_on")%></span>
                            </div>
                        </div>
                        <!--                    <span><a href="">share</a></span>
                                            <span><a href="">follow</a></span>
                        -->

                    </div>

                    <div class="clearfix"></div> 
                    <hr style="border-bottom: 0.5px solid #eeeeee">

                    <% }%>

                </div>

                <div class="col-sm-4" style="background-color: #d9534f">

                    <h4 style="alignment-adjust: central">Technologies</h4>
                    <%
                        Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs3 = stmt3.executeQuery("select * from category");
                        while (rs3.next()) {
                            String cname = rs3.getString("category_name");

                    %>  


                    <div id="<%=cname%>" onclick="getquestions(this)" style="border: 1px solid #000; float: left;width:48%; margin-left: 5px; margin-bottom: 5px;">
                        <img  style="alignment-adjust: central" src="<%=rs3.getString("photo")%>" width="50" height="50"><br>
                        <h5 style="alignment-adjust: central"><%=rs3.getString("category_name")%></h5><br>   


                    </div>

                    <%}%>  
                </div>

            </div>
        </div> 
        <%@include file="footer.jsp" %>
    </body>
</html>
