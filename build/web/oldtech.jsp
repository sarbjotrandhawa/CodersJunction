 <%@page import="java.sql.*"%>
<div class="col-sm-4" style="background-color: #d9534f">

                    <h4 style="alignment-adjust: central">Technologies</h4>
                    <%Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                        Statement stmt31 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs31 = stmt31.executeQuery("select * from category");
                        while (rs31.next()) {
                            String cname = rs31.getString("category_name");

                    %>  


                    <div id="<%=cname%>" onclick="getquestions(this)" style="border: 1px solid #000; float: left;width:48%; margin-left: 5px; margin-bottom: 5px;">
                        <img  style="alignment-adjust: central" src="<%=rs31.getString("photo")%>" width="50" height="50"><br>
                        <h5 style="alignment-adjust: central"><%=rs31.getString("category_name")%></h5><br>   


                    </div>

                    <%}%>  
                </div>