
<%@page import="java.sql.*"%>


<%
    String name = (String) session.getAttribute("name");
    String email = request.getParameter("email");
    String phnumber = request.getParameter("phone");
    String s_q = request.getParameter("s_ques");
    String s_a = request.getParameter("s_ans");
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user where username='" + name + "'");
    if (rs.next()) {

        rs.updateString("email", email);
        rs.updateString("phone", phnumber);
        rs.updateString("sec_question", s_q);
        rs.updateString("sec_answer", s_a);
        rs.updateRow();

        response.sendRedirect("editprofile.jsp?msg= profile updated");
    }

%>