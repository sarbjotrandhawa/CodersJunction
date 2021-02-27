<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%
    String absolutePath = getServletContext().getRealPath("/images");
    MultipartRequest mr = new MultipartRequest(request, absolutePath, 1024 * 1024 * 1000);

    String name = (String) session.getAttribute("name");
    String newpic = mr.getFilesystemName("photo");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user where username='" + name + "'");
    if (rs.next()) {
        if (newpic != null) {
            rs.updateString("photo", "./images" + File.separator + newpic);
            rs.updateRow();
        }

        response.sendRedirect("userprofile.jsp?name="+name);
        
    }
%>