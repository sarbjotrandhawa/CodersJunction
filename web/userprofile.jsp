<%-- 
    Document   : userprofile
    Created on : Nov 22, 2016, 11:32:12 AM
    Author     : jatinder
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="row" style="background-color: #fff">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" id="showquestions" >

                <%                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                    String name = request.getParameter("name");

                    Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs2 = stmt2.executeQuery("select * from user where username='" + name + "'");
                    String photo = "";
                    String email = "";
                    int countques = 0;
                    if (rs2.next()) {
                        email = rs2.getString("email");
                        photo = rs2.getString("photo");
                        Statement stmt7 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs7 = stmt7.executeQuery("select count(*) as questioncount  from questions where posted_by='" + name + "'");
                        rs7.next();
                        countques = rs7.getInt("questioncount");
                    }

                    int anscount = 0;
                    Statement stmt8 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs8 = stmt8.executeQuery("select count(*) as anscount from answers where posted_by='" + name + "'");
                    rs8.next();
                    anscount = rs8.getInt("anscount");

                %> 
                
                
                
                
                
                
                
                
                <div class="row" style="padding: 10px; background-color: greenyellow">

                    <div class="col-sm-4">
                       
                        <a href="changeuserphoto.jsp"  <div style="margin-left: 55px">Change photo</div>
                    </div>
                    <div class="col-sm-8" style="padding: 10px;padding-top: 10px;">

                        <h1><label class="label-info"><%=name%></label></h1>
                        <h4><label class="label-info"><%=email%></label></h4>
                        <h4><label class="label-default">Questions Posted: <%=countques%></label></h4>
                        <h4><label class="label-default">Answers Posted: <%=anscount%></label></h4>
                    </div>
                   
                </div>
                <hr>
                
                
                
                
                
                
                <h1><label class="label-success">MY QUESTIONS</label></h1>
                <%

                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs = stmt.executeQuery("select * from questions where posted_by='" + name + "' order by posted_on desc");
                    StringTokenizer st;
                    while (rs.next()) {
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
                <div class="row" style="padding: 10px;">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">


                        <div style="text-align: center;float: left;margin-top: 5px; width:10%; border: 1px solid #31b0d5;padding: 2px; margin-right: 10px;"> <span><%=views%></span><br><span> <a href="fetchquestion.jsp?qid=<%=id%>">views</a></span></div>
                        <div style="text-align: center;float: left;margin-top: 5px; width:10%;border: 1px solid #31b0d5;padding: 2px;"><span><%=count%></span><br><span><a href="fetchquestion.jsp?qid=<%=id%>">answers</a></span></div>
                        <div style="float: left;  width:72%; margin-left: 10px;" >

                            <a href="fetchquestion.jsp?qid=<%=id%>"><%=rs.getString("title")%></a>
                            <span style="color:#777; float: right;font-size: 8px;"><%=rs.getString("posted_on")%></span>

                            <div class="clearfix"></div>

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
                                <%}%>

                            </div>
                        </div>


                    </div><div class="col-sm-1"></div>
                </div>

                <div class="clearfix"></div><hr>
                <%}%>
            </div>
            <div class="col-sm-2"></div>

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
