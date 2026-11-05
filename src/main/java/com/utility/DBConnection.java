package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	static Connection con=null;
	public static Connection getDBConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/service_desk", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}

}
