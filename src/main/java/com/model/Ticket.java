package com.model;

import java.sql.Date;

public class Ticket {
	
	private int ticket_id;
	private String title;
	private String description;
	private int category_id;
	private String priority;
	private String status;
	private int created_by;
	private Integer assigned_to;
	private Date created_date;
	private String resolution;
	
	public Ticket() {
	}

	public Ticket(int ticket_id, String title, String description, int category_id, String priority, String status,
			int created_by, Integer assigned_to, Date created_date) {
		super();
		this.ticket_id = ticket_id;
		this.title = title;
		this.description = description;
		this.category_id = category_id;
		this.priority = priority;
		this.status = status;
		this.created_by = created_by;
		this.assigned_to = assigned_to;
		this.created_date = created_date;
	}

	public Ticket(String title, String description, int category_id, String priority, String status, int created_by,
			Integer assigned_to, Date created_date) {
		super();
		this.title = title;
		this.description = description;
		this.category_id = category_id;
		this.priority = priority;
		this.status = status;
		this.created_by = created_by;
		this.assigned_to = assigned_to;
		this.created_date = created_date;
	}

	public int getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCreated_by() {
		return created_by;
	}

	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

	public Integer getAssigned_to() {
		return assigned_to;
	}

	public void setAssigned_to(Integer assigned_to) {
		this.assigned_to = assigned_to;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	
	public String getResolution() {
	    return resolution;
	}

	public void setResolution(String resolution) {
	    this.resolution = resolution;
	}

	@Override
	public String toString() {
		return "Tickets [ticket_id=" + ticket_id + ", title=" + title + ", description=" + description
				+ ", category_id=" + category_id + ", priority=" + priority + ", status=" + status + ", created_by="
				+ created_by + ", assigned_to=" + assigned_to + ", created_date=" + created_date + ", resolution=" + resolution+"]";
	}
	
	
}
