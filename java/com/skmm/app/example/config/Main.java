package com.skmm.app.example.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Main {

	/**
	 * @param args
	 */
		public static void main(String args[]) throws SQLException {
	        Connection mysqlCon = null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            mysqlCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
	            Statement statement = mysqlCon.createStatement();
	            // Result set get the result of the SQL query
	            //ResultSet resultSet = statement.executeQuery("select * from User");
	            ResultSet resultSet = statement.executeQuery("select * from Item");
	            	
	            while (resultSet.next()) {  //retrieve data
	                String data = resultSet.getString("title");
	                System.out.println(data);
	            } 
	        }catch (Exception e) {
	            System.out.println(e);
	        }
	        

}
}
