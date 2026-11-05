package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.TicketDAO;


@WebServlet("/ConfirmResolutionServlet")
public class ConfirmResolutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Request came to Confirm Resolution Servlet");

        int ticketId = Integer.parseInt(
                request.getParameter("id")
        );

        TicketDAO ticketDAO = new TicketDAO();

        boolean result = ticketDAO.closeTicket(ticketId);

        if(result) {

            System.out.println("Ticket closed successfully");

            request.getSession().setAttribute(
                    "message",
                    "Resolution confirmed. Ticket closed successfully."
            );

            request.getSession().setAttribute(
                    "messageType",
                    "success"
            );

        } else {

            System.out.println("Failed to close ticket");

            request.getSession().setAttribute(
                    "message",
                    "Failed to close the ticket."
            );

            request.getSession().setAttribute(
                    "messageType",
                    "danger"
            );
        }

        response.sendRedirect("EmployeeDashboardServlet");
	}

}
