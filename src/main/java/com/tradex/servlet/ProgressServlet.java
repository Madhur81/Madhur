package com.tradex.servlet;

import com.tradex.dao.TradeDAO;
import com.tradex.model.Trade;
import com.tradex.utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/ProgressServlet")
public class ProgressServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DBUtil.getConnection()) {
            TradeDAO dao = new TradeDAO(conn);
            List<Trade> trades = dao.getAllTrades();
            System.out.println("Progress page - Total trades fetched: " + trades.size());

            request.setAttribute("tradeList", trades);
            request.setAttribute("page", "progress");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // Set empty list if there's an error
            request.setAttribute("tradeList", new java.util.ArrayList<Trade>());
            request.setAttribute("page", "progress");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}