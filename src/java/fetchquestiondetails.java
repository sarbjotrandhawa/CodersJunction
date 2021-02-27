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
public class fetchquestiondetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        System.out.println("in");
       String question_id = request.getParameter("qid");
        ArrayList<questiondata> al= new ArrayList<>();
        
       try
       {
           PrintWriter out = response.getWriter();
           Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "root");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from questions where question_id='" + question_id + "'");
            rs.next();
            
                    String title = rs.getString("title");
                    String des = rs.getString("description");
                    String content = rs.getString("content");
                    String keywords = rs.getString("keywords");
                    String postedby = rs.getString("posted_by");
                    String postedon = rs.getString("posted_on");
                    String catname = rs.getString("category_name");
                    
             Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = stmt1.executeQuery("select * from user where username='" + postedby + "'");
                rs1.next();
                String photo = rs1.getString("photo");
                
                al.add(new questiondata(title,des,content,keywords,postedby,photo,catname,postedon));
                
                
                 JSONObject jsonObject = new JSONObject();
            
            JSONArray jsonArray = new JSONArray();

            for (questiondata st : al)
            {
                JSONObject js = new JSONObject();
                js.put("title", st.title);
                js.put("content", st.content);
                js.put("des", st.des);
                js.put("postedby", st.postedby);
                js.put("postedon", st.postedon);
                js.put("photo", st.photo);
                js.put("keywords", st.keywords);
                js.put("catname", st.catname);
                jsonArray.add(js);
            }
            jsonObject.put("data", jsonArray);
            out.println(jsonObject);
           System.out.println("end");   
       }
        catch(Exception ae)
        {
            ae.printStackTrace();
        }
        
    }
     
    class questiondata 
    {
        String title,des,content,keywords,postedby,photo,postedon,catname;

        public questiondata(String title, String des, String content, String keywords, String postedby, String photo,String catname ,String postedon) {
            this.title = title;
            this.des = des;
            this.content = content;
            this.keywords = keywords;
            this.postedby = postedby;
            this.photo = photo;
            this.postedon = postedon;
            this.catname = catname;
        }
        
        
        
        
    }

   
}
