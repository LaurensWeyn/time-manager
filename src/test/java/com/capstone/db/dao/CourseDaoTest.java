package com.capstone.db.dao;

import com.capstone.db.dto.Course;
import com.capstone.db.dto.User;
import com.capstone.web.forms.CourseForm;
import com.capstone.web.forms.UserForm;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("testing")
@ContextConfiguration(locations={"classpath:spring/beans.xml", "classpath:spring/securityContext.xml"})
public class CourseDaoTest
{

    @Autowired
    public UserDao userDao;
    @Autowired
    public CourseDao courseDao;

    @Autowired
    public DataSource datasource;


    private User user1;
    private User user2;

    @Before
    public void cleanDB() throws SQLException
    {
        Connection connection = datasource.getConnection();
        connection.createStatement().execute("DELETE FROM courses");
        connection.createStatement().execute("DELETE FROM authorities");
        connection.createStatement().execute("DELETE FROM users");
        connection.close();

        user1 = userDao.registerNewUser(new UserForm("user1", "password1"));
        user2 = userDao.registerNewUser(new UserForm("user2", "password2"));
    }

    @Test
    public void testCreateCourses()
    {
        CourseForm courseForm = new CourseForm();
        courseForm.setName("new course");
        courseForm.setColor(1234);
        courseForm.setCourseCode("NEW_COURSE1");
        courseForm.setMetaUsername(user1.getUsername());
        courseForm.setPriority(5);
        long id = courseDao.createCourse(courseForm);

        Course course = courseDao.getCourseByID(id);
        Assert.assertNotNull(course);
        Assert.assertEquals(courseForm.getName(), course.getName());
        Assert.assertEquals(courseForm.getColor(), course.getColor());
        Assert.assertEquals(courseForm.getCourseCode(), course.getCode());
        Assert.assertEquals(courseForm.getPriority(), course.getPriority());

        List<Course> courses = courseDao.getCoursesForUser(user1);
        Assert.assertNotNull(courses);
        Assert.assertEquals(1, courses.size());
        Assert.assertEquals(course, courses.get(0));
    }

    @Test
    public void testUserCourseIndependence()
    {
        long id1 = courseDao.createCourse(new CourseForm("Course 1", user1));
        long id2 = courseDao.createCourse(new CourseForm("Course 2", user1));
        long id3 = courseDao.createCourse(new CourseForm("Course 3", user2));

        Assert.assertNotEquals(id1, id2);
        Assert.assertNotEquals(id2, id3);

        List<Course> user1Courses = courseDao.getCoursesForUser(user1);
        Assert.assertEquals(2, user1Courses.size());
        Set<Long> ids = new HashSet<>();
        Set<String> names = new HashSet<>();
        for(Course course:user1Courses)
        {
            ids.add(course.getId());
            names.add(course.getName());
        }
        Assert.assertTrue(ids.contains(id1));
        Assert.assertTrue(ids.contains(id2));
        Assert.assertTrue(names.contains("Course 1"));
        Assert.assertTrue(names.contains("Course 2"));

        List<Course> user2Courses = courseDao.getCoursesForUser(user2);
        Assert.assertEquals(1, user2Courses.size());
        Assert.assertEquals(id3, user2Courses.get(0).getId());
        Assert.assertEquals("Course 3", user2Courses.get(0).getName());
    }

    @Test
    public void testModifyCourse()
    {
        CourseForm originalCourseForm = new CourseForm();
        originalCourseForm.setName("new course");
        originalCourseForm.setColor(1234);
        originalCourseForm.setCourseCode("NEW_COURSE1");
        originalCourseForm.setMetaUsername(user1.getUsername());
        originalCourseForm.setPriority(5);
        long id = courseDao.createCourse(originalCourseForm);

        Course originalCourse = courseDao.getCourseByID(id);
        Assert.assertNotNull(originalCourse);
        CourseForm modifications = new CourseForm(originalCourse);
        modifications.setName("edited name");
        modifications.setColor(4321);
        modifications.setCourseCode("DIFFERENT");
        modifications.setPriority(1);

        courseDao.editCourse(modifications);
        Course modified = courseDao.getCourseByID(id);

        Assert.assertNotEquals(originalCourse, modified);
        Assert.assertEquals("edited name", modified.getName());
        Assert.assertEquals(4321, modified.getColor());
        Assert.assertEquals("DIFFERENT", modified.getCode());
        Assert.assertEquals(1, modified.getPriority());

        //try revert and check if equals still works
        originalCourseForm.setMetaId(id);
        courseDao.editCourse(originalCourseForm);
        Course reverted = courseDao.getCourseByID(id);
        Assert.assertNotEquals(modified, reverted);
        Assert.assertEquals(originalCourse, reverted);
    }
}