<%@page import="java.sql.*"%>


<%
    String status = request.getParameter("status");
    String uname = (String) session.getAttribute("name");

    String aid = request.getParameter("msg");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");

    if (status.equals("like")) {

        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery("select * from like_table");

        rs.next();

        rs.moveToInsertRow();
        rs.updateString("answer_id", aid);
        rs.updateString("liked_by", uname);
        rs.insertRow();


%>
liked
<%} else {

    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select * from like_table where answer_id=" + aid + " and liked_by='" + uname + "'");
    if (rs1.next()) {

        rs1.deleteRow();

%>
deleted
<%             }
    }

%>