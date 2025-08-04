<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.tradex.model.User" %>

<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<div class="main-page">
  <div class="main-content">
 
  
    <div class="main-Title-of-Page">
      <h1>Profile</h1>
      <p class="profile-description">Manage your personal information and preferences</p>
    </div>

    <!-- Two Column Layout -->
    <div class="profile-layout">
      <!-- Left Column - Profile Summary -->
      <div class="profile-summary">
        <div class="profile-image-container">
          <img class="profile-image" src="<%= currentUser.getImagePath() %>" alt="Profile" width="150" height="150">
        </div>
        <h2 class="profile-name"><%= currentUser.getFullName() %></h2>
        <p class="profile-email"><%= currentUser.getEmail() %></p>
        <p class="member-since">Member since </p>
      </div>

      <!-- Right Column - Personal Information -->
      <div class="personal-info-section">
        <div class="section-header">
          <h2>Personal Information</h2>
          <button class="edit-profile">Edit Profile</button>
        </div>

        <div class="info-grid">
          <div class="info-group">
            <label>Full Name</label>
            <div class="input-like">
              <i class="icon">👤</i>
              <span><%= currentUser.getFullName() %></span>
            </div>
          </div>
          <div class="info-group">
            <label>Email Address</label>
            <div class="input-like">
              <i class="icon">✉️</i>
              <span><%= currentUser.getEmail() %></span>
            </div>
          </div>
          <div class="info-group">
            <label>Phone Number</label>
            <div class="input-like">
              <i class="icon">📞</i>
              <span><%= currentUser.getPhone() %></span>
            </div>
          </div>
          <div class="info-group">
            <label>Location</label>
            <div class="input-like">
              <i class="icon">📍</i>
              <span><%= currentUser.getLocation() %></span>
            </div>
          </div>

          <div class="info-group full-width">
            <label>Bio</label>
            <div class="input-like bio">
              <span><%= currentUser.getBio() %></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

 <!-- Edit Profile Modal -->
<div id="editProfileModal" class="modal-overlay">
  <div class="modal-box">
    <h2>Edit Profile</h2>
    <form action="${pageContext.request.contextPath}/EditProfileServlet" method="post" enctype="multipart/form-data">


		 <label>Profile photo</label>
      <input type="file" name="profileImage" />
      
      <label>Full Name<%= currentUser.getId() %></label>
      <input type="text" name="fullName" value="<%= currentUser.getFullName() %>" required>

      <label>Email</label>
      <input type="email" name="email" value="<%= currentUser.getEmail() %>" required>

      <label>Phone</label>
      <input type="text" name="phone" value="<%= currentUser.getPhone() %>">

      <label>Location</label>
      <input type="text" name="location" value="<%= currentUser.getLocation() %>">

      <label>Bio</label>
      <textarea name="bio" rows="3"><%= currentUser.getBio() %></textarea>
      
      

   

      <div class="modal-actions">
        <button type="submit">Save</button>
        <button type="button" onclick="closeModal()">Cancel</button>
      </div>
    </form>
  </div>
</div>


<script>
  const modal = document.getElementById("editProfileModal");
  const editBtn = document.querySelector(".edit-profile");

  editBtn.addEventListener("click", () => {
    modal.style.display = "flex";
  });

  function closeModal() {
    modal.style.display = "none";
  }

  // Optional: close on outside click
  window.onclick = function(event) {
    if (event.target === modal) {
      modal.style.display = "none";
    }
  }
</script>

