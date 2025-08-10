<div class="main-page">
<div class="main-content">
    <div class="main-Title-of-Page">
      <h1>Support</h1>
      <p class="support-description">
        Get help with your account, courses, and trading questions.
      </p>
    </div>

    <div class="support-grid">
      <!-- FAQ Section -->
      <div class="faq-section">
        <h2>Frequently Asked Questions</h2>
        <div class="faq-list">
          <div class="faq-item">
            <div class="faq-question">How do I reset my password?</div>
            <div class="faq-answer">
              You can reset your password by clicking the "Forgot Password" link
              on the login page. Enter your email address and follow the
              instructions sent to your email.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">Can I download course materials?</div>
            <div class="faq-answer">
              Yes, all course materials are downloadable for offline access.
              Look for the download icon next to each lesson in your course
              dashboard.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">
              How does the paper trading feature work?
            </div>
            <div class="faq-answer">
              Paper trading allows you to practice trading with virtual money in
              real market conditions. Access it from your Trading Desk to test
              strategies risk-free.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">
              What devices can I use to access TradeX?
            </div>
            <div class="faq-answer">
              TradeX is accessible on any device with a web browser, including
              desktops, laptops, tablets, and smartphones. We also offer native
              apps for iOS and Android.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">How do I track my learning progress?</div>
            <div class="faq-answer">
              Your progress is automatically tracked in the Progress section.
              View completed lessons, quiz scores, and overall course completion
              rates.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">Can I get a refund for a course?</div>
            <div class="faq-answer">
              Yes, we offer a 30-day money-back guarantee for all courses.
              Contact support within 30 days of purchase if you're not
              satisfied.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">How do I contact my instructor?</div>
            <div class="faq-answer">
              You can message your instructor directly through the course
              dashboard or use the Messages section to start a conversation.
            </div>
          </div>
          <div class="faq-item">
            <div class="faq-question">
              Are the trading strategies suitable for beginners?
            </div>
            <div class="faq-answer">
              Yes, our courses are designed for all skill levels. Beginners can
              start with fundamental courses and progress to advanced strategies
              at their own pace.
            </div>
          </div>
        </div>
      </div>

      <!-- Contact Form Section -->
      <div class="contact-section">
        <h2>Contact Support</h2>
        <form class="contact-form" action="${pageContext.request.contextPath}/submitContact" method="post">
          <div class="form-row">
            <div class="form-group">
              <label for="name">Name</label>
              <input type="text" id="name" name="name" required />
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" id="email" name="email" required />
            </div>
          </div>
          <div class="form-group">
            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" required />
          </div>
          <div class="form-group">
            <label for="message">Message</label>
            <textarea
              id="message"
              name="message"
              placeholder="Describe your issue or question in detail..."
              required
            ></textarea>
          </div>
          <button type="submit" class="submit-button">Send Message</button>
        </form>
      </div>
    </div>

    <!-- Other Ways Section -->
    <div class="other-ways">
      <h2>Other Ways to Reach Us</h2>
      <div class="contact-methods">
        <div class="contact-method">
          <div class="contact-method-icon">📧</div>
          <div class="contact-method-info">
            <h3>Email Support</h3>
            <p>support@tradex.com</p>
          </div>
        </div>
        <div class="contact-method">
          <div class="contact-method-icon">💬</div>
          <div class="contact-method-info">
            <h3>Live Chat</h3>
            <p>Available 9 AM - 6 PM EST</p>
          </div>
        </div>
        <div class="contact-method">
          <div class="contact-method-icon">📱</div>
          <div class="contact-method-info">
            <h3>Phone Support</h3>
            <p>+1 (555) 123-4567</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  // Check for success message on page load
  window.addEventListener('DOMContentLoaded', function() {
    <% if(request.getAttribute("message") != null) { %>
      alert('<%= request.getAttribute("message") %>');
    <% } %>
  });
</script>


