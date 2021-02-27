<%@page import="java.sql.*"%>
<%-- 
    Document   : fetchcategories
    Created on : Nov 30, 2016, 2:00:28 PM
    Author     : jatinder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div style="text-align: center"> 
        <label class="label-success" style="text-align: center"><h1>ALL CATEGORIES</h1></label>
        </div>
         <div class="educate">
            <div class="container">
                <div class="education-main">
                    <ul class="ch-grid">
        <%                     
        Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from category ");
                while (rs.next()) 
                {                
                    String catname = rs.getString("category_name");
                    String des = rs.getString("description");
                    String photo = rs.getString("photo");
            %>
        
            <a href="viewcategoryquestions.jsp?cate=<%=catname%>"> 
                <div class="col-md-3 w3agile">
                            <li>
                                <div class="ch-item" id="<%=catname%>">				
                                    <div class="ch-info">
                                        <div class="ch-info-front ch-img-1">
                                            <span class="glyphicon glyphicon-grain" aria-hidden="true"> </span>
                                            <h5><%=catname%></h5>
                                        </div>
                                        <div style="background-color: #fff40c" class="ch-info-back" >
                                            <p><img src="<%=rs.getString("photo")%>" width="50" height="50"/></p>
                                            <p style="background-color: #c7254e"><%=rs.getString("description")%></p>
                                        </div>	
                                    </div>
                                </div>
                            </li>
                </div> </a>
        
        
        
            <%
                }
            %>
        
        <div class="clearfix"> </div>
                    </ul>
                </div>
            </div>
        </div>
        
        
        
        
        
        <%@include file="footer.jsp" %>
    </body>
</html>
