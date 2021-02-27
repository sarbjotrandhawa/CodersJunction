<%@page import="java.sql.*"%>
<%
    String ser = request.getParameter("search");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "12345678");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from questions where title like '%" + ser + "%'");    
    while (rs.next()) {
        int qid = rs.getInt("question_id");
        
%>
<a href="fetchquestion.jsp?qid=<%=qid%>"><%=rs.getString("title")%></a><br>                   

<%
    }
%>