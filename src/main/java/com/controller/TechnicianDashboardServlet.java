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

@WebServlet("/TechnicianDashboardServlet")
public class TechnicianDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Request came to Technician dashboard");
		
		HttpSession session=request.getSession();
		User u=(User) session.getAttribute("user");
		
		 if (u == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }
		 int userId = u.getUser_id();
		 
		 TicketDAO ticketdao=new TicketDAO();
		 List<Ticket> tickets = ticketdao.getTicketsByTechnician(userId);
		 request.setAttribute("tickets", tickets);
		 
		 int assignedCount =ticketdao.getAssignedTicketCount(userId);
		 
		 int inProgressCount = ticketdao.getInProgressTicketCount(userId);

		 int resolvedCount =ticketdao.getResolvedTicketCount(userId);
		 
		 int closedCount =ticketdao.getClosedTicketCount(userId);

		 request.setAttribute("assignedCount", assignedCount);
		 request.setAttribute("inProgressCount", inProgressCount);
		 request.setAttribute("resolvedCount", resolvedCount);
		 request.setAttribute("closedCount", closedCount);
		 
		 request.getRequestDispatcher("technician-dashboard.jsp")
         .forward(request, response);
	}

}
