<%-- 
    Document   : viewcategoryquestions
    Created on : Nov 26, 2016, 11:09:05 AM
    Author     : jatinder
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Questions</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="row" style="background-color: #fff">
        <div class="col-sm-1"></div>

        <div class="col-sm-10" id="showquestions">

            <%            String catname = request.getParameter("cate");
                System.out.println(catname);
            %>
            <h1><%=catname%> Questions</h1><hr>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from questions  where category_name='" + catname + "' order by posted_on desc");
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
            <div >
                <div style="text-align: center;float: left;margin-top: 5px; width:10%; border: 1px solid #31b0d5;padding: 2px; margin-right: 10px;"> <span><%=views%></span><br><span> <a href="fetchquestion.jsp?qid=<%=id%>">views</a></span></div>
                <div style="text-align: center;float: left;margin-top: 5px; width:10%;border: 1px solid #31b0d5;padding: 2px;"><span><%=count%></span><br><span><a href="fetchquestion.jsp?qid=<%=id%>">answers</a></span></div>
                <div style="float: left;  width:72%; margin-left: 10px;" ><a href="fetchquestion.jsp?qid=<%=id%>" style="font-size: 25px"><%=rs.getString("title")%></a><br>


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
                        <a href="userprofile.jsp?name=<%=name%>" > <img src="<%=rs1.getString("photo")%>" width="35" height="35" style="border-radius:50%"></a>
                            <%}%>
                        <a href="userprofile.jsp?name=<%=name%>" style="font-size: 15px;"><%=name%></a>
                        <br><span style="color:#777;font-size: 10px;"><%=rs.getString("posted_on")%></span>
                    </div>
                </div>
              

            </div>

            <div class="clearfix"></div> 
            <hr style="border-bottom: 0.5px solid #eeeeee">

            <% }%>
             <div class="col-sm-1"></div>
        </div>
        </div>
                 <%@include file="footer.jsp" %>
    </body>
</html>
