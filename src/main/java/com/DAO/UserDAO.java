package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.utility.DBConnection;

public class UserDAO {
	
	Connection con=DBConnection.getDBConnection();
	boolean status=false;
	
	public boolean registerUser(User u) {
		try {
			PreparedStatement ps=con.prepareStatement("insert into users(name,email,password,role) values(?,?,?,?)");
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getRole());
			int n=ps.executeUpdate();
			if(n>0) {
				status=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	public User loginUser(String email,String password) {
		try {
			User u=new User();
			PreparedStatement ps=con.prepareStatement("select * from Users where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				u.setUser_id(rs.getInt("user_id"));
	            u.setName(rs.getString("name"));
	            u.setEmail(rs.getString("email"));
	            u.setPassword(rs.getString("password"));
	            u.setRole(rs.getString("role"));
	            return u;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	public List<User> getTechnicians(){
		List<User> u=new ArrayList<>();
		try {
			PreparedStatement ps=con.prepareStatement("select * from users where role='Technician'");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				User u1=new User();
				u1.setUser_id(rs.getInt("user_id"));
				u1.setName(rs.getString("name"));
				u1.setEmail(rs.getString("email"));
				u1.setRole(rs.getString("role"));
				u.add(u1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
		
	}
	
	
}
