package com.controller;

import java.io.IOException;
import java.util.List;

import com.DAO.CommentDAO;
import com.DAO.TicketDAO;
import com.model.Comment;
import com.model.Ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ViewTicketServlet")
public class ViewTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          int ticket_id=Integer.parseInt(request.getParameter("id"));
          
          TicketDAO t=new TicketDAO();
          Ticket ticket=t.getTicketById(ticket_id);
          
          CommentDAO commentDAO = new CommentDAO();

          List<Comment> comments =
                  commentDAO.getCommentsByTicket(ticket_id);
          
          request.setAttribute("ticket", ticket);
          request.setAttribute("comments", comments);
          
          request.getRequestDispatcher("ticket-details.jsp")
          .forward(request, response);
          
	}

}
