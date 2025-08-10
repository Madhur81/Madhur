package com.tradex.model;

public class User {
    private int id;
    private String fullName, email, phone, location, bio, profileImage;
    private String imagePath;


    // Getters & Setters
    // ...
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public String getBio() {
        return bio;
    }
    public void setBio(String bio) {
        this.bio = bio;
    }
    public String getProfileImage() {
        return profileImage;
    }
    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }
 // Add getter
    public String getImagePath() {
        return imagePath;
    }

    // Add setter
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
