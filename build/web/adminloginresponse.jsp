<%@page import="java.sql.*"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from admin where username='" + username + "' and  password='" + password + "'");

    if (rs.next()) {
        session.setAttribute("adminname", username);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("adminlogin.jsp?msg=incorrect username/password");
    }

%>