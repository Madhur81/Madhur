<div class="main-page">
<div class="main-content">
    
    <div class="courses-search-bar">
      <input type="text" id="courseSearch" placeholder="Search courses..." />
      <div class="filter-dropdown">
        <button class="filter-btn"><i class="fas fa-filter"></i> Filter</button>
        <div class="filter-content" id="filterOptions">
          <label><input type="checkbox" value="beginner" checked> Beginner</label>
          <label><input type="checkbox" value="intermediate" checked> Intermediate</label>
          <label><input type="checkbox" value="advanced" checked> Advanced</label>
          <hr>
          <button id="applyFilters">Apply Filters</button>
        </div>
      </div>
    </div>
    <!-- ========== course Cards ========== -->
  
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
                
                
                
                
                
                <div class="main-Title-of-Page">
      <h1>Purchase Course</h1>
      <p>Discover and enroll in trading courses to enhance your skills.</p>
		    </div>
		    <div class="courses-grid">
		      <!-- Course Card 1 -->
		      <div class="course-card">
		        <img
		          src="tumbnails/technical.png"
		          alt="Technical Analysis Fundamentals"
		          class="course-img"
		        />
		        <div class="course-badge beginner">Beginner</div>
		        <div class="course-title">Technical Analysis Fundamentals</div>
		        <div class="course-instructor">by Dr. Sarah Chen</div>
		        <div class="course-meta">
		          <span><i class="fas fa-clock"></i> 8 weeks</span>
		          <span><i class="fas fa-star"></i> 4.8</span>
		          <span><i class="fas fa-user"></i> 1247</span>
		        </div>
		        <div class="course-price">$199</div>
              <a href="#course-popup1" >		       
		               <button class="view-all-btn" onclick="popup('course-popup1')">View Details</button>
		             </a>
		      </div>
		      <!-- Course Card 2 -->
		      <div class="course-card">
		        <img
		          src="tumbnails/risk.png"
		          alt="Options Trading Strategies"
		          class="course-img"
		        />
		        <div class="course-badge intermediate">Intermediate</div>
		        <div class="course-title">Options Trading Strategies</div>
		        <div class="course-instructor">by Michael Rodriguez</div>
		        <div class="course-meta">
		          <span><i class="fas fa-clock"></i> 6 weeks</span>
		          <span><i class="fas fa-star"></i> 4.7</span>
		          <span><i class="fas fa-user"></i> 892</span>
		        </div>
		        <div class="course-price">$299</div>
  					<a href="#course-popup2" >		       
		               <button class="view-all-btn"onclick="popup('course-popup2')">View Details</button>
		             </a>		      </div>
		      <!-- Course Card 3 -->
		      <div class="course-card">
		        <img
		          src="tumbnails/option.png"
		          alt="Risk Management Essentials"
		          class="course-img"
		        />
		        <div class="course-badge beginner">Beginner</div>
		        <div class="course-title">Risk Management Essentials</div>
		        <div class="course-instructor">by Emily Watson</div>
		        <div class="course-meta">
		          <span><i class="fas fa-clock"></i> 4 weeks</span>
		          <span><i class="fas fa-star"></i> 4.9</span>
		          <span><i class="fas fa-user"></i> 2156</span>
		        </div>
		        <div class="course-price">$149</div>
		             <a href="#course-popup3" >		       
		               <button class="view-all-btn" onclick="popup('course-popup3')">View Details</button>
		             </a>
		      </div>
		      <!-- Course Card 4 -->
		      <div class="course-card">
		        <img
		          src="tumbnails/crypto.png"
		          alt="Cryptocurrency Trading"
		          class="course-img"
		        />
		        <div class="course-badge intermediate">Intermediate</div>
		        <div class="course-title">Cryptocurrency Trading</div>
		        <div class="course-instructor">by David Kim</div>
		        <div class="course-meta">
		          <span><i class="fas fa-clock"></i> 5 weeks</span>
		          <span><i class="fas fa-star"></i> 4.6</span>
		          <span><i class="fas fa-user"></i> 756</span>
		        </div>
		        <div class="course-price">$249</div>
		          <a href="#course-popup4" >		       
		               <button class="view-all-btn" onclick="popup('course-popup4')">View Details</button>
		             </a>
		      </div>
		      <!-- Course Card 5 -->
		      <div class="course-card">
		        <img
		          src="tumbnails/algo.png"
		          alt="Algorithmic Trading Basics"
		          class="course-img"
		        />
		        <div class="course-badge advanced">Advanced</div>
		        <div class="course-title">Algorithmic Trading Basics</div>
		        <div class="course-instructor">by Prof. Alex Turner</div>
		        <div class="course-meta">
		          <span><i class="fas fa-clock"></i> 10 weeks</span>
		          <span><i class="fas fa-star"></i> 4.5</span>
		          <span><i class="fas fa-user"></i> 445</span>
		        </div>
		        <div class="course-price">$399</div>
		         <a href="#course-popup5" >		       
		               <button class="view-all-btn" onclick="popup('course-popup5')">View Details</button>
		             </a>
		      </div>
		      <!-- Course Card 6 -->
		      <div class="course-card">
		        <img
		          src="tumbnails/forex.png"
		          alt="Forex Trading Mastery"
		          class="course-img"
		        />
		        <div class="course-badge intermediate">Intermediate</div>
		        <div class="course-title">Forex Trading Mastery</div>
		        <div class="course-instructor">by Lisa Zhang</div>
		        <div class="course-meta">
		          <span><i class="fas fa-clock"></i> 7 weeks</span>
		          <span><i class="fas fa-star"></i> 4.7</span>
		          <span><i class="fas fa-user"></i> 1034</span>
		        </div>
		        <div class="course-price">$199</div>
		          <a href="#course-popup6" >		       
		               <button class="view-all-btn" onclick="popup('course-popup6')">View Details</button>
		             </a>
		      </div>
		    </div>
		    
		    
	<!-- Course Popup 1 -->
