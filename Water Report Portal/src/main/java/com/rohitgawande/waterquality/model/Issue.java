package com.rohitgawande.waterquality.model;

import java.io.InputStream;

public class Issue {
    private String name;
    private String location;
    private String description;
    private InputStream image; 
    private int id;

  

    // Getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public InputStream getImage() {
        return image;
    }
    public void setImage(InputStream image) {
        this.image = image;
    }
}
