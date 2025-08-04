  <script src="https://s3.tradingview.com/tv.js"></script>

<div class="main-page">
<div class="main-content">
    <div class="main-Title-of-Page">
            <h1 class="welcome">Welcome back, <span class="username">Madhur!</span></h1>
            <p>Here's your trading education progress and portfolio overview.</p>
    </div>
    
    <section class="stats-grid">
            <div class="card stat-card">
              <div class="stat-title">Account Balance</div>
              <div class="stat-value">$25,48.00</div>
              <div class="stat-change positive">+12.5%</div>
            </div>

            <div class="card stat-card">
              <div class="stat-title">Open P&L</div>
              <div class="stat-value">+$1,247.50</div>
              <div class="stat-change positive">+5.2%</div>
            </div>

            <div class="card stat-card">
              <div class="stat-title">Progress</div>
              <div class="stat-value">68%</div>
              <div class="stat-change neutral">4 modules completed</div>
            </div>
          </section>
		
			<div class="chart-watchlist-wrapper">
				  <!-- TradingView Chart -->
				  <div id="tradingview_chart"></div>
				
				  <!-- Watchlist Panel -->
				  <div class="watchlist-panel">
				    <h3>Watchlist</h3>
				    <ul id="watchlist">
				      <!-- Dynamic Items will be inserted here -->
				    </ul>
				  </div>
				</div>
				
			
			<script>
			const watchlistPairs = [
			
				  // Forex
				  { name: "EUR/USD", tvSymbol: "OANDA:EURUSD" },
				  { name: "USD/INR", tvSymbol: "OANDA:USDINR" },
				  { name: "GBP/USD", tvSymbol: "OANDA:GBPUSD" },
				  { name: "USD/JPY", tvSymbol: "OANDA:USDJPY" },
				  { name: "AUD/USD", tvSymbol: "OANDA:AUDUSD" },

				  // Crypto
				  { name: "Bitcoin", tvSymbol: "BINANCE:BTCUSDT" },
				  { name: "Ethereum", tvSymbol: "BINANCE:ETHUSDT" },
				  { name: "Solana", tvSymbol: "BINANCE:SOLUSDT" },
				  { name: "Dogecoin", tvSymbol: "BINANCE:DOGEUSDT" }
				];



  // Load default chart
  function loadChart(symbol) {
    if (window.widget) {
      window.widget.remove();
    }

    window.widget = new TradingView.widget({
      container_id: "tradingview_chart",
      width: "100%",
      height: 500,
      symbol: symbol,
      interval: "1",
      timezone: "Asia/Kolkata",
      theme: "Dark",
      style: "1",
      locale: "en",
      toolbar_bg: "#f1f3f6",
      enable_publishing: false,
      allow_symbol_change: true,
      hide_top_toolbar: false,
      withdateranges: true
    });
  }

  // Create watchlist items
  const watchlistEl = document.getElementById("watchlist");
  watchlistPairs.forEach(pair => {
    const li = document.createElement("li");
    li.textContent = pair.name;
    li.onclick = () => {
      document.querySelectorAll("#watchlist li").forEach(el => el.classList.remove("active"));
      li.classList.add("active");
      loadChart(pair.tvSymbol);
    };
    watchlistEl.appendChild(li);
  });

  // Load first symbol by default
  loadChart(watchlistPairs[0].tvSymbol);
  document.querySelectorAll("#watchlist li")[0].classList.add("active");
</script>

    
          
            
            
      <!-- ========== Announcements & Deadlines ========== -->
            <section class="info-grid">
              <div class="info-card announcements">
                <div class="info-header"><i class="fas fa-info-circle"></i> Announcements</div>
                <div class="announcement-list">
                  <div class="announcement-item">
                    <div class="announcement-bar"></div>
                    <div class="announcement-content">
                      <div class="announcement-title">New Trading Strategy Course Available</div>
                      <div class="announcement-desc">Learn advanced momentum trading strategies from industry experts.</div>
                      <div class="announcement-time">2 hours ago</div>
                    </div>
                  </div>
                  <div class="announcement-item">
                    <div class="announcement-bar"></div>
                    <div class="announcement-content">
                      <div class="announcement-title">Market Analysis Webinar Tomorrow</div>
                      <div class="announcement-desc">Join us for a live market analysis session at 2 PM EST.</div>
                      <div class="announcement-time">1 day ago</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="info-card deadlines">
                <div class="info-header"><i class="fas fa-calendar-alt"></i> Upcoming Deadlines</div>
                <div class="deadline-list">
                  <div class="deadline-item">
                    <div class="deadline-details">
                      <div class="deadline-title">Technical Analysis Assignment</div>
                      <div class="deadline-course">TA Fundamentals</div>
                    </div>
                    <div class="deadline-due">Due in 2 days</div>
                  </div>
                  <div class="deadline-item">
                    <div class="deadline-details">
                      <div class="deadline-title">Portfolio Review Submission</div>
                      <div class="deadline-course">Risk Management</div>
                    </div>
                    <div class="deadline-due">Due in 5 days</div>
                  </div>
                </div>
              </div>
          
            </section>
  </div>
</div>
