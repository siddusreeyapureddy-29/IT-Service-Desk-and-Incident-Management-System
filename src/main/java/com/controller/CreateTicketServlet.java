package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;

import com.DAO.TicketDAO;
import com.model.Ticket;
import com.model.User;

@WebServlet("/CreateTicketServlet")
public class CreateTicketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Request came to Create Ticket Servlet");

        // 1. Get data from create-ticket.jsp
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        String priority = request.getParameter("priority");

        // 2. Get logged-in user from session
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        // 3. Check whether user is logged in
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 4. Set system-controlled ticket values
        String status = "OPEN";
        Integer assigned_to = null;
        Date created_date = new Date(System.currentTimeMillis());

        // 5. Create Ticket object
        Ticket t = new Ticket();

        t.setTitle(title);
        t.setDescription(description);
        t.setCategory_id(category_id);
        t.setPriority(priority);
        t.setStatus(status);
        t.setCreated_by(u.getUser_id());
        t.setAssigned_to(assigned_to);
        t.setCreated_date(created_date);

        // 6. Send Ticket object to DAO
        TicketDAO ticket = new TicketDAO();

        boolean status1 = ticket.createTicket(t);

        // 7. Redirect based on DAO result
        if (status1) {

            System.out.println("Ticket created successfully");

            response.sendRedirect("employee-dashboard.jsp");

        } else {

            System.out.println("Ticket creation failed");

            response.sendRedirect("create-ticket.jsp");
        }
    }
}