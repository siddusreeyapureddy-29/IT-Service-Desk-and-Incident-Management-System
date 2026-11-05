package com.model;

import java.sql.Date;

public class Comment {
	
	private int comment_id;
	private int ticket_id;
	private int user_id;
	private String comment;
	private Date comment_date;
	
	
	public Comment() {
	}


	public Comment(int ticket_id, int user_id, String comment, Date comment_date) {
		this.ticket_id = ticket_id;
		this.user_id = user_id;
		this.comment = comment;
		this.comment_date = comment_date;
	}


	public Comment(int comment_id, int ticket_id, int user_id, String comment, Date comment_date) {
		this.comment_id = comment_id;
		this.ticket_id = ticket_id;
		this.user_id = user_id;
		this.comment = comment;
		this.comment_date = comment_date;
	}


	public int getComment_id() {
		return comment_id;
	}


	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}


	public int getTicket_id() {
		return ticket_id;
	}


	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public Date getComment_date() {
		return comment_date;
	}


	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}


	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", ticket_id=" + ticket_id + ", user_id=" + user_id + ", comment="
				+ comment + ", comment_date=" + comment_date + "]";
	}
	
	

}
