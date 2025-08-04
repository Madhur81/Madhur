<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tradex.model.Trade" %>
<% List<Trade> trades = (List<Trade>) request.getAttribute("tradeList");%>

<%
double totalPnl = 0;
int winCount = 0;
int totalTrades = 0;
double bestPnl = Double.NEGATIVE_INFINITY;
double worstPnl = Double.POSITIVE_INFINITY;
String bestSymbol = "";
String worstSymbol = "";
double totalWinAmount = 0;
double totalLossAmount = 0;
int lossCount = 0;

// Monthly data aggregation
Map<String, Double> monthlyPnl = new HashMap<>();
String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

if (trades != null) {
    for (Trade trade : trades) {
        totalTrades++;
        double pnl = trade.getPnl();
        totalPnl += pnl;

        if (pnl > 0) {
            winCount++;
            totalWinAmount += pnl;
        } else if (pnl < 0) {
            lossCount++;
            totalLossAmount += Math.abs(pnl);
        }

        if (pnl > bestPnl) {
            bestPnl = pnl;
            bestSymbol = trade.getSymbol();
        }
        
        if (pnl < worstPnl) {
            worstPnl = pnl;
            worstSymbol = trade.getSymbol();
        }
    }
}

double winRate = (totalTrades > 0) ? ((double) winCount / totalTrades) * 100 : 0;
double avgWin = (winCount > 0) ? totalWinAmount / winCount : 0;
double avgLoss = (lossCount > 0) ? totalLossAmount / lossCount : 0;
double profitFactor = (totalLossAmount > 0) ? totalWinAmount / totalLossAmount : 0;

String pnlClass = totalPnl >= 0 ? "positive" : "negative";
String formattedTotalPnl = String.format("%s$%.2f", totalPnl >= 0 ? "+" : "-", Math.abs(totalPnl));
String formattedBestPnl = (bestPnl != Double.NEGATIVE_INFINITY) ? String.format("%s$%.2f", bestPnl >= 0 ? "+" : "-", Math.abs(bestPnl)) : "$0.00";
String formattedWorstPnl = (worstPnl != Double.POSITIVE_INFINITY) ? String.format("%s$%.2f", worstPnl >= 0 ? "+" : "-", Math.abs(worstPnl)) : "$0.00";
String formattedAvgWin = String.format("$%.2f", avgWin);
String formattedAvgLoss = String.format("$%.2f", avgLoss);
%>

