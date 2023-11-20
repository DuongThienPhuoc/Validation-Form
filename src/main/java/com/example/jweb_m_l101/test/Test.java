package com.example.jweb_m_l101.test;

import com.example.jweb_m_l101.dao.UserDAO;
import com.example.jweb_m_l101.dao.UserDAOJPAImpl;
import com.example.jweb_m_l101.entity.User;

public class Test {
    public static void main(String[] args) {
        UserDAO userDAO = new UserDAOJPAImpl();
        User user = new User("Tran","Niem","niem@gmail.com","niemtt","#anduiô00ad");
        userDAO.saveUser(user);
    }
}
