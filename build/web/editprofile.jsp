<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%            String name = (String) session.getAttribute("name");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from user where username='" + name + "'");

            String email = "";
            String phone = "";
            String secques = "";
            String secans = "";
            if (rs.next()) {
                email = rs.getString("email");
                phone = rs.getString("phone");
                secques = rs.getString("sec_question");
                secans = rs.getString("sec_answer");
            }
        %>
        <div class="container">
            <h1 class="jumbotron" style="text-align: center;">Edit Profile</h1>
            <form action ="editprofileresponse.jsp" method="get" class="form-horizontal" >
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;" >Username :</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" readonly value ="<%=name%>"/>
                    </div>


                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;" >Email :</label>
                    <div class="col-sm-5">
                        <input type="email" class="form-control" value ="<%=email%>" name="email"/>
                    </div>

                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Phone No. :</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" value="<%=phone%>" name="phone"/>
                    </div>

                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Security Question :</label>
                    <div class="col-sm-5">
                        <select name="s_ques" class="form-control">
                            <option><%=secques%></option>

                            <%
                                String a[] = {"Birth Year ?", "Nick Name ?", "Favourite Color?", "Favourite fruit?", "Birth Place ?"};

                                for (int i = 0; i < a.length; i++) {
                                    if (!a[i].equalsIgnoreCase(secques)) {
                            %>
                            <option><%=a[i]%></option>    
                            <%
                                    }
                                }

                            %>

                        </select>
                    </div>

                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" style="text-align: right;">Security Answer :</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" value="<%=secans%>" name="s_ans"/>
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <input type="submit" class="btn btn-default" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Submit"/>
                    </div> 


            </form>
                     <div style="text-align: center">
            <%String msg1 = request.getParameter("msg");
                if (msg1 != null) {
            %>
            <h1 style="color: red" ><%=msg1%></h1>
            <%
                }
            %>
            </div>
        </div>
                   
        
        <%@include file="footer.jsp" %>
    </body>
</html>
