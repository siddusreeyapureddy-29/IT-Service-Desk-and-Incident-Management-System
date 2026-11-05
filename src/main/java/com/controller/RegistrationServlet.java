package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.UserDAO;
import com.model.User;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Request came to registration servlet");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		
		User u=new User(name,email,password,role);
		System.out.println(u);
		
		UserDAO user=new UserDAO();
		boolean status=user.registerUser(u);
		
		if(status) {
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}

}
