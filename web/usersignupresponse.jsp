<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%

    String absolutePath = getServletContext().getRealPath("/images");
    MultipartRequest mr = new MultipartRequest(request, absolutePath, 1024 * 1024 * 1000);
    String name = mr.getParameter("uname");
    String password = mr.getParameter("pwd");
    String email = mr.getParameter("email");
    String phnumber = mr.getParameter("phone");
    String s_q = mr.getParameter("s_ques");
    String s_a = mr.getParameter("s_ans");
    String filename = mr.getFilesystemName("photo");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user");
    if (rs.next()) {
        rs.moveToInsertRow();
        rs.updateString("username", name);
        rs.updateString("password", password);
        rs.updateString("email", email);
        rs.updateString("phone", phnumber);
        rs.updateString("sec_question", s_q);
        rs.updateString("sec_answer", s_a);
        rs.updateString("photo", "images" + File.separator + filename);
        rs.insertRow();
        response.sendRedirect("userlogin.jsp?msg= Login Again");
    }
%>