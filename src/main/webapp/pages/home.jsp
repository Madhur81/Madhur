  <script src="https://s3.tradingview.com/tv.js"></script>

<div class="main-page">
<div class="main-content">
    <div class="main-Title-of-Page">
            <h1 class="welcome">Welcome back, <span class="username">Madhur!</span></h1>
            <p>Here's your trading education progress and portfolio overview.</p>
    </div>
    
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

            
          </section>
           <div class="courses-header">
                <h2>Enrolled Courses</h2>
                <button class="view-all-btn">View All</button>
              </div>

              <div class="courses-grid">

                <!-- Course Card 1 -->
                <div class="course-card">
                  <img src="tumbnails/technical.png" alt="Technical Analysis Fundamentals" class="course-img">
                  <div class="course-title"><strong>Technical Analysis Fundamentals</strong></div>
                  <div class="course-time">Time spent: 4.5 hours</div>
                  <div class="course-progress-row">
                    <span>Progress</span>
                    <span>75%</span>
                  </div>
                  <div class="progress-bar-bg">
                    <div class="progress-bar-fill" style="width: 75%"></div>
                  </div>
									<a href="index.jsp?page=continue-learning" class="continue-btn">Continue Learning</a>
                </div>
                <!-- Course Card 2 -->
                <div class="course-card">
                  <img src="tumbnails/risk.png" alt="Risk Management Strategies" class="course-img">
                  <div class="course-title"><strong>Risk Management Strategies</strong></div>
                  <div class="course-time">Time spent: 2.1 hours</div>
                  <div class="course-progress-row">
                    <span>Progress</span>
                    <span>45%</span>
                  </div>
                  <div class="progress-bar-bg">
                    <div class="progress-bar-fill" style="width: 45%"></div>
                  </div>
					
									<a href="index.jsp?page=learning2" class="continue-btn">Continue Learning</a>

										
                  
                </div>
                <!-- Course Card 3 -->
                <div class="course-card">
                  <img src="tumbnails/option.png" alt="Options Trading Basics" class="course-img">
                  <div class="course-title"><strong>Options Trading Basics</strong></div>
                  <div class="course-time">Time spent: 1.8 hours</div>
                  <div class="course-progress-row">
                    <span>Progress</span>
                    <span>25%</span>
                  </div>
                  <div class="progress-bar-bg">
                    <div class="progress-bar-fill" style="width: 25%"></div>
                  </div>
									<a href="index.jsp?page=learning3" class="continue-btn">Continue Learning</a>
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
      theme: "Light",
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
