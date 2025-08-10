package com.tradex.servlet;

import com.tradex.model.User;
import com.tradex.dao.UserDAO;
import com.tradex.utils.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1MB
    maxFileSize = 5 * 1024 * 1024,        // 5MB
    maxRequestSize = 10 * 1024 * 1024     // 10MB
)
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Ensure correct encoding
        req.setCharacterEncoding("UTF-8");

        // Retrieve the logged-in user from session
        User sessionUser = (User) req.getSession().getAttribute("user");
        if (sessionUser == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = sessionUser.getId();
        // Capture old image path before overwrite
        String oldImageRelative = sessionUser.getImagePath(); // e.g. "uploads/user_1_...png"

        // Retrieve form fields
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String location = req.getParameter("location");
        String bio = req.getParameter("bio");

        // Handle file upload
        Part filePart = req.getPart("profileImage");
        String newFileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            // Generate a unique filename
            newFileName = "user_" + userId + "_" + System.currentTimeMillis() + "_" +
                          filePart.getSubmittedFileName();

            // Determine upload directory in webapp
            String uploadPath = getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Write the file to disk
            String fullNewPath = uploadPath + File.separator + newFileName;
            filePart.write(fullNewPath);
            System.out.println("Image saved at: " + fullNewPath);

            // Update user image path
            sessionUser.setImagePath("uploads/" + newFileName);
        }

        // Update user fields
        sessionUser.setFullName(fullName);
        sessionUser.setEmail(email);
        sessionUser.setPhone(phone);
        sessionUser.setLocation(location);
        sessionUser.setBio(bio);

        // Persist changes to database
        try (Connection conn = DBUtil.getConnection()) {
            UserDAO dao = new UserDAO(conn);
            dao.updateUser(sessionUser);

            // Delete old image file if a new one was uploaded and old exists
            if (newFileName != null 
                && oldImageRelative != null 
                && !oldImageRelative.isEmpty() 
                && !oldImageRelative.equals("uploads/default.png")) {

                String fullOldImagePath = getServletContext().getRealPath("/") + oldImageRelative;
                File oldFile = new File(fullOldImagePath);
                if (oldFile.exists() && !oldFile.delete()) {
                    System.err.println("Failed to delete old profile image: " + fullOldImagePath);
                }
            }

            // Update session attribute and forward
            req.getSession().setAttribute("user", sessionUser);
            req.setAttribute("page", "settings");
            req.setAttribute("message", "Profile successfully updated");
            req.getRequestDispatcher("index.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.sendError(500, "Error updating profile");
        }
    }
}
