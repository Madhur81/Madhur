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

@WebServlet("/JournalServlet")
public class TradeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DBUtil.getConnection()) {
            TradeDAO dao = new TradeDAO(conn);
            List<Trade> trades = dao.getAllTrades();
            System.out.println("Total trades fetched: " + trades.size());

            request.setAttribute("tradeList", trades);
            request.setAttribute("page", "journal");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String mode = request.getParameter("mode");

        try (Connection conn = DBUtil.getConnection()) {
            TradeDAO dao = new TradeDAO(conn);

            if ("delete".equals(mode)) {
                int id = Integer.parseInt(request.getParameter("id"));

                if (dao.deleteTradeById(id)) {
                    request.setAttribute("message", "Trade successfully deleted");
                    request.setAttribute("tradeList", dao.getAllTrades());
                    request.setAttribute("page", "journal");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Failed to delete trade");
                }
                return; // ✅ exit after delete
            }

            // Only validate and process add/update after delete check
            String idParam = request.getParameter("id");
            String date = request.getParameter("date");
            String symbol = request.getParameter("symbol");
            String type = request.getParameter("type");
            String quantityStr = request.getParameter("quantity");
            String entryStr = request.getParameter("entry");
            String exitStr = request.getParameter("exit");
            String notes = request.getParameter("notes");

            if (quantityStr == null || quantityStr.trim().isEmpty()
                    || entryStr == null || entryStr.trim().isEmpty()
                    || exitStr == null || exitStr.trim().isEmpty()) {
                response.getWriter().println("Missing required fields: quantity, entry or exit");
                return;
            }

            Trade trade = new Trade();
            trade.setDate(date);
            trade.setSymbol(symbol);
            trade.setType(type);
            trade.setQuantity(Integer.parseInt(quantityStr.trim()));
            trade.setEntryPrice(Double.parseDouble(entryStr.trim()));
            trade.setExitPrice(Double.parseDouble(exitStr.trim()));
            trade.setNotes(notes);
            trade.setPnl();
            trade.setPercentage();

            if (idParam != null && !idParam.trim().isEmpty()) {
                trade.setId(Integer.parseInt(idParam));
                if (dao.updateTrade(trade)) {
                    request.setAttribute("message", "Trade successfully updated");
                    request.setAttribute("tradeList", dao.getAllTrades());
                    request.setAttribute("page", "journal");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Failed to update trade");
                }
            } else {
                if (dao.addTrade(trade)) {
                    request.setAttribute("message", "Trade successfully added");
                    request.setAttribute("tradeList", dao.getAllTrades());
                    request.setAttribute("page", "journal");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Failed to save trade");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }




}
