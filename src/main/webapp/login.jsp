<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TradeX-login</title>
 
      <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />

</head>
<body>

 
  <div class="login-container">
    <div class="login-card">
      <h1>TradeX</h1>
      <p class="subtitle">Your gateway to smart trading</p>

      <form action="LoginServlet" method="post">
        <label for="email">Email</label>
        <input id="email" type="text" name="email" placeholder="you@domain.com" required />

        <label for="password">Password</label>
        <input id="password" type="password" name="password" placeholder="••••••••" required />

        <% if ("true".equals(request.getParameter("error"))) { %>
          <div class="error">Invalid credentials, please try again.</div>
        <% } %>

        <button type="submit">Log In</button>
      </form>

      <div class="login-footer">
        © 2025 TradeX. All rights reserved.
      </div>
    </div>
  </div>
</body>
</html>