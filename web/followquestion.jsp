<%@page import="java.sql.*"%>


<%
    String status = request.getParameter("status");
    String uname = (String) session.getAttribute("name");

    String qid = request.getParameter("msg");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");

    if (status.equals("follow")) {

        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery("select * from followquestiontable");

        rs.next();

        rs.moveToInsertRow();
        rs.updateString("questionid", qid);
        rs.updateString("followedby", uname);
        rs.insertRow();


%>
followed
<%} else {

    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select * from followquestiontable where questionid=" + qid + " and followedby='" + uname + "'");
    if (rs1.next()) {

        rs1.deleteRow();

%>
deleted
<%             }
    }

%>