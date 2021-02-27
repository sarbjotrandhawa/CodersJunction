<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>


<%

    String absolutePath = getServletContext().getRealPath("/images");
    MultipartRequest mr = new MultipartRequest(request, absolutePath, 1024 * 1024 * 1000);

    String catname = mr.getParameter("c_name");

    String description = mr.getParameter("des");
    String filename = mr.getFilesystemName("photo");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from category where category_name='" + catname + "'");
    if (rs.next()) {
        rs.updateString("description", description);
        if (filename != null) {
            rs.updateString("photo", "./images" + File.separator + filename);

        }
        rs.updateRow();
        response.sendRedirect("editcategory.jsp?msg=record updated&cn=" + catname + "&photo=./images/" + filename + "&des=" + description + "");
    } else {
        response.sendRedirect("editcategory.jsp?msg=" + catname);

    }


%>