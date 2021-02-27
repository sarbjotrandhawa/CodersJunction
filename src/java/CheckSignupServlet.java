/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jatinder
 */
@WebServlet(urlPatterns = {"/CheckSignupServlet"})
public class CheckSignupServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            PrintWriter out = response.getWriter();
            String name = request.getParameter("uname");
            String password = request.getParameter("pwd");
            String email = request.getParameter("email");
            String phnumber = request.getParameter("phone");
            String s_q = request.getParameter("s_ques");
            String s_a = request.getParameter("s_ans");

            //JDBC Code
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "root");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from user where username='" + name + "' && password='" + password + "'");
            if (rs.next()) {
                out.println("Account Already Exist");
            } else {
               rs.moveToInsertRow();
         rs.updateString("username",name);
         rs.updateString("password",password);
         rs.updateString("email",email);
         rs.updateString("phone",phnumber);
         rs.updateString("sec_question",s_q);
         rs.updateString("sec_answer",s_a);
         rs.insertRow(); 
          out.println("signup sucessfull");
            }

        } catch (Exception e) {
        }

    }

}