<div class="popup-overlay" id="course-popup1">
  <div class="popup-window">
    <div class="popup-price"><i class="fas fa-tag"></i> $199</div>
    <h2><i class="fas fa-chart-line"></i> Technical Analysis Fundamentals</h2>
    <p><strong><i class="fas fa-user-tie"></i> Instructor:</strong> Dr. Sarah Chen</p>
    <p><strong><i class="fas fa-clock"></i> Duration:</strong> 8 weeks</p>
    <p><strong><i class="fas fa-star"></i> Rating:</strong> 4.8 (1247 students)</p>
    <p>
      Learn how to analyze price charts, spot patterns, and use key indicators like RSI, MACD, and moving averages.
      <br>Unlock the secrets behind price charts, indicators, and patterns with this comprehensive beginner-friendly course.
    </p>
    <div class="popup-footer">
      <a href="#" class="cancel-btn" onclick="cancel('course-popup1')"><i class="fas fa-times-circle"></i> Cancel</a>
      <a href="#" class="buy-btn" onclick="buyNow(19900, 'Technical Analysis Fundamentals')"><i class="fas fa-shopping-cart"></i> Buy Now</a>
    </div>
  </div>
</div>

<!-- Course Popup 2 -->
<div class="popup-overlay" id="course-popup2">
  <div class="popup-window">
    <div class="popup-price"><i class="fas fa-tag"></i> $299</div>
    <h2><i class="fas fa-chart-line"></i> Options Trading Strategies</h2>
    <p><strong><i class="fas fa-user-tie"></i> Instructor:</strong> Michael Rodriguez</p>
    <p><strong><i class="fas fa-clock"></i> Duration:</strong> 6 weeks</p>
    <p><strong><i class="fas fa-star"></i> Rating:</strong> 4.7 (892 students)</p>
    <p>
      Master the art of options trading with this comprehensive course designed for traders of all levels.
      <br>Learn practical techniques through real-world case studies and develop a solid foundation to confidently trade options.
    </p>
    <div class="popup-footer">
      <a href="#" class="cancel-btn" onclick="cancel('course-popup2')"><i class="fas fa-times-circle"></i> Cancel</a>
      <a href="#" class="buy-btn" onclick="buyNow(29900, 'Options Trading Strategies')"><i class="fas fa-shopping-cart"></i> Buy Now</a>
    </div>
  </div>
