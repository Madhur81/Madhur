<div class="main-page">
<div class="main-content">
    <div class="main-Title-of-Page">
      <h1>Settings</h1>
      <p class="settings-description">
        Manage your preferences and account settings
      </p>
    </div>

    <!-- General Preferences -->
    <div class="settings-card">
      <h2>General Preferences</h2>
      <div class="currency-selector">
        <div class="currency-label">Default Currency</div>
        <div class="select-wrapper">
          <select id="currency" name="currency">
            <option value="USD">USD</option>
            <option value="EUR">EUR</option>
            <option value="GBP">GBP</option>
            <option value="JPY">JPY</option>
            <option value="AUD">AUD</option>
          </select>
        </div>
      </div>
    </div>

    <!-- Notifications -->
    <div class="settings-card">
      <h2>Notifications</h2>
      <div class="notification-grid">
        <div class="notification-item">
          <div class="notification-info">
            <h3>Email Notifications</h3>
            <p>Receive updates via email</p>
          </div>
          <label class="toggle">
            <input type="checkbox" checked />
            <span class="toggle-slider"></span>
          </label>
        </div>

        <div class="notification-item">
          <div class="notification-info">
            <h3>Market Alerts</h3>
            <p>Get notified of market changes</p>
          </div>
          <label class="toggle">
            <input type="checkbox" checked />
            <span class="toggle-slider"></span>
          </label>
        </div>

        <div class="notification-item">
          <div class="notification-info">
            <h3>Course Reminders</h3>
            <p>Reminders about assignments and deadlines</p>
          </div>
          <label class="toggle">
            <input type="checkbox" checked />
            <span class="toggle-slider"></span>
          </label>
        </div>
      </div>
    </div>

    <!-- Appearance Section -->
    <div class="profile-card appearance-section">
      <h2>Appearance</h2>
      <div class="appearance-option">
        <div class="option-info">
          <h3>Dark Mode</h3>
          <p>Toggle between light and dark themes</p>
        </div>
        <label class="toggle">
          <input type="checkbox" checked />
          <span class="toggle-slider"></span>
        </label>
      </div>
    </div>
</div>
</div>
