<%@page import="java.sql.*"%>


<%
    String quesid = request.getParameter("qid");
    String answer = request.getParameter("ans");
    String username = (String) session.getAttribute("name");

    System.out.println(answer);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from answers");

    rs.moveToInsertRow();
    rs.updateString("answer",answer  );
    rs.updateString("posted_by", username);
    rs.updateString("question_id", quesid);
    rs.insertRow();

    Statement stmt10 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs10 = stmt10.executeQuery("select * from followquestiontable where questionid=" + quesid + "");
    while (rs10.next()) {
        String followname = rs10.getString("followedby");
        Statement stmt11 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs11 = stmt11.executeQuery("select * from followedusers where user='" + followname + "' and qid=" + quesid + "");
        if (rs11.next()) {

        } else {
            String s = "unseen";
            rs11.moveToInsertRow();
            rs11.updateString("qid", quesid);
            rs11.updateString("user", followname);
            rs11.updateString("status", s);
            rs11.insertRow();

        }

    }

    rs = stmt.executeQuery("select * from answers");
    rs.last();

    String photo = "";
    Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs3 = stmt3.executeQuery("select * from user where username='" + username + "'");
    if (rs3.next()) {
        photo = rs3.getString("photo");
    }

    
    
    Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs2 = stmt2.executeQuery("select MAX(answer_id) As newans from answers");
    rs2.next();
    int anid= rs2.getInt("newans");
    
    Statement stmt4 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs4 = stmt4.executeQuery("select * from answers where answer_id="+anid+"");
    rs4.next();
    answer = answer.replace("!@","\r\n");
    System.out.println(answer+" ----------------------------------");
%>

 <div  id="ansdiv">                    
     <xmp>  <%=answer%></xmp><br>
                            
                            <div class="row">
                                <div class="col-sm-8" style="margin-top: 10px;">
                                    <span id="cont<%=anid%>">0</span>


                                    <%
                                        if (session.getAttribute("name") != null) {
                                            String usernames = session.getAttribute("name").toString();

                                            Statement stmt5 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs5 = stmt5.executeQuery("select * from like_table where liked_by='" + usernames + "' and answer_id=" + anid + "");
                                            if (rs5.next()) {
                                    %>

                                    <input type="button" value="liked" onclick="likego(this)" id="<%=anid%>"/>

                                    <%

                                    } else {
                                    %>

                                    <input type="button" value="like" onclick="likego(this)" id="<%=anid%>"/>

                                    <%
                                        }
                                    } else {
                                    %>


                                    <input type="button" value="like" onclick="likego(this)" id="<%=anid%>"/>
                                    <%
                                        }

                                    %>
                                    <%--       <span><a href="dislike.jsp?msg=<%=ansid%>">dislike</a></span><br> --%>

                                </div>
                                    
                                <div class="col-sm-4">

                                    <div  style="text-align-last: right">
                                        <a href="userprofile.jsp?name=<%=username%>"><img src="<%=photo%>" width="30" height="30" style="border-radius:50%"/></a>


                                        <span><a href="userprofile.jsp?name=<%=username%>"><%=username%></a></span><br>
                                        <span><%=rs4.getString("posted_on")%></span> </div>

                                </div>
                            </div>
    </div>
   <hr>