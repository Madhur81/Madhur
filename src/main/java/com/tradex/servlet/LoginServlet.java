
package com.tradex.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.tradex.model.User;
import com.tradex.dao.UserDAO;

import java.io.IOException;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	       
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO(null);
        User user = userDAO.validateUser(email, password);

        if (user != null) {
            System.out.println(email+password); 

            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
