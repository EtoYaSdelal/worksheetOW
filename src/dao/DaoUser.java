package dao;

import model.User;
import util.Connector;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DaoUser {

    private Connector connector;
    private String urldb = "jdbc:postgresql://localhost:5432/worksheet";
    private String userdb = "postgres";
    private String passdb = "admin";


    public DaoUser() {

        try {
            Class.forName("org.postgresql.Driver");
        } catch (
                ClassNotFoundException e) {
            e.printStackTrace();
        }
        connector = new Connector(() -> DriverManager.getConnection(urldb, userdb, passdb));
    }


    public User getUser() {
        return connector.executeTransaction(connection -> {
            User user;
            try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users")) {
                ResultSet resultSet = preparedStatement.executeQuery();
                if (!resultSet.next()) {
                    throw new NullPointerException();
                }
                user = new User(resultSet.getString(2), resultSet.getString(3));
            }
            try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT role from roles where r_login = ?")) {
                preparedStatement.setString(1, user.getLogin());
                ResultSet resultSet = preparedStatement.executeQuery();
                if (!resultSet.next()) {
                    throw new NullPointerException();
                }
                user.setRole(resultSet.getString("role"));
            }
            return user;
        });
    }

    public boolean userIsExist(String login, String pass) {
        return connector.executeTransaction(connection -> {
            try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from users where login = ? and password = ? ")) {
                preparedStatement.setString(1, login);
                preparedStatement.setString(2, pass);
                ResultSet resultSet = preparedStatement.executeQuery();
                int counter = 0;
                while (resultSet.next()) {
                    counter++;
                }
                return counter > 0;
            }
        });
    }

    public String getRole(String login) {
        return connector.executeTransaction(connection -> {
            try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from worksheet.public.roles where r_login = ?")) {
                preparedStatement.setString(1, login);
                ResultSet resultSet = preparedStatement.executeQuery();
                if (!resultSet.next()) {
                    throw new NullPointerException();
                }
                return resultSet.getString("role");
            }
        });
    }
}

