<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tradex.model.Trade" %>
<% 
    List<Trade> trades = (List<Trade>) request.getAttribute("tradeList");
    String message = (String) request.getAttribute("message");
%>

<%
		double totalPnl = 0;
		int winCount = 0;
		int totalTrades = 0;
		double bestPnl = Double.NEGATIVE_INFINITY;
		String bestSymbol = "";

	if (trades != null) {
	    for (Trade trade : trades) {
	        totalTrades++;
	        double pnl = trade.getPnl();
	        totalPnl += pnl;
	
	        if (pnl > 0) {
	            winCount++;
	        }
	
	        if (pnl > bestPnl) {
	            bestPnl = pnl;
	            bestSymbol = trade.getSymbol();
	        }
	    }
	}

		double winRate = (totalTrades > 0) ? ((double) winCount / totalTrades) * 100 : 0;
		String pnlClass = totalPnl >= 0 ? "positive" : "negative";
		String formattedTotalPnl = String.format("%s$%.2f", totalPnl >= 0 ? "+" : "-", Math.abs(totalPnl));
		String formattedBestPnl = String.format("%s$%.2f", bestPnl >= 0 ? "+" : "-", Math.abs(bestPnl));
%>

<div class="main-page">
<div class="main-content">
          <div class="main-Title-of-Page">
            <h1>Trading Journal</h1>
            <p>Track and analyze your trading performance to improve your strategy.</p>
          </div>
       <div class="journal-summary-grid">
       	<div class="journal-summary-card">
		  <div class="summary-title">Total P&L</div>
		  <div class="summary-value <%= pnlClass %>"><%= formattedTotalPnl %></div>
		  <div class="summary-desc">Across <%= totalTrades %> trades</div>
		</div>
		
		<div class="journal-summary-card">
		  <div class="summary-title">Win Rate</div>
		  <div class="summary-value <%= winRate >= 50 ? "positive" : "negative" %>"><%= String.format("%.1f", winRate) %>%</div>
		  <div class="summary-desc"><%= winCount %> wins / <%= totalTrades - winCount %> losses</div>
		</div>
		
		<div class="journal-summary-card">
		  <div class="summary-title">Best Trade</div>
		  <div class="summary-value <%= bestPnl >= 0 ? "positive" : "negative" %>"><%= formattedBestPnl %></div>
		  <div class="summary-desc"><%= bestSymbol != null ? bestSymbol : "N/A" %></div>
		</div>
          </div>
          
          <div class="add-trade-btn-wrapper">
			  <button id="openAddTradeModal" class="add-trade-btn">
			    <i class="fas fa-plus"></i>
			    Add Trade
			  </button>
			</div>
			
          <div class="journal-search-bar">
            <input type="text" id="searchInput" placeholder="Search trades by symbol or notes..." class="search-input">
            <select id="symbolFilter" class="filter-select">
            <option value="">All Symbols</option>
                <% if (trades != null) {
        		 java.util.Set<String> symbols = new java.util.HashSet<>();
		         for (Trade trade : trades) {
		             symbols.add(trade.getSymbol());
		         }
		         for (String symbol : symbols) {
		   		 %>
		   		 <option value="<%= symbol %>"><%= symbol %></option>
    <% } } %>
   			 </select>
           <select id="typeFilter" class="filter-select">
           <option value="">All Types</option>
		    <option value="BUY">BUY</option>
		    <option value="SELL">SELL</option>
           </select>
          </div>
          
          <div class="trade-history-section">
            <h2>Trade History</h2>
            <div class="table-container">
             <table class="trade-table">
        <thead>
        <tr>
        	<th>ID</th>
            <th>Date</th>
            <th>Symbol</th>
            <th>Type</th>
            <th>Quantity</th>
            <th>Entry Price</th>
            <th>Exit Price</th>
            <th>P & L</th>
            <th>%</th>
            <th>Notes</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
        			if (trades != null) {
          		  for (Trade trade : trades) {
        %>
        <tr class="trade-row">
        	<td><%= trade.getId() %></td>
            <td><%= trade.getDate() %></td>
            <td class="symbol-cell"><%= trade.getSymbol() %></td>
            <td><span class="trade-type <%= trade.getType().equalsIgnoreCase("BUY") ? "buy" : "sell" %>"><%= trade.getType() %></span></td>
            <td><%= trade.getQuantity() %></td>
            <td class="price-cell">$<%= trade.getEntryPrice() %></td>
            <td class="price-cell">$<%= trade.getExitPrice() %></td>
            <td class="pnl-cell <%= trade.getPnl() >= 0 ? "positive" : "negative" %>">
              <%= String.format("%s$%.2f", trade.getPnl() >= 0 ? "+" : "", trade.getPnl()) %>
            </td>
            <td class="percentage-cell <%= trade.getPercentage() >= 0 ? "positive" : "negative" %>">
              <%= String.format("%.2f%%", trade.getPercentage()) %>
            </td>
            <td class="notes-cell"><%= trade.getNotes() %></td>
            
			<td class="actions-cell">
		    <button class="action-btn edit-btn" data-id="<%= trade.getId() %>"
		        data-date="<%= trade.getDate() %>" data-symbol="<%= trade.getSymbol() %>"
		        data-type="<%= trade.getType() %>" data-quantity="<%= trade.getQuantity() %>"
		        data-entry="<%= trade.getEntryPrice() %>" data-exit="<%= trade.getExitPrice() %>"
		        data-pnl="<%= String.format("%.2f", trade.getPnl()) %>" data-percentage="<%= trade.getPercentage() %>"
		        data-notes="<%= trade.getNotes() %>" title="Edit Trade">
		        <i class="fas fa-edit"></i>
		    </button>
		
		    <button class="action-btn delete-btn" 
			  data-id="<%= trade.getId() %>"
			  data-date="<%= trade.getDate() %>"
			  data-symbol="<%= trade.getSymbol() %>"
			  data-type="<%= trade.getType() %>"
			  data-quantity="<%= trade.getQuantity() %>"
			  data-entry="<%= trade.getEntryPrice() %>"
			  data-exit="<%= trade.getExitPrice() %>"
			  data-notes="<%= trade.getNotes() %>" title="Delete Trade">
			  <i class="fas fa-trash-alt"></i>
			</button>
			</td>
        </tr>
        <% 
        		} 
        			}	
        			else{
        				%>
        				<tr>
        				    <td colspan="11" class="no-data">No trades found.</td>
        				</tr>
        				<%
        				    }
        				%>
        </tbody>
        </table>
        </div>
          </div>
          
          
    
          
