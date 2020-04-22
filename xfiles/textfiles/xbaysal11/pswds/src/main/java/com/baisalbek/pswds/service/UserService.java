package com.baisalbek.pswds.service;

import com.baisalbek.pswds.entities.User;

public interface UserService {
    public User createUser(User person);
    public User getUser(String email);
    public String deleteUser(String email);
}
