package com.capstone.db.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

import com.capstone.web.forms.UserForm;

public class UserDao
{
    private NamedParameterJdbcTemplate jdbc;
    @Autowired
    public void setDatasource(DataSource datasource)
    {
        this.jdbc = new NamedParameterJdbcTemplate(datasource);
    }

    public void registerNewUser(UserForm user)
    {
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(user);
        //jdbc..update("INSERT INTO [] VALUES (:username)", paramSource);
    }
}
