package com.example.trabalhof3;

public class User
{
    private String name;
    private boolean access;
    public User(String name) {
        this.name = name;
        access=true;
    }
    public String getName() {
        return name;
    }
    public boolean isAccess() {
        return access;
    }
}
