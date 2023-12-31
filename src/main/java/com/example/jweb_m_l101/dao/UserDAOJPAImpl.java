package com.example.jweb_m_l101.dao;

import com.example.jweb_m_l101.entity.User;
import jakarta.persistence.*;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

public class UserDAOJPAImpl implements UserDAO {
    private final EntityManagerFactory entityManagerFactory;

    public UserDAOJPAImpl() {
        this.entityManagerFactory = Persistence.createEntityManagerFactory("CFG");
    }

    @Override
    public List<User> getAllUser() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            TypedQuery<User> query = entityManager.createQuery("from User ", User.class);
            return Objects.requireNonNullElse(query.getResultList(),Collections.emptyList());
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void saveUser(User user) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            // Handle the exception
        } finally {
            entityManager.close();
        }
    }
}
