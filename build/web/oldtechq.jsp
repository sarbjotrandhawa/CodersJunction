<%@page import="java.sql.*"%>


<%
    String catname = request.getParameter("cate");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from questions where category_name='" + catname + "' order by posted_on desc");
    if (rs.next()) {
        rs.beforeFirst();

        while (rs.next()) {
            String name = rs.getString("posted_by");
%> 

<h1><a href="fetchquestion.jsp"><%=rs.getString("title")%></a></h1>
    <%
        Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs1 = stmt1.executeQuery("select * from user where username='" + name + "'");
        if (rs1.next()) {
    %>
<img src="<%=rs1.getString("photo")%>" width="50" height="50">
<%}%>
<label> <%=name%></label>
<h6><%=rs.getString("description")%></h6>              
<span><a href="">share</a></span>
<span><a href="">follow</a></span>
<span><a href="">views</a></span>
<span><a href="">answers</a></span>
<% }
} else {
%>

NO Question Exist Of This Category
<%}%>