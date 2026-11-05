package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Ticket;
import com.utility.DBConnection;

public class TicketDAO {
	Connection con=DBConnection.getDBConnection();
	boolean status=false;
	
	public boolean createTicket(Ticket t) {

	    try {

	        PreparedStatement ps = con.prepareStatement(
	            "insert into tickets(title,description,category_id,priority,status,created_by,assigned_to,created_date) values(?,?,?,?,?,?,?,?)"
	        );

	        ps.setString(1, t.getTitle());
	        ps.setString(2, t.getDescription());
	        ps.setInt(3, t.getCategory_id());
	        ps.setString(4, t.getPriority());
	        ps.setString(5, t.getStatus());
	        ps.setInt(6, t.getCreated_by());

	        if(t.getAssigned_to() == null) {
	            ps.setNull(7, java.sql.Types.INTEGER);
	        } else {
	            ps.setInt(7, t.getAssigned_to());
	        }

	        ps.setDate(8, t.getCreated_date());

	        int n = ps.executeUpdate();

	        if(n > 0) {
	            status = true;
	        }

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	public List<Ticket> getTicketsByUser(int userId){
		List<Ticket> tick=new ArrayList<>();
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM tickets WHERE created_by = ? ORDER BY ticket_id DESC");
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Ticket t=new Ticket();
				t.setTicket_id(rs.getInt("ticket_id"));
				t.setTitle(rs.getString("title"));
				t.setDescription(rs.getString("description"));
				t.setCategory_id(rs.getInt("category_id"));
				t.setPriority(rs.getString("priority"));
				t.setStatus(rs.getString("status"));
				t.setCreated_by(rs.getInt("created_by"));
				int assigned = rs.getInt("assigned_to");

				if(rs.wasNull()) {
				    t.setAssigned_to(null);
				} else {
				    t.setAssigned_to(assigned);
				}
				t.setCreated_date(rs.getDate("created_date"));
				
				tick.add(t);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Tickets are receiving from taskdao");
		System.out.println(tick);
		return tick;
		
	}
	
	public int getTicketCountByUser(int userId) {
		int count=0;
		try {
		PreparedStatement ps=con.prepareStatement("select count(*) from tickets where created_by=?");
		ps.setInt(1, userId);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt(1);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
		
	}
	public int getOpenTicketCountByUser(int userId){
		int count1=0;
		try {
			PreparedStatement ps=con.prepareStatement("select count(*) from tickets where created_by=? and status='open'");
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				count1=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count1;
		
	}
	
	public int getResolvedTicketCountByUser(int userId) {
		int count3=0;
		try {
			PreparedStatement ps=con.prepareStatement("select count(*) from tickets where created_by=? and status='resolved'");
		    ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				count3=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count3;
		
	}
	
	public Ticket getTicketById(int ticketId) {
		try {
			PreparedStatement ps=con.prepareStatement("select * from tickets where ticket_id=?");
			ps.setInt(1, ticketId);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				Ticket t=new Ticket();
				t.setTicket_id(rs.getInt("ticket_id"));
				t.setTitle(rs.getString("title"));
				t.setDescription(rs.getString("description"));
				t.setCategory_id(rs.getInt("category_id"));
				t.setPriority(rs.getString("priority"));
				t.setStatus(rs.getString("status"));
				t.setCreated_by(rs.getInt("created_by"));
				int assigned = rs.getInt("assigned_to");

				if(rs.wasNull()) {
				    t.setAssigned_to(null);
				} else {
				    t.setAssigned_to(assigned);
				}
				t.setCreated_date(rs.getDate("created_date"));
				t.setResolution(rs.getString("resolution"));
				return t;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	public List<Ticket> getTicketsByTechnician(int technicianId) {
		List<Ticket> tick=new ArrayList<>();
		try {
			PreparedStatement ps=con.prepareStatement("select * from tickets where assigned_to=?");
			ps.setInt(1, technicianId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Ticket t=new Ticket();
				t.setTicket_id(rs.getInt("ticket_id"));
				t.setTitle(rs.getString("title"));
				t.setDescription(rs.getString("description"));
				t.setCategory_id(rs.getInt("category_id"));
				t.setPriority(rs.getString("priority"));
				t.setStatus(rs.getString("status"));
				t.setCreated_by(rs.getInt("created_by"));
				int assigned = rs.getInt("assigned_to");

				if(rs.wasNull()) {
				    t.setAssigned_to(null);
				} else {
				    t.setAssigned_to(assigned);
				}
				t.setCreated_date(rs.getDate("created_date"));
				
				tick.add(t);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return tick;
		
	}
	public List<Ticket> getAllTickets(){
		List<Ticket> tick=new ArrayList<>();
		try {
			PreparedStatement ps=con.prepareStatement("select * from tickets order by ticket_id desc");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Ticket t=new Ticket();
				t.setTicket_id(rs.getInt("ticket_id"));
				t.setTitle(rs.getString("title"));
				t.setDescription(rs.getString("description"));
				t.setCategory_id(rs.getInt("category_id"));
				t.setPriority(rs.getString("priority"));
				t.setStatus(rs.getString("status"));
				t.setCreated_by(rs.getInt("created_by"));
				int assigned = rs.getInt("assigned_to");

				if(rs.wasNull()) {
				    t.setAssigned_to(null);
				} else {
				    t.setAssigned_to(assigned);
				}
				t.setCreated_date(rs.getDate("created_date"));
				tick.add(t);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("Tickets found: " + tick.size());
		return tick;
		
	}
	
	public boolean assignTicket(int ticketId, int technicianId) {

	    boolean result = false;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE tickets SET assigned_to = ?, status = ? WHERE ticket_id = ?"
	        );

	        ps.setInt(1, technicianId);
	        ps.setString(2, "ASSIGNED");
	        ps.setInt(3, ticketId);

	        

	        int n = ps.executeUpdate();
	       
	        System.out.println("Ticket ID: " + ticketId);
	        System.out.println("Technician ID: " + technicianId);
	        System.out.println("Rows updated: " + n);

	        if(n > 0) {
	            result = true;
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return result;
	}
	public int getTotalTicketCount() {

	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets"
	        );

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public int getOpenTicketCount() {

	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets WHERE status='OPEN'"
	        );

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public int getInProgressTicketCount() {

	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets WHERE status='IN_PROGRESS'"
	        );

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public int getResolvedTicketCount() {

	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets WHERE status='RESOLVED'"
	        );

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public int getAssignedTicketCount() {

	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets WHERE status='ASSIGNED'"
	        );

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public boolean startWork(int ticketId) {

	    boolean status = false;

	    try {

	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE tickets SET status=? WHERE ticket_id=?"
	        );

	        ps.setString(1, "IN_PROGRESS");
	        ps.setInt(2, ticketId);

	        int n = ps.executeUpdate();

	        if(n > 0) {
	            status = true;
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}

	public boolean resolveTicket(int ticketId, String resolution) {

	    boolean status = false;

	    try {

	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE tickets SET resolution=?, status=? WHERE ticket_id=?"
	        );

	        ps.setString(1, resolution);
	        ps.setString(2, "RESOLVED");
	        ps.setInt(3, ticketId);

	        int n = ps.executeUpdate();

	        if(n > 0) {
	            status = true;
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	
	public boolean closeTicket(int ticketId) {

	    boolean status = false;

	    try {

	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE tickets SET status=? WHERE ticket_id=?"
	        );

	        ps.setString(1, "CLOSED");
	        ps.setInt(2, ticketId);

	        int n = ps.executeUpdate();

	        if(n > 0) {
	            status = true;
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	
	public int getAssignedTicketCount(int technicianId) {
	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets WHERE assigned_to=? AND status='ASSIGNED'"
	        );

	        ps.setInt(1, technicianId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public int getInProgressTicketCount(int technicianId) {
	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets WHERE assigned_to=? AND status='IN_PROGRESS'"
	        );

	        ps.setInt(1, technicianId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public int getResolvedTicketCount(int technicianId) {
	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets WHERE assigned_to=? AND status='RESOLVED'"
	        );

	        ps.setInt(1, technicianId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public int getClosedTicketCount(int technicianId) {

	    int count = 0;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM tickets WHERE assigned_to=? AND status='CLOSED'"
	        );

	        ps.setInt(1, technicianId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public String getCategoryName(int categoryId) {

	    String categoryName = null;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT category_name FROM categories WHERE category_id=?"
	        );

	        ps.setInt(1, categoryId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            categoryName = rs.getString("category_name");
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return categoryName;
	}
	
	public String getUserName(int userId) {

	    String name = null;

	    try {
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT name FROM users WHERE user_id=?"
	        );

	        ps.setInt(1, userId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            name = rs.getString("name");
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return name;
	}
	
}
