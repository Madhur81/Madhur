<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TradeX</title>
 <%@ include file="pages/css_include.jsp" %>
  <!-- FontAwesome for icons -->
  <script src="https://kit.fontawesome.com/052173b0f7.js" crossorigin="anonymous"></script>
     <script>
        document.addEventListener('DOMContentLoaded', function() {
            const faqs = document.querySelectorAll('.faq-question');
            
            faqs.forEach((question) => {
                question.addEventListener('click', () => {
                    const item = question.parentElement;

                    // Close other open answers (optional)
                    document.querySelectorAll('.faq-item').forEach((faq) => {
                        if (faq !== item) faq.classList.remove('active');
                    });

                    // Toggle current item
                    item.classList.toggle('active');
                });
            });
        });
    </script>

    

</head>
<body>
 
    <%@ include file="pages/sidebar.jsp" %>
    <%@ include file="pages/header.jsp" %>
  
        <%
            String pageName = request.getParameter("page");
            if (pageName == null || pageName.trim().isEmpty()) {
                pageName = "home";
            }
            if (!pageName.matches("^[a-zA-Z0-9_-]+$")) {
                pageName = "home"; // security fallback
            }

            RequestDispatcher rd = request.getRequestDispatcher("pages/" + pageName + ".jsp");
            rd.include(request, response);
        %>
    
 
</body>
</html>