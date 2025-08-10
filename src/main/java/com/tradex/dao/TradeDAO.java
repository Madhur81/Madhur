package com.tradex.dao;

import com.tradex.model.Trade;
import java.sql.*;
import java.util.*;

public class TradeDAO {
    private Connection conn;

    public TradeDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Trade> getAllTrades() {
        List<Trade> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM trades ORDER BY Date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Trade t = new Trade();
                t.setId(rs.getInt("id"));
                t.setDate(rs.getString("date"));
                t.setSymbol(rs.getString("symbol"));
                t.setType(rs.getString("type"));
                t.setQuantity(rs.getInt("quantity"));
                t.setEntryPrice(rs.getDouble("entry_price"));
                t.setExitPrice(rs.getDouble("exit_price"));
               
                t.setNotes(rs.getString("notes"));
                list.add(t);
                System.out.println("Fetched trades: " + list.size());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean addTrade(Trade trade) {
        String sql = "INSERT INTO trades (date, symbol, type, quantity, entry_price, exit_price, pnl, percentage, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, trade.getDate());
            stmt.setString(2, trade.getSymbol());
            stmt.setString(3, trade.getType());
            stmt.setInt(4, trade.getQuantity());
            stmt.setDouble(5, trade.getEntryPrice());
            stmt.setDouble(6, trade.getExitPrice());
            stmt.setDouble(7, trade.getPnl());
            stmt.setDouble(8, trade.getPercentage());
            stmt.setString(9, trade.getNotes());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        	System.out.println("Percentage value: " + trade.getPercentage());

            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateTrade(Trade trade) throws SQLException {
        String sql = "UPDATE trades SET date=?, symbol=?, type=?, quantity=?, entry_price=?, exit_price=?, notes=? WHERE id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, trade.getDate());
            stmt.setString(2, trade.getSymbol());
            stmt.setString(3, trade.getType());
            stmt.setInt(4, trade.getQuantity());
            stmt.setDouble(5, trade.getEntryPrice());
            stmt.setDouble(6, trade.getExitPrice());
            stmt.setString(7, trade.getNotes());
            stmt.setInt(8, trade.getId());
            return stmt.executeUpdate() > 0;
        }
    }


    public boolean deleteTradeById(int id) throws SQLException {
        String sql = "DELETE FROM trades WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        return ps.executeUpdate() > 0;
    }
}
