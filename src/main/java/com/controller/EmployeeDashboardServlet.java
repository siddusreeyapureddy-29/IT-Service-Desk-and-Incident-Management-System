package com.controller;

import java.io.IOException;
import java.util.List;

import com.DAO.TicketDAO;
import com.model.Ticket;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/EmployeeDashboardServlet")
public class EmployeeDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Request came to Employee Dashboard Servlet");

        // 1. Get session
        HttpSession session = request.getSession();

        // 2. Get logged-in user
        User u = (User) session.getAttribute("user");

        // 3. Check whether user is logged in
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 4. Get user ID
        int userId = u.getUser_id();

        // 5. Create DAO object
        TicketDAO ticketDAO = new TicketDAO();

        // 6. Get tickets created by this employee
        
        List<Ticket> tickets = ticketDAO.getTicketsByUser(userId);
        System.out.println("User ID: " + userId);
        System.out.println("Tickets returned from DAO: " + tickets);

        // 7. Store tickets in request
        request.setAttribute("tickets", tickets);

        
        //8.get total tickets created by employee,open tickets,resolved tickets
        int totaltickets=ticketDAO.getTicketCountByUser(userId);
        int opentickets=ticketDAO.getOpenTicketCountByUser(userId);
        int resolvedtickets=ticketDAO.getResolvedTicketCountByUser(userId);
        
        //10.store total tickets in request
        request.setAttribute("totaltickets",totaltickets);
        request.setAttribute("opentickets", opentickets);
        request.setAttribute("resolvedtickets", resolvedtickets);
        
        
        
     // 8. Forward to dashboard JSP
        request.getRequestDispatcher("employee-dashboard.jsp")
               .forward(request, response);
        
    }

	}


