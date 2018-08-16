package com.capstone.db.dao;

import static org.junit.Assert.*;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.capstone.db.dto.User;
import com.capstone.web.forms.UserForm;

@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("testing")
@ContextConfiguration(locations={"classpath:spring/beans.xml", "classpath:spring/securityContext.xml"})
public class UserDaoTest
{

    @Autowired
    public UserDao userDao;
    @Autowired
    public DataSource datasource;
    @Autowired
    public PasswordEncoder passwordEncoder;


    @Before
    public void cleanDB() throws SQLException
    {
        datasource.getConnection().createStatement().execute("DELETE FROM authorities");
        datasource.getConnection().createStatement().execute("DELETE FROM users");
    }

    @Test
    public void testRegisterUser()
    {
        UserForm form = new UserForm("someUsername", "password");

        //ensure object retrieved is consistent
        User user = userDao.registerNewUser(form);
        Assert.assertNotNull(user);
        Assert.assertEquals("ROLE_USER", user.getAuthorities().get(0));

        //ensure object is retrievable
        User retrieved = userDao.getUserByUsername(form.getUsername());
        Assert.assertNotNull(retrieved);
        Assert.assertEquals(user, retrieved);

        //ensure password is stored encrypted on the database
        try
        {
            //retrieve with raw SQL
            ResultSet result = datasource.getConnection().createStatement().executeQuery("SELECT password FROM users WHERE username = '" + form.getUsername() +"'");
            result.first();
            String passwordOnDB = result.getString(1);

            Assert.assertNotEquals(form.getPass1(), passwordOnDB);//must not match plaintext
            Assert.assertTrue(passwordEncoder.matches(form.getPass1(), passwordOnDB));//must match encoded
        } catch(SQLException e)
        {
            e.printStackTrace();
            Assert.fail("Could not get password");
        }
    }

    @Test
    public void testDuplicateUsername()
    {
        UserForm form = new UserForm("user1", "password1");

        User user = userDao.registerNewUser(form);
        Assert.assertNotNull(user);

        form = new UserForm("user1", "newPassword");
        User user2 = null;
        try
        {
            user2 = userDao.registerNewUser(form);//should fail
        }catch(Exception err)
        {
        }
        Assert.assertNull(user2);
    }


    @Test
    public void testAddRole()
    {
        UserForm form = new UserForm("username", "password");
        User user = userDao.registerNewUser(form);
        userDao.addRole(user, "ROLE_TESTING");

        Assert.assertNotNull(user);
        Assert.assertEquals(2, user.getAuthorities().size());
        Assert.assertEquals("ROLE_USER", user.getAuthorities().get(0));
        Assert.assertEquals("ROLE_TESTING", user.getAuthorities().get(1));

        User userOnDB = userDao.getUserByUsername(form.getUsername());
        Assert.assertNotNull(userOnDB);
        Assert.assertEquals(2, userOnDB.getAuthorities().size());
        Assert.assertEquals("ROLE_USER", userOnDB.getAuthorities().get(0));
        Assert.assertEquals("ROLE_TESTING", userOnDB.getAuthorities().get(1));

        Assert.assertEquals(user, userOnDB);
    }
}