<%@page import="java.sql.*"%>
<%
    String name = request.getParameter("detail");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from category where category_name='" + name + "'");
    if (rs.next()) {
        rs.deleteRow();
        response.sendRedirect("viewcategories.jsp");
    }
%>