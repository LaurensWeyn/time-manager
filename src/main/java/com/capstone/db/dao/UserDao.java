package com.capstone.db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.capstone.db.dto.User;
import com.capstone.web.forms.UserForm;

/**
 * In charge of managing and creating user accounts on the database, and ensuring passwords are securely stored.
 */
public class UserDao
{
    private NamedParameterJdbcTemplate jdbc;
    private PasswordEncoder passwordEncoder;


    @Autowired
    public void setDatasource(DataSource datasource)
    {
        this.jdbc = new NamedParameterJdbcTemplate(datasource);
    }

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder)
    {
        this.passwordEncoder = passwordEncoder;
    }

    /**
     * Registers a new user on the database (giving them the user role by default)
     * @param user a form containing the details of the user to be registered
     * @return the new User object
     */
    @Transactional
    public User registerNewUser(UserForm user)
    {
        if(!user.fieldsValid())
            throw new IllegalArgumentException("User must be valid to register");
        user.encodePassword(passwordEncoder);
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(user);
        jdbc.update("INSERT INTO users VALUES (:username, :passEncoded, 1)", paramSource);
        User newUser = new User(user.getUsername());
        addRole(newUser, "ROLE_USER");
        return newUser;
    }

    /**
     * Retrieves a user and their associated authorities from the database.
     * @param username the username to search for
     * @return the user object, or null if the user does not exist
     */
    public User getUserByUsername(String username)
    {
        User user = new User(username);//no DB specific things stored about users

        jdbc.query("SELECT authority FROM authorities WHERE username = :username",
                   new BeanPropertySqlParameterSource(user), resultSet -> {
                       user.getAuthorities().add(resultSet.getString(1));
                   }
        );
        if(user.getAuthorities().size() == 0)
            return null;
        else
            return user;
    }

    /**
     * Adds a new role to an existing user. Should only be necessary right after user creation.
     * @param user the user to add a role to
     * @param newRole the name of the new role to register for this user
     */
    public void addRole(User user, String newRole)
    {
        user.getAuthorities().add(newRole);
        MapSqlParameterSource paramSource = new MapSqlParameterSource();
        paramSource.addValue("role", newRole);
        paramSource.addValue("username", user.getUsername());
        jdbc.update("INSERT INTO authorities(username, authority) VALUES (:username, :role)", paramSource);
    }
}
