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

@WebServlet(name = "listUser", urlPatterns = {"/"})
public class UserController extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOJPAImpl();
        List<User> userList = userDAO.getAllUser();
        request.setAttribute("list", userList);
        request.getRequestDispatcher("/list-user/userList.jsp").forward(request, response);
    }
}
