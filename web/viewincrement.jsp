<%@page import="java.sql.*"%>
<%
    String qid = request.getParameter("qid");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from questions where question_id=" + qid + "");
    int count;
    if (rs.next()) {

        count = rs.getInt("views");
        count++;
        rs.updateInt("views", count);
        rs.updateRow();
    }

%>
count