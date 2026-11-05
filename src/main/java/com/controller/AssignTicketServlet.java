package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.DAO.TicketDAO;
import com.DAO.UserDAO;
import com.model.User;


@WebServlet("/AssignTicketServlet")
public class AssignTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Request came to Assign ticket servlet get method");
		int ticketId = Integer.parseInt(request.getParameter("id"));
		
		UserDAO userDAO = new UserDAO();
		List<User> technicians = userDAO.getTechnicians();
		request.setAttribute("technicians", technicians);
		
		
		request.setAttribute("ticketId", ticketId);
		
		request.getRequestDispatcher("assign-ticket.jsp")
	       .forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Request came to Assign ticket servlet post method");

        int ticketId = Integer.parseInt(
                request.getParameter("ticket_id")
        );

        int technicianId = Integer.parseInt(
                request.getParameter("technician_id")
        );

        TicketDAO ticketDAO = new TicketDAO();

        boolean result = ticketDAO.assignTicket(
                ticketId,
                technicianId
        );
        

        if(result) {

            System.out.println("Ticket assigned successfully");

            response.sendRedirect("AdminDashboardServlet");

        } else {

            System.out.println("Ticket assignment failed");

            response.sendRedirect(
                    "AssignTicketServlet?id=" + ticketId
            );
        }
    }
}


