<%@page import="java.sql.*"%>
<%
    String title = request.getParameter("title");
    String des = request.getParameter("description");
    String content = request.getParameter("content");
    String keywords = request.getParameter("keywords");
    String category = request.getParameter("category");
    String name = (String) session.getAttribute("name");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from questions");
    rs.next();

    rs.moveToInsertRow();
    rs.updateString("title", title);
    rs.updateString("description", des);
    rs.updateString("content", content);
    rs.updateString("keywords", keywords);
    rs.updateString("posted_by", name);
    rs.updateString("category_name", category);
    rs.insertRow();
    response.sendRedirect("userprofile.jsp?name="+name);


%>


