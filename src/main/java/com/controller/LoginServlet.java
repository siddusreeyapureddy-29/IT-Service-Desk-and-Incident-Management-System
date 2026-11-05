package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.UserDAO;
import com.model.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Request came to Login Servlet");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDAO user=new UserDAO();
		
		User u1=user.loginUser(email, password);
		
		if(u1!= null) {
			HttpSession session=request.getSession();
			session.setAttribute("user", u1);
			
			System.out.println("Login Successful");
		    System.out.println("Name: " + u1.getName());
		    System.out.println("Role: " + u1.getRole());
		    
		    if(u1.getRole().equals("Employee")) {
				response.sendRedirect("EmployeeDashboardServlet");
			}
			else if(u1.getRole().equals("Technician")) {
				response.sendRedirect("TechnicianDashboardServlet");
			}
			else if(u1.getRole().equals("Admin")) {
				response.sendRedirect("AdminDashboardServlet");
			}
			else {
				response.sendRedirect("login.jsp");
			}

		} else {

		    System.out.println("Invalid Email or Password");
		}
		
	}

}