</div>
</div>

      
      <!-- Add Trade Modal -->
<div id="addTradeModal" class="modal hidden">
  <div class="modal-backdrop"></div>
  <div class="modal-container">
    <div class="modal-content">
      <div class="modal-header">
        <h3 id="modalTitle">Add New Trade</h3>
        <button type="button" id="closeAddTradeModalBtn" class="close-btn">
          <i class="fas fa-times"></i>
        </button>
      </div>
      
      <form id="addTradeForm" method="post" class="trade-form">
        <input type="hidden" name="id" id="tradeId">
        <input type="hidden" name="mode" id="formMode" value="add">

        <div class="form-row">
          <div class="form-group">
            <label for="tradeDate">Date</label>
            <input type="date" name="date" id="tradeDate" required class="form-input">
          </div>

          <div class="form-group">
            <label for="tradeSymbol">Symbol</label>
            <input type="text" name="symbol" id="tradeSymbol" required class="form-input" placeholder="e.g., AAPL">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="tradeType">Type</label>
            <select name="type" id="tradeType" required class="form-input">
              <option value="">Select Type</option>
              <option value="BUY">BUY</option>
              <option value="SELL">SELL</option>
            </select>
          </div>

          <div class="form-group">
            <label for="tradeQuantity">Quantity</label>
            <input type="number" name="quantity" id="tradeQuantity" required class="form-input" placeholder="100">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="tradeEntry">Entry Price</label>
            <input type="number" step="0.01" name="entry" id="tradeEntry" required class="form-input" placeholder="0.00">
          </div>

          <div class="form-group">
            <label for="tradeExit">Exit Price</label>
            <input type="number" step="0.01" name="exit" id="tradeExit" required class="form-input" placeholder="0.00">
          </div>
        </div>

        <div class="form-group full-width">
          <label for="tradeNotes">Notes</label>
          <textarea name="notes" id="tradeNotes" class="form-input" rows="3" placeholder="Add any notes about this trade..."></textarea>
        </div>

        <div class="form-actions">
          <button type="button" id="cancelBtn" class="cancel-btn">Cancel</button>
          <button type="submit" id="submitButton" class="submit-btn">
            <i class="fas fa-plus"></i>
            Add Trade
          </button>
        </div>
      </form>
    </div>
  </div>
</div>


