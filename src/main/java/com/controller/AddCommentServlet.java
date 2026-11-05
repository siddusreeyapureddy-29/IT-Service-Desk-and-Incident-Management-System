package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;

import com.DAO.CommentDAO;
import com.model.Comment;
import com.model.User;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Request came to Add Comment Servlet");

        // Get ticket ID
        int ticketId = Integer.parseInt(request.getParameter("ticket_id"));

        // Get comment
        String comment = request.getParameter("comment");

        // Get logged-in user
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get user ID
        int userId = user.getUser_id();

        // Get current date
        Date commentDate = new Date(System.currentTimeMillis());

        // Create Comment object
        Comment c = new Comment();

        c.setTicket_id(ticketId);
        c.setUser_id(userId);
        c.setComment(comment);
        c.setComment_date(commentDate);

        // Call DAO
        CommentDAO commentDAO = new CommentDAO();

        boolean result = commentDAO.addComment(c);

        if (result) {

            System.out.println("Comment added successfully");

            session.setAttribute(
                    "message",
                    "Comment added successfully."
            );

            session.setAttribute(
                    "messageType",
                    "success"
            );

        } else {

            System.out.println("Failed to add comment");

            session.setAttribute(
                    "message",
                    "Failed to add comment."
            );

            session.setAttribute(
                    "messageType",
                    "danger"
            );
        }

        // Go back to ticket details
        response.sendRedirect(
                "ViewTicketServlet?id=" + ticketId
        );
	}

}
