package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.DAO.TicketDAO;
import com.model.Ticket;
import com.model.User;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("request came to admin dashboard");
        // 1. Get session
        HttpSession session = request.getSession();

        // 2. Get logged-in user
        User u = (User) session.getAttribute("user");

        // 3. Check whether user is logged in
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }



        // 5. Create DAO object
        TicketDAO ticketDAO = new TicketDAO();

        // 6. Get tickets created by this employee
        List<Ticket> tickets = ticketDAO.getAllTickets();

        // 7. Store tickets in request
        request.setAttribute("tickets", tickets);
        int totalTickets = ticketDAO.getTotalTicketCount();
        int openTickets = ticketDAO.getOpenTicketCount();
        int inProgressTickets = ticketDAO.getInProgressTicketCount();
        int resolvedTickets = ticketDAO.getResolvedTicketCount();
        int assignedTickets = ticketDAO.getAssignedTicketCount();

        request.setAttribute("totalTickets", totalTickets);
        request.setAttribute("openTickets", openTickets);
        request.setAttribute("inProgressTickets", inProgressTickets);
        request.setAttribute("resolvedTickets", resolvedTickets);
        request.setAttribute("assignedTickets", assignedTickets);
        
        request.getRequestDispatcher("admin-dashboard.jsp")
        .forward(request, response);

	}

}
