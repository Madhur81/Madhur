<%
  String submitted = request.getParameter("submitted");
  String submittedId = request.getParameter("assignmentId");
%>

<div class="main-page">
  <div class="main-content">
    <div class="main-Title-of-Page">
      <h1>Assignments</h1>
      <p>Track your course assignments and submissions.</p>
    </div>

    <div class="assignment-summary-grid"> 
      <div class="summary-card">
        <div class="summary-title">Pending</div>
        <div class="summary-value">3</div>
      </div>
      <div class="summary-card">
        <div class="summary-title">Submitted</div>
        <div class="summary-value">1</div>
      </div>
      <div class="summary-card">
        <div class="summary-title">Graded</div>
        <div class="summary-value">1</div>
      </div>
      <div class="summary-card">
        <div class="summary-title">Avg Grade</div>
        <div class="summary-value positive">92%</div>
      </div>
    </div>

    <div class="assignment-list">

      <!-- Assignment Card 1 -->
      <div class="assignment-card">
        <div class="assignment-header">
          <div class="assignment-title">Technical Analysis Chart Reading</div>
          <% if ("true".equals(submitted) && "tech001".equals(submittedId)) { %>
            <span class="badge submitted">Submitted</span>
            <button class="assign-btn" disabled style="background-color: gray;">Done</button>
          <% } else { %>
            <span class="badge pending">Pending</span>
            <a href="index.jsp?page=assigmentPages/technical" class="assign-btn">Start Assignment</a>
          <% } %>
        </div>
        <div class="assignment-course">Technical Analysis Fundamentals</div>
        <div class="assignment-desc">Analyze 5 different chart patterns and submit your interpretations with support/resistance levels.</div>
        <div class="assignment-meta">
          <span><i class="fas fa-calendar-alt"></i> Due: 1/25/2025</span>
          <span><i class="fas fa-star"></i> 100 points</span>
          <span class="meta-overdue">Overdue</span>
        </div>
      </div>

      <!-- Assignment Card 2 -->
      <div class="assignment-card">
        <div class="assignment-header">
          <div class="assignment-title">Risk Management Case Study</div>
          <% if ("true".equals(submitted) && "risk002".equals(submittedId)) { %>
            <span class="badge submitted">Submitted</span>
            <button class="assign-btn" disabled style="background-color: gray;">Done</button>
          <% } else { %>
            <span class="badge pending">Pending</span>
            <a href="index.jsp?page=assigmentPages/risk" class="assign-btn">Start Assignment</a>
          <% } %>
        </div>
        <div class="assignment-course">Risk Management Essentials</div>
        <div class="assignment-desc">Create a risk management plan for a $50,000 portfolio with specific position sizing rules.</div>
        <div class="assignment-meta">
          <span><i class="fas fa-calendar-alt"></i> Due: 1/28/2025</span>
          <span><i class="fas fa-star"></i> 85 points</span>
          <span class="meta-overdue">Overdue</span>
        </div>
      </div>

      <!-- Assignment Card 3 -->
      <div class="assignment-card">
        <div class="assignment-header">
          <div class="assignment-title">Options Strategy Implementation</div>
          <span class="badge graded">Graded</span>
          <span class="grade-value">92% Grade</span>
          <button class="assign-btn feedback">View Feedback</button>
        </div>
        <div class="assignment-course">Options Trading Strategies</div>
        <div class="assignment-desc">Design and backtest a covered call strategy for a blue-chip stock portfolio.</div>
        <div class="assignment-meta">
          <span><i class="fas fa-calendar-alt"></i> Due: 2/1/2025</span>
          <span><i class="fas fa-star"></i> 92 points</span>
          <span><i class="fas fa-calendar-check"></i> Submitted: 1/18/2025</span>
        </div>
        <div class="assignment-feedback">
          <strong>Instructor Feedback:</strong><br>
          Excellent analysis of the covered call strategy. Your risk-reward calculations were spot on.
        </div>
      </div>

      <!-- Assignment Card 4 -->
      <div class="assignment-card">
        <div class="assignment-header">
          <div class="assignment-title">Market Analysis Report</div>
          <% if ("true".equals(submitted) && "market004".equals(submittedId)) { %>
            <span class="badge submitted">Submitted</span>
            <button class="assign-btn" disabled style="background-color: gray;">Done</button>
          <% } else { %>
            <span class="badge pending">Pending</span>
            <a href="index.jsp?page=assigmentPages/assignment-market" class="assign-btn">Start Assignment</a>
          <% } %>
        </div>
        <div class="assignment-course">Technical Analysis Fundamentals</div>
        <div class="assignment-desc">Write a comprehensive market analysis report covering major indices and sector rotation.</div>
        <div class="assignment-meta">
          <span><i class="fas fa-calendar-alt"></i> Due: 2/5/2025</span>
          <span><i class="fas fa-star"></i> 120 points</span>
          <span class="meta-overdue">Overdue</span>
        </div>
      </div>

      <!-- Assignment Card 5 -->
      <div class="assignment-card">
        <div class="assignment-header">
          <div class="assignment-title">Portfolio Optimization Project</div>
          <% if ("true".equals(submitted) && "portfolio005".equals(submittedId)) { %>
            <span class="badge submitted">Submitted</span>
            <button class="assign-btn" disabled style="background-color: gray;">Done</button>
          <% } else { %>
            <span class="badge pending">Pending</span>
            <a href="index.jsp?page=assigmentPages/assignment-portfolio" class="assign-btn">Start Assignment</a>
          <% } %>
        </div>
        <div class="assignment-course">Risk Management Essentials</div>
        <div class="assignment-desc">Optimize a diversified portfolio using modern portfolio theory principles.</div>
        <div class="assignment-meta">
          <span><i class="fas fa-calendar-alt"></i> Due: 2/10/2025</span>
          <span><i class="fas fa-star"></i> 150 points</span>
          <span class="meta-overdue">Overdue</span>
        </div>
      </div>

    </div>
  </div>
</div>
