<%@page import="java.sql.*"%>
<%
    String id = request.getParameter("qid");
    String des = request.getParameter("description");
    String content = request.getParameter("content");
    String keywords = request.getParameter("keywords");
    String category = request.getParameter("category");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from questions where question_id= '" + id + "'");
    if (rs.next()) {
        rs.updateString("description", des);
        rs.updateString("content", content);
        rs.updateString("keywords", keywords);
        rs.updateString("category_name", category);
        rs.updateRow();
        response.sendRedirect("editquestion.jsp?msg=Question edited&qid=" + id + "");

    }
%>