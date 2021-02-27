/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jatinder
 */
public class postanshandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet postanshandler</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet postanshandler at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
            PrintWriter out = response.getWriter();
         String user = request.getParameter("username");
         String qid = request.getParameter("qid");
         String answer = request.getParameter("answer");
            System.out.println(answer);
            System.out.println("getanswer");
            System.out.println(user);
            System.out.println(qid);
            System.out.println(answer);
         
         Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "root");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from answers ");
       rs.next();
       rs.moveToInsertRow();
       rs.updateString("answer", answer);
       rs.updateString("question_id", qid);
       rs.updateString("posted_by", user);
       rs.insertRow();
       
       
          Statement stmt10 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs10 = stmt10.executeQuery("select * from followquestiontable where questionid="+qid+"");
    while(rs10.next())
    {
        String followname =  rs10.getString("followedby");       
         Statement stmt11 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs11 = stmt11.executeQuery("select * from followedusers where user='"+followname+"' and qid="+qid+"");
        if(rs11.next())
        {
            
        }
        else
        {
            String s="unseen";
            rs11.moveToInsertRow();
         rs11.updateString("qid",qid);
         rs11.updateString("user",followname);
         rs11.updateString("status",s);
         rs11.insertRow();
         
        }
        
    }
    
            System.out.println("done");
       out.println("done");
               
        }
        catch(Exception ae)
        {
            ae.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
