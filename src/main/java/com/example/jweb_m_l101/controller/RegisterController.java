package com.example.jweb_m_l101.controller;

import com.example.jweb_m_l101.dao.UserDAO;
import com.example.jweb_m_l101.dao.UserDAOJPAImpl;
import com.example.jweb_m_l101.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "register-controller", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOJPAImpl();
        String confirm = "Register successfully!";
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String email = req.getParameter("email");
        String userName = req.getParameter("user_name");
        String password = req.getParameter("password");
        User user = new User(firstName, lastName, email, userName, password);
        userDAO.saveUser(user);
        List<User> userList = userDAO.getAllUser();
        req.setAttribute("confirm", confirm);
        req.setAttribute("list", userList);
        req.getRequestDispatcher("/list-user/userList.jsp").forward(req, resp);
    }
}
