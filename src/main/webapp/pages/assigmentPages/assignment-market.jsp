<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page">
  <div class="main-content">

    <div class="page-header">
      <h1>Market Analysis Report</h1>
      <a href="index.jsp?page=assignments" class="btn back-btn">
        <i class="fas fa-arrow-left"></i> Back
      </a>
    </div>

    <div class="overview">
      <p>Write a comprehensive market analysis report covering major indices and sector rotation.</p>
      <p><strong>Due:</strong> Feb 5, 2025  |  <strong>Max Points:</strong> 120  |  <strong>Course:</strong> Technical Analysis Fundamentals</p>
    </div>

    <hr>

    <div class="live-chart">
      <h2>Live BTC/USD Chart</h2>
      <iframe
        src="https://s.tradingview.com/embed-widget/symbol-overview/?locale=en#%7B%22symbol%22%3A%22CRYPTO%3ABTCUSD%22%2C%22width%22%3A%22100%25%22%2C%22height%22%3A300%2C%22colorTheme%22%3A%22light%22%2C%22autosize%22%3Atrue%7D"
        width="100%" height="300" frameborder="0" allowtransparency="true" scrolling="no">
      </iframe>
    </div>

    <hr>

    <div class="instructions">
      <h2>Instructions</h2>
      <ul>
        <li>Cover major indices like S&P 500, Nasdaq, Dow Jones.</li>
        <li>Identify sector rotation trends with examples.</li>
        <li>Include key technical indicators (e.g., RSI, MACD).</li>
        <li>Attach charts/screenshots if required.</li>
        <li>Submit as a single PDF or DOCX file.</li>
      </ul>
    </div>

    <hr>

    <div class="submission">
      <h2>Submit Your Work</h2>
      <form method="get" enctype="multipart/form-data" action="index.jsp?page=assignments">
        <input type="hidden" name="page" value="assignments">
        <input type="hidden" name="assignmentId" value="market004">
        <input type="hidden" name="submitted" value="true">
        <label for="fileUpload">File (PDF/DOCX):</label><br>
        <input type="file" id="fileUpload" name="assignmentFile" required><br><br>
        <button type="submit" class="btn submit-btn">Submit</button>
      </form>
    </div>

    <hr>

    <div class="notes">
      <h2>Notes</h2>
      <p>Focus on clarity and structure. Make sure all charts are explained well.</p>
      <p>Submissions missing analysis or screenshots will be rejected.</p>
    </div>

  </div>
</div>
