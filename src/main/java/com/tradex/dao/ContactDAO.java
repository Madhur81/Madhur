package com.tradex.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.*;
import com.tradex.model.Contact;

public class ContactDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3307/madhur";
    private String jdbcUsername = "root";
    private String jdbcPassword = "madhur81";

    private static final String INSERT_QUERY =
        "INSERT INTO contact_messages (name, email, subject, message) VALUES (?, ?, ?, ?)";

    public boolean saveContact(Contact contact) {
        boolean status = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = conn.prepareStatement(INSERT_QUERY);
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getSubject());
            ps.setString(4, contact.getMessage());

            status = ps.executeUpdate() > 0;

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
