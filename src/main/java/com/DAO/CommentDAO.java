package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Comment;
import com.utility.DBConnection;

public class CommentDAO {
	 Connection con=DBConnection.getDBConnection();
	boolean status=false;
	public boolean addComment(Comment c) {
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO comments(ticket_id, user_id, comment, comment_date) VALUES (?, ?, ?, ?)");
			ps.setInt(1, c.getTicket_id());
			ps.setInt(2, c.getUser_id());
			ps.setString(3, c.getComment());
			ps.setDate(4, c.getComment_date());
			int n=ps.executeUpdate();
			if(n>0) {
				status=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
		
	}
	public List<Comment> getCommentsByTicket(int ticketId){
		List<Comment> com=new ArrayList<>();
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM comments WHERE ticket_id = ?");
			ps.setInt(1, ticketId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Comment c=new Comment();
				c.setComment_id(rs.getInt("comment_id"));
				c.setTicket_id(rs.getInt("ticket_id"));
				c.setUser_id(rs.getInt("user_id"));
				c.setComment(rs.getString("comment"));
				c.setComment_date(rs.getDate("comment_date"));
				com.add(c);
			}
			}catch(Exception e) {
			e.printStackTrace();
		}
		return com;
	}
}
