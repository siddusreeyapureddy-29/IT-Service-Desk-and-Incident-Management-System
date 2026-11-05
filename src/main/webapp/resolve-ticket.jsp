<%@ page import="com.model.Ticket" %>

<%
    Ticket ticket = (Ticket) request.getAttribute("ticket");

    if(ticket == null) {
        response.sendRedirect("TechnicianDashboardServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Resolve Ticket</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-8">

            <div class="card shadow">

                <div class="card-header">
                    <h4 class="mb-0">Resolve Ticket</h4>
                </div>

                <div class="card-body">

                    <div class="mb-3">
                        <label class="form-label">Ticket ID</label>

                        <input type="text"
                               class="form-control"
                               value="<%= ticket.getTicket_id() %>"
                               readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Title</label>

                        <input type="text"
                               class="form-control"
                               value="<%= ticket.getTitle() %>"
                               readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Description</label>

                        <textarea class="form-control"
                                  rows="4"
                                  readonly><%= ticket.getDescription() %></textarea>
                    </div>

                    <form action="ResolveTicketServlet" method="post">

                        <input type="hidden"
                               name="ticket_id"
                               value="<%= ticket.getTicket_id() %>">

                        <div class="mb-3">

                            <label class="form-label">
                                Resolution
                            </label>

                            <textarea name="resolution"
                                      class="form-control"
                                      rows="5"
                                      placeholder="Enter the solution provided for this ticket..."
                                      required></textarea>

                        </div>

                        <div class="d-flex justify-content-between">

                            <a href="TechnicianDashboardServlet"
                               class="btn btn-secondary">
                                Cancel
                            </a>

                            <button type="submit"
                                    class="btn btn-success">
                                <i class="bi bi-check-circle me-1"></i>
                                Resolve Ticket
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>