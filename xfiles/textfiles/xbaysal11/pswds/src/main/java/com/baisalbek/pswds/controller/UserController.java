package com.baisalbek.pswds.controller;

import com.baisalbek.pswds.entities.User;
import com.baisalbek.pswds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping(
            produces = "application/json"
    )
    public User getUser(@RequestParam(name="email", required = false) String email){

        User personHere = userService.getUser(email);
        return personHere;
    }

    @PostMapping(
            consumes = "application/json",
            produces = "application/json"
    )
    public User createUser(@RequestBody User user){

        userService.createUser(user);
        return user;
    }
    @DeleteMapping
    public HttpStatus deleteUser(@RequestParam(name = "email", required = false) String email){
        userService.deleteUser(email);
        return HttpStatus.OK;
    }
}
