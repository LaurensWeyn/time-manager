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

    public void addRole(User user, String newRole)
    {
        user.getAuthorities().add(newRole);
        MapSqlParameterSource paramSource = new MapSqlParameterSource();
        paramSource.addValue("role", newRole);
        paramSource.addValue("username", user.getUsername());
        jdbc.update("INSERT INTO authorities(username, authority) VALUES (:username, :role)", paramSource);
    }
}
