package com.databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	public static Connection connectivity() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/kimsapplication";
		String username = "root";
		String password = "root";

		Connection connection = DriverManager.getConnection(url, username, password);
		if (connection != null)
			System.out.println("connection established");

		return connection;
	}
}