</div>

<!-- Course Popup 3 -->
<div class="popup-overlay" id="course-popup3">
  <div class="popup-window">
    <div class="popup-price"><i class="fas fa-tag"></i> $149</div>
    <h2><i class="fas fa-chart-line"></i> Risk Management Essentials</h2>
    <p><strong><i class="fas fa-user-tie"></i> Instructor:</strong> Emily Watson</p>
    <p><strong><i class="fas fa-clock"></i> Duration:</strong> 4 weeks</p>
    <p><strong><i class="fas fa-star"></i> Rating:</strong> 4.9 (2156 students)</p>
    <p>
      In the world of trading, success isn't just about making profits—it's about managing risk.
      <br>Beginner to intermediate traders looking to level up their risk control.
    </p>
    <div class="popup-footer">
      <a href="#" class="cancel-btn" onclick="cancel('course-popup3')"><i class="fas fa-times-circle"></i> Cancel</a>
      <a href="#" class="buy-btn" onclick="buyNow(14900, 'Risk Management Essentials')"><i class="fas fa-shopping-cart"></i> Buy Now</a>
    </div>
  </div>
</div>

<!-- Course Popup 4 -->
<div class="popup-overlay" id="course-popup4">
  <div class="popup-window">
    <div class="popup-price"><i class="fas fa-tag"></i> $249</div>
    <h2><i class="fas fa-chart-line"></i> Cryptocurrency Trading</h2>
    <p><strong><i class="fas fa-user-tie"></i> Instructor:</strong> David Kim</p>
    <p><strong><i class="fas fa-clock"></i> Duration:</strong> 5 weeks</p>
    <p><strong><i class="fas fa-star"></i> Rating:</strong> 4.6 (756 students)</p>
    <p>
      Master the Future of Finance, Learn to Trade Bitcoin, Ethereum & Altcoins with Confidence.
      <br>Dive into the world of cryptocurrency with our beginner-friendly course.
    </p>
    <div class="popup-footer">
      <a href="#" class="cancel-btn" onclick="cancel('course-popup4')"><i class="fas fa-times-circle"></i> Cancel</a>
      <a href="#" class="buy-btn" onclick="buyNow(24900, 'Cryptocurrency Trading')"><i class="fas fa-shopping-cart"></i> Buy Now</a>
    </div>
  </div>
</div>

<!-- Course Popup 5 -->
<div class="popup-overlay" id="course-popup5">
  <div class="popup-window">
    <div class="popup-price"><i class="fas fa-tag"></i> $399</div>
    <h2><i class="fas fa-chart-line"></i> Algorithmic Trading Basics</h2>
    <p><strong><i class="fas fa-user-tie"></i> Instructor:</strong> Prof. Alex Turner</p>
    <p><strong><i class="fas fa-clock"></i> Duration:</strong> 10 weeks</p>
    <p><strong><i class="fas fa-star"></i> Rating:</strong> 4.5 (445 students)</p>
    <p>
      Algorithmic Trading Basics introduces you to the world of automated trading.
      <br>This course covers key concepts such as indicators, backtesting, and risk management.
    </p>
    <div class="popup-footer">
      <a href="#" class="cancel-btn" onclick="cancel('course-popup5')"><i class="fas fa-times-circle"></i> Cancel</a>
      <a href="#" class="buy-btn" onclick="buyNow(39900, 'Algorithmic Trading Basics')"><i class="fas fa-shopping-cart"></i> Buy Now</a>
    </div>
  </div>
</div>

