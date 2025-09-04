package com.rohitgawande.waterquality.model;

public class Issue {
    private int id;
    private String username;
    private String location;
    private String description;
    private byte[] image;
    private String status;

    public Issue() {}

    public Issue(int id, String username, String location, String description, String status) {
        this.id = id;
        this.username = username;
        this.location = location;
        this.description = description;
        this.status = status;
    }

    // Full constructor
    public Issue(int id, String username, String location, String description, byte[] image, String status) {
        this.id = id;
        this.username = username;
        this.location = location;
        this.description = description;
        this.image = image;
        this.status = status;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public byte[] getImage() { return image; }
    public void setImage(byte[] image) { this.image = image; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
