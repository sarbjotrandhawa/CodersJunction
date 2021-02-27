<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Question</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
            String id = request.getParameter("qid");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from questions where question_id='" + id + "'");
            String title = "";
            String des = "";
            String content = "";
            String keywords = "";
            String category = "";

            if (rs.next()) {
                title = rs.getString("title");
                content = rs.getString("content");
                des = rs.getString("description");
                keywords = rs.getString("keywords");
                category = rs.getString("category_name");

            }

        %>

        <div class="container" > 
            <h1 class="jumbotron" style="text-align: center;">Edit Question</h1>

            <form action="editquestionresponse.jsp" method="get" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-3" style="text-align: right;">Title :</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="title" value="<%=title%>" readonly/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" style="text-align: right;">Description :</label>
                    <div class="col-sm-7">
                        <textarea rows="5" cols="20" name="description" class="form-control"><%=des%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" style="text-align: right;">Content :</label>
                    <div class="col-sm-7">
                        <textarea rows="10" cols="20" name="content" class="form-control"><%=content%></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3" style="text-align: right;">Keywords :</label>
                    <div class="col-sm-7">
                        <input type="text" name="keywords" class="form-control" value="<%=keywords%>" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3" style="text-align: right;">Category :</label>
                    <div class="col-sm-7">
                        <select name="category" class="form-control">
                            <option><%=category%></option>
                            <%
                                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs1 = stmt1.executeQuery("select * from category");

                                while (rs1.next()) {
                                    if (!rs1.getString("category_name").equalsIgnoreCase(category)) {%>

                            <option><%=rs1.getString("category_name")%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-7">
                        <input type="hidden" name="qid" value="<%=id%>" />
                        <input type="submit" class="btn btn-info" style="width: 100px; text-align: center;text-height: 29px; color: red" value="Edit"/>
                    </div>

                </div>

            </form>
                        <div style="text-align: center">
            <%String msg1 = request.getParameter("msg");
                if (msg1 != null) {
            %>
            <h1 style="color: red" ><%=msg1%></h1>
            <%
                }
                %></div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
