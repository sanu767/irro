package com.saasforedu.irro.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {

	public static void main(String args[]) throws SQLException {

		Connection mysqlCon = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			mysqlCon = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/irronew", "root", "root");
			Statement statement = mysqlCon.createStatement();
			
			
			ResultSet resultSet = statement.executeQuery("select * from User");

			while (resultSet.next()) { 
				String data = resultSet.getString("code");
				System.out.println(data);
			}

			resultSet.close();
			statement.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			mysqlCon.close();
		}

	}
}
