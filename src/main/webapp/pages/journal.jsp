<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tradex.model.Trade" %>
<% List<Trade> trades = (List<Trade>) request.getAttribute("tradeList");%>


 
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
        <!-- <section class="main__content"> -->
          <div class="main-Title-of-Page">
            <h1>Trading Journal</h1>
            <p>Track and analyze your trading performance to improve your strategy.</p>
          </div>
       <div class="journal-summary-grid">
       	<div class="journal-summary-card">
		  <div class="summary-title">Total P&amp;L</div>
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
			  <button id="openAddTradeModal" class="add-trade-btn">+ Add Trade</button>
			</div>
          <div class="journal-search-bar">
            <input type="text" id="searchInput" placeholder="Search trades by symbol or notes...">
            <select id="symbolFilter">
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
           <select id="typeFilter">
           <option value="">All Types</option>
		    <option value="BUY">BUY</option>
		    <option value="SELL">SELL</option>
           </select>
          </div>
          <div class="trade-history-section">
            <h2>Trade History</h2>
             <table class="trade-table">
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
        <%
       			
        			if (trades != null) {
        				
          		  for (Trade trade : trades) {
        %>
        
      
        <tr>
        	<td><%= trade.getId() %></td>
            <td><%= trade.getDate() %></td>
            <td><%= trade.getSymbol() %></td>
            <td><span class="<%= trade.getType().equalsIgnoreCase("BUY") ? "buy" : "sell" %>"><%= trade.getType() %></span></td>
            <td><%= trade.getQuantity() %></td>
            <td>$<%= trade.getEntryPrice() %></td>
            <td>$<%= trade.getExitPrice() %></td>
            <td><%= trade.getPnl() %></td>
            <td><%= trade.getPercentage() %></td>
            <td><%= trade.getNotes() %></td>
            
			<td>
		    <button class="icon-btn edit-btn" data-id="<%= trade.getId() %>"
		        data-date="<%= trade.getDate() %>" data-symbol="<%= trade.getSymbol() %>"
		        data-type="<%= trade.getType() %>" data-quantity="<%= trade.getQuantity() %>"
		        data-entry="<%= trade.getEntryPrice() %>" data-exit="<%= trade.getExitPrice() %>"
		        data-pnl="<%= String.format("%.2f", trade.getPnl()) %>" data-percentage="<%= trade.getPercentage() %>"
		        data-notes="<%= trade.getNotes() %>">
		        <i class="fas fa-edit"></i>
		    </button>
		
		    <button class="icon-btn delete-btn" 
			  data-id="<%= trade.getId() %>"
			  data-date="<%= trade.getDate() %>"
			  data-symbol="<%= trade.getSymbol() %>"
			  data-type="<%= trade.getType() %>"
			  data-quantity="<%= trade.getQuantity() %>"
			  data-entry="<%= trade.getEntryPrice() %>"
			  data-exit="<%= trade.getExitPrice() %>"
			  data-notes="<%= trade.getNotes() %>">
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
        				    <td colspan="5">No trades found.</td>
        				      <p style="color: red;">tradeList is null!</p>
        				</tr>
        				<%
        				    }
        				%> </table>
             
             


            
          </div>
        <!-- </section> -->
   
             <!-- Add Trade Modal -->
<div id="addTradeModal" class="modal hidden" >
  <div class="modal-content">
    <button type="button" id="closeAddTradeModalBtn" class="close-btn">&times;</button>
    <form id="addTradeForm" method="post">
      <input type="hidden" name="id" id="tradeId">
<input type="hidden" name="mode" id="formMode" value="add">

      <label>Date:</label>
      <input type="date" name="date" id="tradeDate" required>

      <label>Symbol:</label>
      <input type="text" name="symbol" id="tradeSymbol" required>

      <label>Type:</label>
      <select name="type" id="tradeType" required>
        <option value="BUY">BUY</option>
        <option value="SELL">SELL</option>
      </select>

      <label>Quantity:</label>
      <input type="number" name="quantity" id="tradeQuantity" required>

      <label>Entry Price:</label>
      <input type="number" step="0.01" name="entry" id="tradeEntry" required>

      <label>Exit Price:</label>
      <input type="number" step="0.01" name="exit" id="tradeExit" required>

      <label>Notes:</label>
      <textarea name="notes" id="tradeNotes"></textarea>

		<button type="submit" id="submitButton" class="submit-btn">Add Trade</button>
    </form>
  </div>
</div>
</div>
</div>
      


     <!-- /*for add trade*/ -->


<script>
document.addEventListener("DOMContentLoaded", () => {
  const openBtn = document.getElementById("openAddTradeModal");
  const modal = document.getElementById("addTradeModal");
  const closeBtn = document.getElementById("closeAddTradeModalBtn");
  const form = document.getElementById("addTradeForm");
  const submitButton = document.getElementById("submitButton");

  document.querySelectorAll("#addTradeForm input, #addTradeForm select, #addTradeForm textarea").forEach(input => {
	  input.disabled = false;
	});

  // Reset form and set for adding
  openBtn.addEventListener("click", () => {
    form.reset();
    document.getElementById("tradeId").value = "";
    submitButton.textContent = "Add Trade";
    form.action = `${pageContext.request.contextPath}/JournalServlet`;
    modal.classList.remove("hidden");
  });

  closeBtn.addEventListener("click", () => {
    modal.classList.add("hidden");
  submitButton.textContent = "Add Trade";
  submitButton.style.backgroundColor = ""; // Reset to default
  submitButton.style.color = "";           // Reset to default

  
  document.querySelectorAll("#addTradeForm input, #addTradeForm select, #addTradeForm textarea").forEach(input => {
	  input.readOnly = false;
	  input.classList.remove("readonly-field");
	});
	document.getElementById("tradeType").disabled = false;
 
 document.getElementById("formMode").value = "add";
  document.querySelectorAll("#addTradeForm input, #addTradeForm select, #addTradeForm textarea").forEach(input => {
    input.disabled = false;
  });
  });

  window.addEventListener("click", (event) => {
    if (event.target === modal) {
      modal.classList.add("hidden");
    }
  });
  
//Delete mode
  document.querySelectorAll(".delete-btn").forEach(btn => {
    btn.addEventListener("click", () => {
      // Fill fields
      document.getElementById("tradeId").value = btn.dataset.id;
      document.getElementById("tradeDate").value = btn.dataset.date;
      document.getElementById("tradeSymbol").value = btn.dataset.symbol;
      document.getElementById("tradeType").value = btn.dataset.type;
      document.getElementById("tradeQuantity").value = btn.dataset.quantity;
      document.getElementById("tradeEntry").value = btn.dataset.entry;
      document.getElementById("tradeExit").value = btn.dataset.exit;
      document.getElementById("tradeNotes").value = btn.dataset.notes;

      // Disable fields (readonly mode)
      document.querySelectorAll("#addTradeForm input, #addTradeForm select, #addTradeForm textarea").forEach(input => {
  input.readOnly = true;
  input.classList.add("readonly-field");
});
document.getElementById("tradeType").disabled = true; // for select, keep disabled


      // Set form mode and button style
      document.getElementById("formMode").value = "delete";
      submitButton.textContent = "Delete Trade";
      submitButton.style.backgroundColor = "#e53935"; // red
      submitButton.style.color = "white";

      form.action = `${pageContext.request.contextPath}/JournalServlet`;
      modal.classList.remove("hidden");
    });
  });

  


  // Edit mode
  document.querySelectorAll("#addTradeForm input, #addTradeForm select, #addTradeForm textarea").forEach(input => {
  input.disabled = false;
});

  document.querySelectorAll(".edit-btn").forEach(btn => {
    btn.addEventListener("click", () => {
      document.getElementById("tradeId").value = btn.dataset.id;
      document.getElementById("tradeDate").value = btn.dataset.date;
      document.getElementById("tradeSymbol").value = btn.dataset.symbol;
      document.getElementById("tradeType").value = btn.dataset.type;
      document.getElementById("tradeQuantity").value = btn.dataset.quantity;
      document.getElementById("tradeEntry").value = btn.dataset.entry;
      document.getElementById("tradeExit").value = btn.dataset.exit;
      document.getElementById("tradeNotes").value = btn.dataset.notes;

      submitButton.textContent = "Update Trade";
      form.action = `${pageContext.request.contextPath}/JournalServlet`;
      modal.classList.remove("hidden");
    });
  });
});
</script>


   


    
     <!-- /*for trade search and fileter*/ -->
    
    <script>
  document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.getElementById("searchInput");
    const symbolFilter = document.getElementById("symbolFilter");
    const typeFilter = document.getElementById("typeFilter");
    const rows = document.querySelectorAll(".trade-table tr:not(:first-child)");

    function filterTrades() {
      const search = searchInput.value.toLowerCase();
      const selectedSymbol = symbolFilter.value;
      const selectedType = typeFilter.value;

      rows.forEach(row => {
        const cells = row.querySelectorAll("td");
        if (!cells.length) return; // skip if not a valid row

        const symbol = cells[2].textContent.trim();  // Symbol
        const type = cells[3].textContent.trim();    // Type
        const notes = cells[9].textContent.toLowerCase(); // Notes


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




    
    