package util;

import java.sql.Connection;
import java.sql.SQLException;

public interface Transaction<T> {
    T execute(Connection connection) throws SQLException;
}
