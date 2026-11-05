package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.TicketDAO;


@WebServlet("/StartWorkServlet")
public class StartWorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

			System.out.println("Request came to Start Work Servlet");
			
			String id = request.getParameter("id");
			
			System.out.println("Received id = " + id);
			
			int ticketId = Integer.parseInt(id);
			
			TicketDAO ticketDAO = new TicketDAO();
			
			boolean result = ticketDAO.startWork(ticketId);
			
			if(result) {
			
				System.out.println("Ticket started successfully");
				
				request.getSession().setAttribute(
				   "message",
				   "Ticket started successfully. Status changed to IN_PROGRESS."
			);
			
			request.getSession().setAttribute(
			   "messageType",
			   "success"
			);
			
			} else {
			
					System.out.println("Ticket start failed");
					
					request.getSession().setAttribute(
					   "message",
					   "Failed to start the ticket."
					);
					
					request.getSession().setAttribute(
					   "messageType",
					   "danger"
					);
			}
			
			response.sendRedirect("TechnicianDashboardServlet");
			}
}