<div class="main-page">
<div class="main-content">
    <div class="main-Title-of-Page">
      <h1>Progress & Analytics</h1>
      <p>Track your learning journey and performance metrics.</p>
    </div>
    
    <!-- Updated Trading Statistics Cards -->
    <div class="progress-summary-grid">
      <div class="summary-card">
        <div class="summary-title">Win Rate</div>
        <div class="summary-value neutral"><%= String.format("%.1f%%", winRate) %></div>
        <div class="summary-desc"><%= winCount %> wins, <%= lossCount %> losses</div>
      </div>
      
      <div class="summary-card">
        <div class="summary-title">Best Trade</div>
        <div class="summary-value positive"><%= formattedBestPnl %></div>
        <div class="summary-desc"><%= bestSymbol.isEmpty() ? "No trades" : bestSymbol %></div>
      </div>
      
      <div class="summary-card">
        <div class="summary-title">Worst Trade</div>
        <div class="summary-value negative"><%= formattedWorstPnl %></div>
        <div class="summary-desc"><%= worstSymbol.isEmpty() ? "No trades" : worstSymbol %></div>
      </div>
      
      <div class="summary-card">
        <div class="summary-title">Total P&L</div>
        <div class="summary-value <%= pnlClass %>"><%= formattedTotalPnl %></div>
        <div class="summary-desc">from <%= totalTrades %> trades</div>
      </div>
    </div>
    
    <!-- Charts Grid -->
    <div class="progress-charts-grid">
        <!-- P&L Progression Chart -->
        <div class="progress-chart">
            <h2>P&L Progression Over Trades</h2>
            <div class="chart-wrapper">
                <canvas id="pnlChart"></canvas>
            </div>
        </div>

        <!-- Win/Loss Distribution -->
        <div class="course-progress">
            <h2>Win/Loss Distribution</h2>
            <div class="chart-wrapper">
                <canvas id="winLossChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Side by Side Charts: Trade Performance & Course Progress -->
    <div class="side-by-side-charts">
        <!-- Trade Performance by Symbol -->
        <div class="chart-section">
            <h2>Trade Performance by Symbol</h2>
            <div class="chart-wrapper">
                <canvas id="symbolChart"></canvas>
            </div>
        </div>
        
        <!-- Course Progress -->
        <div class="course-progress-section">
            <h2>Course Progress</h2>
            <div class="course-progress-content">
                <div class="course-progress-row">
                  <span>Technical Analysis</span>
                  <span>75%</span>
                </div>
                <div class="progress-bar-bg">
                    <div class="progress-bar-fill" style="width:75%"></div>
                </div>
                
                <div class="course-progress-row">
                  <span>Risk Management</span>
                  <span>45%</span>
                </div>
                <div class="progress-bar-bg">
                    <div class="progress-bar-fill" style="width:45%"></div>
                </div>
                
                <div class="course-progress-row">
                  <span>Options Trading</span>
                  <span>25%</span>
                </div>
                <div class="progress-bar-bg">
                    <div class="progress-bar-fill" style="width:25%"></div>
                </div>
                
                <!-- Additional Progress Stats -->
                <div class="progress-stats">
                    <div class="stat-item">
                        <span class="stat-label">Average Progress</span>
                        <span class="stat-value">48%</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-label">Time Spent</span>
                        <span class="stat-value">24.5 hrs</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-label">Next Milestone</span>
                        <span class="stat-value">Technical Analysis Completion</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    // Trading data from JSP
    const tradingData = {
        totalPnl: <%= totalPnl %>,
        winRate: <%= winRate %>,
        totalTrades: <%= totalTrades %>,
        winCount: <%= winCount %>,
        lossCount: <%= lossCount %>,
        avgWin: <%= avgWin %>,
        avgLoss: <%= avgLoss %>,
        profitFactor: <%= profitFactor %>,
        
        // Generate cumulative P&L data
        trades: [
            <% 
            if (trades != null) {
                double cumulativePnl = 0;
                for (int i = 0; i < trades.size(); i++) {
                    cumulativePnl += trades.get(i).getPnl();
                    out.print(cumulativePnl);
                    if (i < trades.size() - 1) out.print(",");
                }
            }
            %>
        ],
        
        // Symbol data for bar chart
        symbols: [
            <% 
            Map<String, Double> symbolPnl = new HashMap<>();
            if (trades != null) {
                for (Trade trade : trades) {
                    String symbol = trade.getSymbol();
                    symbolPnl.put(symbol, symbolPnl.getOrDefault(symbol, 0.0) + trade.getPnl());
                }
                
                boolean first = true;
                for (Map.Entry<String, Double> entry : symbolPnl.entrySet()) {
                    if (!first) out.print(",");
                    out.print("{symbol: '" + entry.getKey() + "', pnl: " + entry.getValue() + "}");
                    first = false;
                }
            }
            %>
        ]
    };

    // Initialize charts when page loads
    document.addEventListener('DOMContentLoaded', function() {
        initializeCharts();
    });

    function initializeCharts() {
        // P&L Progression Chart (Line Chart)
        const pnlCtx = document.getElementById('pnlChart').getContext('2d');
        const tradeNumbers = Array.from({length: tradingData.trades.length}, (_, i) => i + 1);
        
        new Chart(pnlCtx, {
            type: 'line',
            data: {
                labels: tradeNumbers,
                datasets: [{
                    label: 'Cumulative P&L',
                    data: tradingData.trades,
                    borderColor: tradingData.totalPnl >= 0 ? '#22c55e' : '#ef4444',
                    backgroundColor: tradingData.totalPnl >= 0 ? 'rgba(34, 197, 94, 0.1)' : 'rgba(239, 68, 68, 0.1)',
                    borderWidth: 3,
                    fill: true,
                    tension: 0.4,
                    pointBackgroundColor: tradingData.totalPnl >= 0 ? '#22c55e' : '#ef4444',
                    pointBorderColor: '#fff',
                    pointBorderWidth: 2,
                    pointRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        ticks: {
                            callback: function(value) {
                                return '$' + value.toFixed(2);
                            }
                        },
                        grid: {
                            color: 'rgba(0,0,0,0.1)'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Trade Number'
                        },
                        grid: {
                            color: 'rgba(0,0,0,0.1)'
                        }
                    }
                }
            }
        });

        // Win/Loss Distribution (Doughnut Chart)
        const winLossCtx = document.getElementById('winLossChart').getContext('2d');
        new Chart(winLossCtx, {
            type: 'doughnut',
            data: {
                labels: ['Wins', 'Losses'],
                datasets: [{
                    data: [tradingData.winCount, tradingData.lossCount],
                    backgroundColor: ['#22c55e', '#ef4444'],
                    borderWidth: 3,
                    borderColor: '#fff'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            padding: 20,
                            usePointStyle: true
                        }
                    }
                }
            }
        });

        // Symbol Performance (Bar Chart)
        const symbolCtx = document.getElementById('symbolChart').getContext('2d');
        const symbolLabels = tradingData.symbols.map(s => s.symbol);
        const symbolValues = tradingData.symbols.map(s => s.pnl);
        const symbolColors = symbolValues.map(value => value >= 0 ? '#22c55e' : '#ef4444');

        new Chart(symbolCtx, {
            type: 'bar',
            data: {
                labels: symbolLabels,
                datasets: [{
                    label: 'P&L by Symbol',
                    data: symbolValues,
                    backgroundColor: symbolColors,
                    borderColor: symbolColors,
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        ticks: {
                            callback: function(value) {
                                return '$' + value.toFixed(2);
                            }
                        },
                        grid: {
                            color: 'rgba(0,0,0,0.1)'
                        }
                    },
                    x: {
                        grid: {
                            color: 'rgba(0,0,0,0.1)'
                        }
                    }
                }
            }
        });
    }
</script>