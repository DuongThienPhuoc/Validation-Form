package com.example.jweb_m_l101.dao;

import com.example.jweb_m_l101.entity.User;

import java.util.List;

public interface UserDAO {
    List<User> getAllUser();
    void saveUser(User user);
}
