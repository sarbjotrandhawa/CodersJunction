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
public class returnanswers extends HttpServlet {

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
            out.println("<title>Servlet returnanswers</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet returnanswers at " + request.getContextPath() + "</h1>");
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
        try {
            System.out.println("start");
            ArrayList<answerdata> al = new ArrayList<>();
            PrintWriter out = response.getWriter();
            String quesid = request.getParameter("qid");
            String loggedinuser = request.getParameter("loggedinuser");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "root");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from answers where question_id='" + quesid + "'");
            while (rs.next()) {
                String ans = rs.getString("answer");
                ans = ans.replace("!@","\r\n");
                String postedby = rs.getString("posted_by");
                String postedon = rs.getString("posted_on");
                String aid = rs.getString("answer_id");

                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs1 = stmt1.executeQuery("select * from user where username='" + postedby + "'");
                rs1.next();
                String photo = rs1.getString("photo");
                Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs2 = stmt2.executeQuery("select COUNT(*) AS rowcount from like_table where answer_id=" + aid + "");
                rs2.next();
                int likecount = rs2.getInt("rowcount");
                Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("loggedin" + loggedinuser);
                ResultSet rs3 = stmt3.executeQuery("select * from like_table where answer_id=" + aid + " and liked_by='" + loggedinuser + "'");
                String likestatus = "notliked";
                if (rs3.next()) {
                    likestatus = "liked";
                    System.out.println("in");
                }

                al.add(new answerdata(aid, ans, postedby, postedon, photo, likecount + "", likestatus));

            }
            JSONObject jsonObject = new JSONObject();

            JSONArray jsonArray = new JSONArray();

            for (answerdata st : al) {
                JSONObject js = new JSONObject();
                js.put("answer", st.answer);
                js.put("postedby", loggedinuser);
                js.put("postedon", st.postedon);
                js.put("photo", st.photo);
                System.out.println(st.photo);
                js.put("aid", st.aid);
                js.put("likecount", st.likecount);
                js.put("likestatus", st.likestatus);

                jsonArray.add(js);
            }
            jsonObject.put("data", jsonArray);
            out.println(jsonObject);
            System.out.println("end");

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("end1");
    }

    class answerdata {

        String answer, postedby, postedon, photo, aid, likecount, likestatus;

        public answerdata(String aid, String answer, String postedby, String postedon, String photo, String likecount, String likestatus) {
            this.answer = answer;
            this.postedby = postedby;
            this.postedon = postedon;
            this.photo = photo;
            this.aid = aid;
            this.likecount = likecount;
            this.likestatus = likestatus;
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