<script>
document.addEventListener("DOMContentLoaded", () => {
  const openBtn = document.getElementById("openAddTradeModal");
  const modal = document.getElementById("addTradeModal");
  const closeBtn = document.getElementById("closeAddTradeModalBtn");
  const cancelBtn = document.getElementById("cancelBtn");
  const form = document.getElementById("addTradeForm");
  const submitButton = document.getElementById("submitButton");
  const modalTitle = document.getElementById("modalTitle");

  // Disable form inputs initially
  document.querySelectorAll("#addTradeForm input, #addTradeForm select, #addTradeForm textarea").forEach(input => {
    input.disabled = false;
  });

  // Open modal for adding new trade
  openBtn.addEventListener("click", () => {
    resetModal();
    modal.classList.remove("hidden");
    document.body.classList.add("modal-open");
  });

  // Close modal functions
  const closeModal = () => {
    modal.classList.add("hidden");
    document.body.classList.remove("modal-open");
    resetModal();
  };

  closeBtn.addEventListener("click", closeModal);
  cancelBtn.addEventListener("click", closeModal);

  // Close modal when clicking backdrop
  modal.addEventListener("click", (event) => {
    if (event.target === modal || event.target.classList.contains("modal-backdrop")) {
      closeModal();
    }
  });

  // Reset modal to add mode
  const resetModal = () => {
    form.reset();
    document.getElementById("tradeId").value = "";
    document.getElementById("formMode").value = "add";
    modalTitle.textContent = "Add New Trade";
    submitButton.innerHTML = '<i class="fas fa-plus"></i> Add Trade';
    submitButton.className = "submit-btn";
    form.action = `${pageContext.request.contextPath}/JournalServlet`;

    // Enable all form fields
    document.querySelectorAll("#addTradeForm input, #addTradeForm select, #addTradeForm textarea").forEach(input => {
      input.readOnly = false;
      input.disabled = false;
      input.classList.remove("readonly-field");
    });
  };

  // Delete mode
  document.querySelectorAll(".delete-btn").forEach(btn => {
    btn.addEventListener("click", () => {
      // Fill fields with data
      document.getElementById("tradeId").value = btn.dataset.id;
      document.getElementById("tradeDate").value = btn.dataset.date;
      document.getElementById("tradeSymbol").value = btn.dataset.symbol;
      document.getElementById("tradeType").value = btn.dataset.type;
      document.getElementById("tradeQuantity").value = btn.dataset.quantity;
      document.getElementById("tradeEntry").value = btn.dataset.entry;
      document.getElementById("tradeExit").value = btn.dataset.exit;
      document.getElementById("tradeNotes").value = btn.dataset.notes;

      // Make fields readonly
      document.querySelectorAll("#addTradeForm input, #addTradeForm select, #addTradeForm textarea").forEach(input => {
        input.readOnly = true;
        input.classList.add("readonly-field");
      });
      document.getElementById("tradeType").disabled = true;

      // Set delete mode
      document.getElementById("formMode").value = "delete";
      modalTitle.textContent = "Delete Trade";
      submitButton.innerHTML = '<i class="fas fa-trash"></i> Delete Trade';
      submitButton.className = "submit-btn delete-mode";

      form.action = `${pageContext.request.contextPath}/JournalServlet`;
      modal.classList.remove("hidden");
      document.body.classList.add("modal-open");
    });
  });

  // Edit mode
  document.querySelectorAll(".edit-btn").forEach(btn => {
    btn.addEventListener("click", () => {
      // Fill fields with data
      document.getElementById("tradeId").value = btn.dataset.id;
      document.getElementById("tradeDate").value = btn.dataset.date;
      document.getElementById("tradeSymbol").value = btn.dataset.symbol;
      document.getElementById("tradeType").value = btn.dataset.type;
      document.getElementById("tradeQuantity").value = btn.dataset.quantity;
      document.getElementById("tradeEntry").value = btn.dataset.entry;
      document.getElementById("tradeExit").value = btn.dataset.exit;
      document.getElementById("tradeNotes").value = btn.dataset.notes;

      // Set edit mode
      document.getElementById("formMode").value = "edit";
      modalTitle.textContent = "Edit Trade";
      submitButton.innerHTML = '<i class="fas fa-save"></i> Update Trade';
      submitButton.className = "submit-btn edit-mode";

      form.action = `${pageContext.request.contextPath}/JournalServlet`;
      modal.classList.remove("hidden");
      document.body.classList.add("modal-open");
    });
  });
});

// Search and filter functionality
document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.getElementById("searchInput");
  const symbolFilter = document.getElementById("symbolFilter");
  const typeFilter = document.getElementById("typeFilter");
  const rows = document.querySelectorAll(".trade-table tbody tr");

  function filterTrades() {
    const search = searchInput.value.toLowerCase();
    const selectedSymbol = symbolFilter.value;
    const selectedType = typeFilter.value;

    rows.forEach(row => {
      const cells = row.querySelectorAll("td");
      if (!cells.length || cells.length < 10) return;

      const symbol = cells[2].textContent.trim();
      const type = cells[3].textContent.trim();
      const notes = cells[9].textContent.toLowerCase();

      const matchesSearch = symbol.toLowerCase().includes(search) || notes.includes(search);
      const matchesSymbol = !selectedSymbol || symbol === selectedSymbol;
      const matchesType = !selectedType || type === selectedType;

      if (matchesSearch && matchesSymbol && matchesType) {
        row.style.display = "";
      } else {
        row.style.display = "none";
      }
    });
  }

  searchInput.addEventListener("input", filterTrades);
  symbolFilter.addEventListener("change", filterTrades);
  typeFilter.addEventListener("change", filterTrades);
});
</script>

<script>
  // Check if there's a success message from the server
  window.addEventListener('DOMContentLoaded', () => {
    <% if(message != null && !message.isEmpty()) { %>
      // Small delay to ensure the alert is shown after page load
      setTimeout(() => {
        alert('<%= message %>');
      }, 300);
    <% } %>
  });
</script>