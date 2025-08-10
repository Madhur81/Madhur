package com.tradex.servlet;
import com.tradex.utils.DBUtil;

import com.tradex.model.User;
import com.tradex.dao.UserDAO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/ProfileServlet")

public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int userId = 1; // Simulate login session or cookie
        try {
            Connection conn = DBUtil.getConnection();
            UserDAO dao = new UserDAO(conn);
            User user = dao.getUserById(userId);

            req.getSession().setAttribute("user", user); // ✅ store in session
            req.setAttribute("page", "settings");
            RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
           
            rd.forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.sendError(500, "Error loading profile");
        }
    }
}