<!-- Course Popup 6 -->
<div class="popup-overlay" id="course-popup6">
  <div class="popup-window">
    <div class="popup-price"><i class="fas fa-tag"></i> $199</div>
    <h2><i class="fas fa-chart-line"></i> Forex Trading Mastery</h2>
    <p><strong><i class="fas fa-user-tie"></i> Instructor:</strong> Lisa Zhang</p>
    <p><strong><i class="fas fa-clock"></i> Duration:</strong> 7 weeks</p>
    <p><strong><i class="fas fa-star"></i> Rating:</strong> 4.7 (1034 students)</p>
    <p>
      Unlock the Global Currency Market Like a Pro.<br>
      Step into the world of foreign exchange with Forex Trading Mastery, a comprehensive course designed to turn beginners into confident traders.
    </p>
    <div class="popup-footer">
      <a href="#" class="cancel-btn" onclick="cancel('course-popup6')"><i class="fas fa-times-circle"></i> Cancel</a>
      <a href="#" class="buy-btn" onclick="buyNow(19900, 'Forex Trading Mastery')"><i class="fas fa-shopping-cart"></i> Buy Now</a>
    </div>
  </div>
</div>





<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
let popID;

function popup(popupId){
	popID = popupId;
	//Open
    document.getElementById(popupId).style.display = "flex";

}

function cancel(popupId){
	// Close
	document.getElementById(popupId).style.display = 'none';
	
}



  function buyNow(amount, courseName) {
    var options = {
      key: "rzp_test_VWZDC8hKkcXJSl", // ✅ Use your own Razorpay Test Key
      amount: amount, // amount in paise (e.g., 19900 = ₹199.00)
      currency: "INR",
      name: "TradeX",
      description: courseName,
      handler: function (response) {
          cancel(popID)

        alert("✅ Payment Successful!\nPayment ID: " + response.razorpay_payment_id);
      },
      prefill: {
        name: "Madhur",
        email: "madhurmane81@gmail.com"
      },
      theme: {
        color: "#3399cc"
      }
    };

    var rzp = new Razorpay(options);
    rzp.on("payment.failed", function (response) {
        cancel(popID)

      alert("❌ Payment Failed\nReason: " + response.error.description);
    });

    rzp.open();
  }
  
  // Search and Filter Functionality
  document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('courseSearch');
    const filterBtn = document.querySelector('.filter-btn');
    const filterContent = document.getElementById('filterOptions');
    const applyFiltersBtn = document.getElementById('applyFilters');
    const courseCards = document.querySelectorAll('.course-card');
    
    // Toggle filter dropdown
    filterBtn.addEventListener('click', function() {
      filterContent.style.display = filterContent.style.display === 'block' ? 'none' : 'block';
    });
    
    // Close filter dropdown when clicking outside
    document.addEventListener('click', function(event) {
      if (!event.target.closest('.filter-dropdown') && filterContent.style.display === 'block') {
        filterContent.style.display = 'none';
      }
    });
    
    // Search functionality
    searchInput.addEventListener('input', function() {
      filterCourses();
    });
    
    // Apply filters
    applyFiltersBtn.addEventListener('click', function() {
      filterContent.style.display = 'none';
      filterCourses();
    });
    
    // Filter courses based on search and filter criteria
    function filterCourses() {
      const searchTerm = searchInput.value.toLowerCase();
      const selectedLevels = Array.from(document.querySelectorAll('#filterOptions input[type="checkbox"]:checked'))
        .map(checkbox => checkbox.value);
      
      courseCards.forEach(card => {
        const title = card.querySelector('.course-title').textContent.toLowerCase();
        const instructor = card.querySelector('.course-instructor') ? 
          card.querySelector('.course-instructor').textContent.toLowerCase() : '';
        const levelBadge = card.querySelector('.course-badge');
        const level = levelBadge ? levelBadge.classList[1] : '';
        
        const matchesSearch = title.includes(searchTerm) || instructor.includes(searchTerm);
        const matchesFilter = !levelBadge || selectedLevels.includes(level);
        
        if (matchesSearch && matchesFilter) {
          card.style.display = 'flex';
        } else {
          card.style.display = 'none';
        }
      });
    }
  });
</script>

