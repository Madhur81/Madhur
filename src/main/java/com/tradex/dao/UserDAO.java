package com.tradex.dao;
import java.util.*;
import com.tradex.model.User;
import java.sql.*;
import com.tradex.utils.DBUtil;


public class UserDAO {
    Connection conn;
    
    public UserDAO(Connection conn) {
        this.conn = conn;
    }

  
    public User validateUser(String email, String password) {
        User user = null;
        try {
            Connection con = DBUtil.getConnection();
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);  // In production, use hashed password

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
//                user.setFullName(rs.getString("username"));
         
                user.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            User user = new User();
            user.setId(id);
            user.setFullName(rs.getString("full_name"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));
            user.setLocation(rs.getString("location"));
            user.setBio(rs.getString("bio"));
            user.setImagePath(rs.getString("image_path"));
            return user;
        }

        return null;
    }

    public boolean updateUser(User user) throws SQLException {
        String sql = "UPDATE users SET full_name=?, email=?, phone=?, location=?, bio=?,image_path=? WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, user.getFullName());
        stmt.setString(2, user.getEmail());
        stmt.setString(3, user.getPhone());
        stmt.setString(4, user.getLocation());
        stmt.setString(5, user.getBio());
        stmt.setString(6,user.getImagePath());
        stmt.setInt(7, user.getId());
        return stmt.executeUpdate() > 0;
    }
}
