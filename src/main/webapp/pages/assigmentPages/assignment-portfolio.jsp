<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page">
  <div class="main-content">

    <div class="page-header">
      <h1>Portfolio Optimization Project</h1>
      <a href="index.jsp?page=assignments" class="btn back-btn">
        <i class="fas fa-arrow-left"></i> Back
      </a>
    </div>

    <div class="overview">
      <p>Optimize a diversified portfolio using modern portfolio theory principles.</p>
      <p><strong>Due:</strong> Feb 10, 2025  |  <strong>Max Points:</strong> 150  |  <strong>Course:</strong> Risk Management Essentials</p>
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
        <li>Select a diversified set of assets (minimum 5).</li>
        <li>Calculate expected return, standard deviation, and Sharpe ratio.</li>
        <li>Use efficient frontier & CAPM where applicable.</li>
        <li>Clearly justify your optimization strategy.</li>
        <li>Upload your findings in a PDF or DOCX document.</li>
      </ul>
    </div>

    <hr>

    <div class="submission">
      <h2>Submit Your Work</h2>
      <form method="get" enctype="multipart/form-data" action="index.jsp?page=assignments">
        <input type="hidden" name="page" value="assignments">
        <input type="hidden" name="assignmentId" value="risk005">
        <input type="hidden" name="submitted" value="true">
        <label for="fileUpload">File (PDF/DOCX):</label><br>
        <input type="file" id="fileUpload" name="assignmentFile" required><br><br>
        <button type="submit" class="btn submit-btn">Submit</button>
      </form>
    </div>

    <hr>

    <div class="notes">
      <h2>Notes</h2>
      <p>Ensure your math and financial models are clearly presented.</p>
      <p>All assumptions should be explained and sources cited if used.</p>
    </div>

  </div>
</div>
