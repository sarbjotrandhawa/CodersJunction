<%-- 
    Document   : fetchanswer
    Created on : Nov 10, 2016, 12:16:47 PM
    Author     : jatinder
--%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Details</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>

            function viewincrement(obj)
            {
                var qid = obj;

                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var count = xmlhttp.responseText();

                    }
                };
                xmlhttp.open("GET", "viewincrement.jsp?qid=" + qid, true);
                xmlhttp.send();
            }

            function go12()
            {

 
                var name = document.getElementById("uname").value;
                
                if (name == "null")
                {
                    alert("you are not logged in");

                }
                else
                {

                    var answer = document.getElementById("ans").value;
                    var qid = document.getElementById("q_id").value;
alert(answer);
                    if (answer != "")
                    {
                        
                        var count = answer.split('\n');
                        alert(count);
                        for(var i=1;i<=count.length;i++)
                        {
                            answer = answer.replace('\n','!@');
                        }
                        
                        answer = answer.replace('\n','!@');
                        var xmlhttp = new XMLHttpRequest();
                        
                        xmlhttp.onreadystatechange = function()
                        {
                            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                            {
                                var data = document.getElementById("postedans").innerHTML;
                                
                                data = data + xmlhttp.responseText;
                                document.getElementById("postedans").innerHTML = data;

                            }
                        };
                        xmlhttp.open("GET", "postedanswerresponse.jsp?qid=" + qid + "&ans=" + answer, true);
                        xmlhttp.send();
                        document.getElementById("ans").value = "";

                    }
                    else
                    {
                        alert("Field can not be empty");
                    }

                }
            }

            function likego(obj)
            {

                var status = document.getElementById(obj.id).value;
                var name = document.getElementById("uname").value;
                var aid = obj.id;
                var count = document.getElementById("cont" + aid).innerHTML;

                if (name == "null")
                {
                    alert("First login for like the answer");
                }
                else
                {
                    var xmlhttp = new XMLHttpRequest();

                    xmlhttp.onreadystatechange = function()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            var getres = xmlhttp.responseText.trim();


                            if (getres == "liked")
                            {
                                document.getElementById(obj.id).value = "liked";

                                count++;
                                document.getElementById("cont" + aid).innerHTML = count;
                            }
                            else
                            {

                                document.getElementById(obj.id).value = "like";

                                count = count - 1;
                                document.getElementById("cont" + aid).innerHTML = count;
                            }
                        }
                    };
                    xmlhttp.open("GET", "likeanswer.jsp?msg=" + aid + "&status=" + status + "", true);
                    xmlhttp.send();

                }
            }

            function followlogic(obj)
            {
                var status = document.getElementById(obj.id).value;

                var name = document.getElementById("uname").value;

                var qid = obj.id;

                var count = document.getElementById("cont" + qid).innerHTML;

                if (name == "null")
                {
                    alert("First login for Follow the Question");
                }
                else
                {
                    var xmlhttp = new XMLHttpRequest();

                    xmlhttp.onreadystatechange = function()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            var getres = xmlhttp.responseText.trim();
                            if (getres == "followed")
                            {
                                document.getElementById(obj.id).value = "followed";

                                count++;
                                document.getElementById("cont" + qid).innerHTML = count;
                            }
                            else
                            {

                                document.getElementById(obj.id).value = "follow";

                                count = count - 1;
                                document.getElementById("cont" + qid).innerHTML = count;
                            }
                        }
                    };
                    xmlhttp.open("GET", "followquestion.jsp?msg=" + qid + "&status=" + status + "", true);
                    xmlhttp.send();

                }
            }



        </script>


    </head>

    <%        String quesid = request.getParameter("qid");
    %>

    <body onload="viewincrement(<%=quesid%>)">
        <%@include file="header.jsp" %>
        <div class="container-fluid">

            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">

                    <%

                        String username = (String) session.getAttribute("name");

                        if (username != null) {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs = stmt.executeQuery("select * from followedusers where user='" + username + "' and qid=" + quesid + " and status='unseen'");
                            if (rs.next()) {
                                String s = "seen";
                                rs.updateString("status", s);
                                rs.updateRow();
                                System.out.println("done");
                                response.sendRedirect("fetchquestion.jsp?qid="+quesid);
                            }
                        } 

                        
                    %>
                    <input type="hidden" value="<%=username%>" id="uname">
                    <%

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs = stmt.executeQuery("select * from questions where question_id='" + quesid + "'");
                        rs.next();
                    %>
                    <div style="padding:5px 10px;">
                        <div class="row">
                            <div class="col-sm-8">

                                <h2><%=rs.getString("title")%></h2>

                            </div><div class="col-sm-4">
                                <a href="viewcategoryquestions.jsp?cate=<%=rs.getString("category_name")%> " style="text-decoration: none;"><h3 style="text-align: right;"><%=rs.getString("category_name")%></h3></a>


                            </div>
                        </div>
                        <div class="row">

                            <div class="col-sm-12" style="background: silver; padding: 10px;margin: 10px;">

                                <%=rs.getString("description")%>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-sm-12" style="background: #ccccff; padding: 10px;margin: 10px;">

                                <label><%=rs.getString("content")%></label><br><br>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-sm-8">

                                <%
                                    String keyword = rs.getString("keywords");
                                    StringTokenizer st = new StringTokenizer(keyword, ",");
                                %>
                                <span>
                                    <%
                                        while (st.hasMoreTokens()) {

                                    %>     
                                    <label class="label label-danger" style="background: #9d9d9d;"> <%=st.nextToken()%></label>   

                                    <%}%></span>


                            </div>
                            <div class="col-sm-4" style="text-align: right;padding: 0;margin: 0;">



                                <%                String name = rs.getString("posted_by");
                                    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                    ResultSet rs1 = stmt1.executeQuery("select * from user where username='" + name + "'");
                                    if (rs1.next()) {
                                %>

                                <a href="userprofile.jsp?name=<%=rs1.getString("username")%>"><img src="<%=rs1.getString("photo")%>" width="35" height="35" style="border-radius: 50%"></a>

                                <%}%>
                                <a href="userprofile.jsp?name=<%=rs1.getString("username")%>"><%=rs1.getString("username")%></a><br>
                                <%=rs.getString("posted_on")%>


                            </div>
                        </div>
                        <%
                            Statement stmt7 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs7 = stmt7.executeQuery("select COUNT(*) As followcount from followquestiontable where questionid='" + quesid + "'");
                            rs7.next();
                            int count1 = rs7.getInt("followcount");

                        %>
                        <div class="row">


                            <div class="col-sm-12" >

                                <span id="cont<%=quesid%>" ><%=count1%></span>
                                <%
                                    if (session.getAttribute("name") != null) {
                                        String usernames = session.getAttribute("name").toString();

                                        Statement stmt6 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                        ResultSet rs6 = stmt6.executeQuery("select * from followquestiontable where followedby='" + usernames + "' and questionid=" + quesid + "");
                                        if (rs6.next()) {
                                %>

                                <input type="button" value="followed" onclick="followlogic(this)" style="background: #1b6d85;color: #fff;border: none;" id="<%=quesid%>"/>

                                <%

                                } else {
                                %>

                                <input type="button" value="follow" onclick="followlogic(this)" style="background: #1b6d85;border: none;color: #fff;" id="<%=quesid%>"/>

                                <%
                                    }
                                } else {
                                %>


                                <input type="button" value="follow" onclick="followlogic(this)" style="background: #1b6d85;border: none;" id="<%=quesid%>"/>
                                <%
                                    }

                                %>

                                <input type ="button" style="background: #1b6d85;border: none;" value="share">

                            </div>

                        </div>



                    </div>
                    <hr style="border: 1px solid #000;">

                    <h2>Answers</h2><hr>
                    <div id="postedans" >
                        <%                            Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs2 = stmt2.executeQuery("select * from answers where question_id='" + quesid + "'");
                            while (rs2.next()) {
                                String photo = "";
                                String uname = rs2.getString("posted_by");
                                String ansid = rs2.getString("answer_id");
                                Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs3 = stmt3.executeQuery("select * from user where username='" + uname + "'");
                                if (rs3.next()) {
                                    photo = rs3.getString("photo");
                                }

                                Statement stmt4 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs4 = stmt4.executeQuery("select COUNT(*) As rowcount from like_table where answer_id='" + ansid + "'");
                                rs4.next();
                                int count = rs4.getInt("rowcount");
                                String ans = rs2.getString("answer");
                                ans = ans.replace("!@","\r\n");
                        %>



                        <div  id="ansdiv">                    
                            <xmp> <%= ans %></xmp><br>
                            
                            <div class="row">
                                <div class="col-sm-8" style="margin-top: 10px;">
                                    <span id="cont<%=ansid%>"><%=count%></span>


                                    <%
                                        if (session.getAttribute("name") != null) {
                                            String usernames = session.getAttribute("name").toString();

                                            Statement stmt5 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs5 = stmt5.executeQuery("select * from like_table where liked_by='" + usernames + "' and answer_id=" + ansid + "");
                                            if (rs5.next()) {
                                    %>

                                    <input type="button" value="liked" onclick="likego(this)" id="<%=ansid%>"/>

                                    <%

                                    } else {
                                    %>

                                    <input type="button" value="like" onclick="likego(this)" id="<%=ansid%>"/>

                                    <%
                                        }
                                    } else {
                                    %>


                                    <input type="button" value="like" onclick="likego(this)" id="<%=ansid%>"/>
                                    <%
                                        }

                                    %>
                                    <%--       <span><a href="dislike.jsp?msg=<%=ansid%>">dislike</a></span><br> --%>

                                </div>
                                <div class="col-sm-4">

                                    <div  style="text-align-last: right">
                                        <a href="userprofile.jsp?name=<%=uname%>"><img src="<%=photo%>" width="30" height="30" style="border-radius:50%"/></a>


                                        <span><a href="userprofile.jsp?name=<%=uname%>"><%=uname%></a></span><br>
                                        <span><%=rs2.getString("posted_on")%></span> </div>

                                </div>
                            </div>
                        </div>
                        <hr>
                        <%
                            }

                        %>

                    </div>

                    <div class="row">
                        <div class="col-sm-12" style="background: #ccccff; padding: 10px;">
                            <h3>Post Answer</h3> 
                            <textarea name="answer" rows="10" cols="50" style="width:100%;" id="ans"></textarea><br>
                            <input type ="button" value="Submit" onclick="go12()" style="background-color: #204d74;color: #fff;border: none;padding: 10px 20px;">            
                            <input type="hidden" value="<%=quesid%>" id="q_id">
                        </div>
                    </div>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>

        <br><br>
        <%@include file="footer.jsp" %>
    </body>
</html>
