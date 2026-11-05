package com.controller;

import java.io.IOException;

import com.DAO.TicketDAO;
import com.model.Ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ResolveTicketServlet")
public class ResolveTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Request came to Resolve Ticket Servlet");

        int ticketId = Integer.parseInt(
                request.getParameter("id")
        );

        TicketDAO ticketDAO = new TicketDAO();

        Ticket ticket = ticketDAO.getTicketById(ticketId);

        request.setAttribute("ticket", ticket);

        request.getRequestDispatcher("resolve-ticket.jsp")
               .forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

			System.out.println("Request came to Resolve Ticket POST");
			
			int ticketId = Integer.parseInt(request.getParameter("ticket_id"));
			
			String resolution = request.getParameter("resolution");
			
			System.out.println("Ticket ID: " + ticketId);
			System.out.println("Resolution: " + resolution);
			
			TicketDAO ticketDAO = new TicketDAO();
			
			boolean result = ticketDAO.resolveTicket(ticketId, resolution);
			
			if(result) {
			
				System.out.println("Ticket resolved successfully");
			
				request.getSession().setAttribute(
			      "message",
			      "Ticket resolved successfully."
				);
			
				request.getSession().setAttribute(
			      "messageType",
			      "success"
				);
			
			} else {
			
			System.out.println("Ticket resolution failed");
			
			request.getSession().setAttribute(
			      "message",
			      "Failed to resolve ticket."
			);
			
			request.getSession().setAttribute(
			      "messageType",
			      "danger"
			);
			}
			
			response.sendRedirect("TechnicianDashboardServlet");
	}

}
