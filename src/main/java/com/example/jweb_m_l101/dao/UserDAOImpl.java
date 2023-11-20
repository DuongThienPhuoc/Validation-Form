package com.example.jweb_m_l101.dao;

import com.example.jweb_m_l101.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {
    static final String connectionURL = "jdbc:sqlserver://localhost:1433;encrypt=true;trustServerCertificate=true;databaseName=JNWEBML101_SMS;user=sa;password=sa";

    @Override
    public List<User> getAllUser() {
        List<User> userList = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(connectionURL); Statement stmt = con.createStatement()) {
            String SQL = "Select * From [user]";
            ResultSet rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                userList.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public void saveUser(User user) {

    }
}
