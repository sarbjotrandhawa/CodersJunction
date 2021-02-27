<%@page import="java.sql.*"%>

<%
    String username = (String) session.getAttribute("name");
    String password = request.getParameter("pass");

    String newpass = request.getParameter("confirmpassword");

    // JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user where username='" + username + "' && password='" + password + "'");
    if (newpass == null) {

        if (rs.next()) {
            out.println("Matched");
        } else {
            out.println("Enter Valid Password");
        }

    } else {
        if (rs.next()) {
            rs.updateString("password", newpass);
            rs.updateRow();
            session.removeAttribute("name");

            response.sendRedirect("userlogin.jsp?msg=login Again");
        }

    }

%>