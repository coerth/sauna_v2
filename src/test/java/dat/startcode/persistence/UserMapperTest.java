package dat.startcode.persistence;

import dat.startcode.entities.User;
import dat.startcode.exceptions.DatabaseException;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import static org.junit.jupiter.api.Assertions.*;

class UserMapperTest
{
    private final static String USER = "root";
    private final static String PASSWORD = "Hof210091_Hvorerden";
    private final static String URL = "jdbc:mysql://localhost:3306/sauna_test?serverTimezone=CET&allowPublicKeyRetrieval=true&useSSL=false";

    private static ConnectionPool connectionPool;
    private static UserMapper userMapper;

    @BeforeAll
    public static void setUpClass() {
            connectionPool = new ConnectionPool(USER, PASSWORD, URL);
            userMapper = new UserMapper(connectionPool);
    }

    @BeforeEach
    void setUp()
    {
        try (Connection testConnection = connectionPool.getConnection()) {
            try (Statement stmt = testConnection.createStatement() ) {
                // Remove all rows from all tables
                stmt.execute("delete from user");
                // Indsæt et par brugere
                stmt.execute("insert into user (email, password, role) " +
                        "values ('a@a.dk','1234','laaner'),('b@b.dk','1234','admin'), ('c@c.dk','1234','laaner')");
            }
        } catch (SQLException throwables) {
            System.out.println(throwables.getMessage());
            fail("Database connection failed");
        }
    }

    @Test
    void testConnection() throws SQLException
    {
        Connection connection = connectionPool.getConnection();
        assertNotNull(connection);
        if (connection != null)
        {
            connection.close();
        }
    }

    @Test
    void login() throws DatabaseException
    {
        User expectedUser = new User("a@a.dk","1234","laaner");
        User actualUser = userMapper.login("a@a.dk","1234");
        assertEquals(expectedUser, actualUser);
    }

    @Test
    void invalidPasswordLogin() throws DatabaseException
    {
        assertThrows(DatabaseException.class, () -> userMapper.login("a@a.dk","123"));
    }

    @Test
    void invalidEmailLogin() throws DatabaseException
    {
        assertThrows(DatabaseException.class, () -> userMapper.login("a@b.dk","1234"));
    }

    @Test
    void createUser() throws DatabaseException
    {
        User newUser = userMapper.createPassword("ole@ole.dk", "1234", "laaner");
        User logOnUser = userMapper.login("ole@ole.dk","1234");
        User expectedUser = new User("ole@ole.dk", "1234", "laaner");
        assertEquals(expectedUser, newUser);
        assertEquals(expectedUser, logOnUser);

    }
}