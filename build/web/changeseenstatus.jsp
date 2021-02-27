<%@page import="java.sql.*"%>
<%

    String name = (String) session.getAttribute("name");
    String qid = request.getParameter("qid");
    System.out.println(qid);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from followedusers where user=" + name + " and qid=" + qid + "");
    rs.next();
    String s = "seen";
    rs.updateString("status", s);
    rs.updateRow();
    System.out.println("done");
%>
done