package dao;

import model.About;
import model.Education;
import model.Other;
import model.Person;
import util.Connector;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DAO {
    private Connector connector;
//    private String url = "jdbc:postgresql://localhost:5432/postgres";
//    private String user = "postgres";
//    private String pass = "admin";

    public DAO() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        connector = new Connector(() -> DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "admin"));
    }

    public void clear() {
        connector.execute("DELETE from person");
    }

    public int size() {
        return connector.execute("SELECT count(*) FROM PERSON", preparedStatement -> {
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next() ? resultSet.getInt(1) : 0;
        });
    }

    public void save(Person person) {
        connector.executeTransaction(connection -> {
            try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT into " +
                    "person(id, name, surname, email, birthday, phone)" +
                    " VALUES (?,?,?,?,?,?)")) {
                preparedStatement.setString(1, person.getId());
                preparedStatement.setString(2, person.getName());
                preparedStatement.setString(3, person.getSurname());
                preparedStatement.setString(4, person.getEmail());
                preparedStatement.setTimestamp(5, Timestamp.valueOf(person.getBirthday().atStartOfDay()));
                preparedStatement.setString(6, person.getPhone());
                if (preparedStatement.executeUpdate() == 0) {
                    throw new RuntimeException(person + " don't save with runtime exception");
                }
            }
            saveAbout(person, connection);
            saveEducation(person, connection);
            saveOther(person, connection);
            return null;
        });
    }

    public Person get(String id) {

        return connector.executeTransaction(connection -> {
            Person person;
            try (PreparedStatement preparedStatement = connection.prepareStatement("Select * from person where id = ?")) {
                preparedStatement.setString(1, id);
                ResultSet resultSet = preparedStatement.executeQuery();
                if (!resultSet.next()) {
                    throw new NullPointerException();
                }
                person = getPersonFromDB(resultSet);
            }

            try (PreparedStatement preparedStatement = connection.prepareStatement("Select * from about where person_id = ?")) {
                preparedStatement.setString(1, person.getId());
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    getAboutFromBD(person, resultSet);
                }
            }
            try (PreparedStatement preparedStatement = connection.prepareStatement("Select * from education where person_id = ?")) {
                preparedStatement.setString(1, person.getId());
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    getEducationFromDB(person, resultSet);
                }
            }
            try (PreparedStatement preparedStatement = connection.prepareStatement("Select * from other where person_id = ?")) {
                preparedStatement.setString(1, person.getId());
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    getOtherFromDB(person, resultSet);
                }

            }
            return person;
        });
    }

    public List<Person> getAll() {
        return connector.executeTransaction(connection -> {
            Map<String, Person> map = new LinkedHashMap<>();
            try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM person order by name,surname,id")) {
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Person person = getPersonFromDB(resultSet);
                    map.put(person.getId(), person);
                }
            }
            try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM about")) {
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    getAboutFromBD(map.get(resultSet.getString(2)), resultSet);
                }
            }
            try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM education")) {
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    getEducationFromDB(map.get(resultSet.getString(2)), resultSet);
                }
            }
            try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM other")) {
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    getOtherFromDB(map.get(resultSet.getString(2)), resultSet);
                }
            }
            return new ArrayList<>(map.values());
        });
    }


    private void saveOther(Person person, Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("insert into " +
                "other(person_id, other_type, other_value)" +
                " VALUES (?,?,?)")) {
            mapIterator(person.getOther(), person, preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void saveEducation(Person person, Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("insert into " +
                "education(person_id, edu_type, edu_value)" +
                " VALUES (?,?,?)")) {
            mapIterator(person.getEducation(), person, preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void saveAbout(Person person, Connection connection) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("insert into " +
                "about(person_id, about_type, about_value)" +
                " VALUES (?,?,?)")) {
            mapIterator(person.getAbout(), person, preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private void mapIterator(Map<? extends Enum, String> enumMap, Person person, PreparedStatement
            preparedStatement) throws SQLException {
        for (Map.Entry<? extends Enum, String> entry : enumMap.entrySet()) {
            preparedStatement.setString(1, person.getId());
            preparedStatement.setString(2, entry.getKey().name());
            preparedStatement.setString(3, entry.getValue());
            preparedStatement.addBatch();
        }
        preparedStatement.executeBatch();
    }

    private void getOtherFromDB(Person person, ResultSet resultSet) throws SQLException {
        String value;
        value = resultSet.getString("other_value");
        if (value != null)
            person.setOther(Other.valueOf(resultSet.getString("other_type")), value);
    }

    private void getEducationFromDB(Person person, ResultSet resultSet) throws SQLException {
        String value;
        value = resultSet.getString("edu_value");
        if (value != null)
            person.setEducation(Education.valueOf(resultSet.getString("edu_type")), value);
    }

    private void getAboutFromBD(Person person, ResultSet resultSet) throws SQLException {
        String value;
        value = resultSet.getString("about_value");
        if (value != null)
            person.setAbout(About.valueOf(resultSet.getString("about_type")), value);
    }

    private Person getPersonFromDB(ResultSet resultSet) throws SQLException {
        Person person;
        person = new Person(resultSet.getString(1), resultSet.getString(2),
                resultSet.getString(3),
                resultSet.getString(4),
                resultSet.getTimestamp(5).toLocalDateTime().toLocalDate());
        person.setPhone(resultSet.getString(6));
        return person;
    }
}
