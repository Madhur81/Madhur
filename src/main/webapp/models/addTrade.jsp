<!-- Add Trade Modal -->
<div id="addTradeModal" class="modal" style="display:none;">
  <div class="modal-content">
    <span class="close" onclick="closeAddTradeModal()">&times;</span>
    <h2>Add Trade</h2>
    <form id="addTradeForm" method="post" action="addTrade">
      <label>Date:</label>
      <input type="date" name="date" required>
      
      <label>Symbol:</label>
      <input type="text" name="symbol" required>

      <label>Type:</label>
      <select name="type" required>
        <option value="BUY">BUY</option>
        <option value="SELL">SELL</option>
      </select>

      <label>Quantity:</label>
      <input type="number" name="quantity" required>

      <label>Entry Price:</label>
      <input type="number" step="0.01" name="entryPrice" required>

      <label>Exit Price:</label>
      <input type="number" step="0.01" name="exitPrice" required>

      <label>Notes:</label>
      <textarea name="notes"></textarea>

      <button type="submit">Add Trade</button>
    </form>
  </div>
</div>

<script>
  const modal = document.getElementById("addTradeModal");
  const openBtn = document.getElementById("openAddTradeModal");

  openBtn.addEventListener("click", () => {
    modal.style.display = "block";
  });

  function closeAddTradeModal() {
    modal.style.display = "none";
  }

  window.onclick = function (event) {
    if (event.target === modal) {
      modal.style.display = "none";
    }
  };
</script>
