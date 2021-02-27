<%@page import="java.sql.*"%>
<%
    String username = request.getParameter("p");

    // JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user where username='" + username + "'");
    if (rs.next()) {
        String ques = rs.getString("sec_question");
%>
<%=ques%>
<%

} else {
%>
false
<%
    }


%>