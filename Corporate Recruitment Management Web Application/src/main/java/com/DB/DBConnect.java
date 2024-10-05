package com.DB;
import java.sql.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class DBConnect {
    private static DataSource dataSource;

    static {
        try {
            InitialContext ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:jboss/datasources/MySQLDS");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConn() throws SQLException {
        return dataSource.getConnection();
    }
}