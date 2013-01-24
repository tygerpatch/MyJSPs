package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Example derived from pages 160 - 161 of 
// Beginning J2EE 1.4 From Novice to Professional 
// by James L. Weaver, Keven Mukhar, and Jim Crume, Published by Apress 

public class Login extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    super.doPost(request, response);
    
    String username = request.getParameter("username");
    response.setContentType("text/html");
    PrintWriter writer = response.getWriter();
    writer.println("<html><body>");
    writer.println("Thank you, " + username);
    writer.println("</body></html>");
    writer.close( );
  }

}
