package com.tradex.servlet;

import com.tradex.dao.TradeDAO;
import com.tradex.utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/DeleteTradeServlet")
public class DeleteTradeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("Raw ID param = " + request.getParameter("id"));

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.getWriter().println("Invalid trade ID");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);

            try (Connection conn = DBUtil.getConnection()) {
                TradeDAO dao = new TradeDAO(conn);
                boolean deleted = dao.deleteTradeById(id);

                if (deleted) {
                    request.setAttribute("message", "Trade successfully deleted");
                    request.setAttribute("tradeList", dao.getAllTrades());
                    request.setAttribute("page", "journal");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Failed to delete trade");
                }
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid trade ID format");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
