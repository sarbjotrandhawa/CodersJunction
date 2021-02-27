/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author jatinder
 */
public class fetchquestions extends HttpServlet {

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
            out.println("<title>Servlet fetchquestions</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet fetchquestions at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException {

    try
    {
        PrintWriter out = response.getWriter();
        ArrayList<Data> al=new ArrayList<>();

        String catname=request.getParameter("catname");
          Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root", "root");
     Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
     ResultSet rs = stmt.executeQuery("select * from questions where category_name='"+catname+"'");
    
       while(rs.next())
            {
                String questionid=rs.getString("question_id");
                String title=rs.getString("title");
                String description=rs.getString("description");
                String posted_by=rs.getString("posted_by");
                al.add(new Data(questionid,title,description,posted_by));
            }
               JSONObject jsonObject = new JSONObject();
            
            JSONArray jsonArray = new JSONArray();

            for (Data st : al)
            {
                JSONObject js = new JSONObject();
                js.put("questionid", st.questionid);
                js.put("title", st.title);
                                js.put("des", st.des);
                js.put("postedby", st.postedby);

                jsonArray.add(js);
            }
            jsonObject.put("data", jsonArray);
            out.println(jsonObject);
        
    }
    catch(Exception ae)
    {
        ae.printStackTrace();
    }
    
    
    }

    
    
    class Data
    {
        String questionid;
        String title;
        String des,postedby;
        Data(String questionid,String title, String des,String postedby)
        {

            this.questionid=questionid;
            this.title=title;
            this.des=des;
            this.postedby=postedby;
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
