package com.tradex.model;

public class Trade {
    private String date, symbol, type, notes;
    private int quantity,id;
    private double entryPrice, exitPrice, pnl, percentage;

    // Getters and Setters
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getSymbol() { return symbol; }
    public void setSymbol(String symbol) { this.symbol = symbol; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getEntryPrice() { return entryPrice; }
    public void setEntryPrice(double entryPrice) { this.entryPrice = entryPrice; }

    public double getExitPrice() { return exitPrice; }
    public void setExitPrice(double exitPrice) { this.exitPrice = exitPrice; }

    public double getPnl() {
        double direction = getTradeDirection();  // +1 for BUY, -1 for SELL
        return (exitPrice - entryPrice) * quantity * direction;
    }
    public void setPnl() { this.pnl = getPnl(); }

    public double getPercentage() {
        if (entryPrice == 0) return 0;  // avoid divide-by-zero
        double direction = getTradeDirection();
        return ((exitPrice - entryPrice) / entryPrice) * 100 * direction;
    }
    public void setPercentage() { this.percentage = getPercentage(); }

    private int getTradeDirection() {
        if ("BUY".equalsIgnoreCase(type)) return 1;
        if ("SELL".equalsIgnoreCase(type) || "SALE".equalsIgnoreCase(type)) return -1;
        return 0; // Unknown type: return neutral (no direction)
    }


    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
