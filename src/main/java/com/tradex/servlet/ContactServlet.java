package com.tradex.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.tradex.model.Contact;
import com.tradex.dao.ContactDAO;

import java.io.IOException;

@WebServlet("/submitContact")
public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Contact contact = new Contact(name, email, subject, message);
        ContactDAO dao = new ContactDAO();

        boolean isSaved = dao.saveContact(contact);

        if (isSaved) {
        	response.sendRedirect(request.getContextPath() + "/index.jsp?page=support");
        	

        } else {
            response.sendRedirect("support.jsp");
        }
    }
}
