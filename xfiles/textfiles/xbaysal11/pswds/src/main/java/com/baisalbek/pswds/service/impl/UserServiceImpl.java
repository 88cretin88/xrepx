package com.baisalbek.pswds.service.impl;

import com.baisalbek.pswds.entities.User;
import com.baisalbek.pswds.repository.UserRepository;
import com.baisalbek.pswds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Override
    public User createUser(User person){
        if(userRepository.findByEmail(person.getEmail()) != null)
            throw new RuntimeException("NOW IN DB");
        userRepository.save(person);
        return person;
    }

    @Override
    public User getUser(String email){
        if(userRepository.findByEmail(email) == null)
            throw new RuntimeException("NOT FOUND");
        User user = userRepository.findByEmail(email);
        return user;
    }

    @Override
    public String deleteUser(String email) {
        return null;
    }
}
