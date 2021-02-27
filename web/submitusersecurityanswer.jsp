<%@page import="java.sql.*"%>

<%
    String answer = request.getParameter("secanswer");
    String username = request.getParameter("username");

    // JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user where username='" + username + "' && sec_answer='" + answer + "'");
    if (rs.next()) {
        response.sendRedirect("userlogin.jsp?msg=check your registered email");
    } else {
        response.sendRedirect("forgetuserpassword.jsp?msg=security answer don't match");
    }


%>