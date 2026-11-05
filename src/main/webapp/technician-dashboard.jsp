<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.model.User" %>
<%@ page import="com.model.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.TicketDAO" %>

<%
    User u = (User) session.getAttribute("user");

    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Ticket> tickets =
        (List<Ticket>) request.getAttribute("tickets");

    TicketDAO ticketdao = new TicketDAO();
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Technician Dashboard - IT Service Desk</title>

    <!-- Bootstrap 5 CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>

        /* ==============================
           BODY
        ============================== */

        body {
            background-color: #f5f7fb;
            min-height: 100vh;
        }


        /* ==============================
           NAVBAR
        ============================== */

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;

            padding: 6px 20px;

            background: linear-gradient(
                90deg,
                #0d6efd,
                #6610f2
            ) !important;

            box-shadow: 0 3px 10px rgba(0,0,0,.18);
        }

        .navbar-brand {
            font-size: 19px;
        }

        .navbar-nav .nav-link {
            font-size: 15px;
            padding: 7px 12px;
        }

        .navbar-nav .nav-link:hover {
            background-color: rgba(255,255,255,.12);
            border-radius: 6px;
        }

        .navbar-nav .nav-link.active {
            background-color: rgba(255,255,255,.18);
            border-radius: 6px;
        }

        .welcome-text {
            font-size: 15px;
            color: white;
        }

        .welcome-text strong {
            font-weight: 600;
        }

        .logout-btn {
            font-size: 14px;
            padding: 5px 12px;
            border-radius: 6px;
        }


        /* ==============================
           MAIN CONTENT
        ============================== */

        .main-content {
            padding-top: 100px;
            padding-bottom: 40px;
        }


        /* ==============================
           DASHBOARD HEADING
        ============================== */

        .dashboard-title {
            font-weight: 600;
            color: #212529;
        }


        /* ==============================
           SUMMARY CARDS
        ============================== */

        .summary-card {
            border: none;
            border-radius: 12px;
            transition: 0.3s;
        }

        .summary-card:hover {
            transform: translateY(-3px);
        }

        .summary-number {
            font-size: 28px;
            font-weight: 700;
        }

        .summary-icon {
            font-size: 30px;
        }


        /* ==============================
           TICKETS CARD
        ============================== */

        .ticket-card {
            border: none;
            border-radius: 12px;
        }


        /* ==============================
           TABLE
        ============================== */

        .table th {
            white-space: nowrap;
        }

        .table td {
            vertical-align: middle;
            white-space: nowrap;
        }


        /* ==============================
           ACTION COLUMN
        ============================== */

        .action-column {
            width: 250px;
            text-align: center;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }


        /* ==============================
           FOOTER
        ============================== */

        footer {
            margin-top: 30px;
        }

    </style>

</head>


<body>


<!-- ================================================= -->
<!-- NAVBAR -->
<!-- ================================================= -->

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">

    <div class="container-fluid">

        <!-- Brand -->

        <a class="navbar-brand fw-bold"
           href="TechnicianDashboardServlet">

            <i class="bi bi-headset me-2"></i>

            IT Service Desk

        </a>


        <!-- Toggler -->

        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarMenu"
            aria-controls="navbarMenu"
            aria-expanded="false"
            aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- Navbar Menu -->

        <div class="collapse navbar-collapse"
             id="navbarMenu">

            <div class="ms-auto d-flex align-items-center gap-3">


                <!-- Welcome -->

                <span class="welcome-text">

                    Welcome,

                    <strong>
                        <%= u.getName() %>
                    </strong>

                    <i class="bi bi-person-circle ms-1"></i>

                </span>


                <!-- Logout -->

                <a href="LogoutServlet"
                   class="btn btn-outline-light btn-sm logout-btn">

                    <i class="bi bi-box-arrow-right me-1"></i>

                    Logout

                </a>


            </div>

        </div>

    </div>

</nav>


<!-- ================================================= -->
<!-- MAIN CONTENT -->
<!-- ================================================= -->

<div class="container-fluid main-content">


    <!-- Dashboard Heading -->

    <div class="text-center mb-4">

        <h2 class="dashboard-title">

            <i class="bi bi-tools me-2"></i>

            Technician Dashboard

        </h2>

    </div>



    <!-- ================================================= -->
    <!-- SUMMARY CARDS -->
    <!-- ================================================= -->

    <div class="row g-4 mb-5">


        <!-- Assigned Tickets -->

        <div class="col-xl-3 col-lg-3 col-md-6 col-12">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">

                        <div>

                            <h6 class="text-muted">
                                Assigned Tickets
                            </h6>

                            <div class="summary-number">
                                <%= request.getAttribute("assignedCount") %>
                            </div>

                        </div>

                        <div class="summary-icon text-primary">

                            <i class="bi bi-ticket-detailed"></i>

                        </div>

                    </div>

                </div>

            </div>

        </div>



        <!-- In Progress -->

        <div class="col-xl-3 col-lg-3 col-md-6 col-12">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">

                        <div>

                            <h6 class="text-muted">
                                In Progress
                            </h6>

                            <div class="summary-number">
                                <%= request.getAttribute("inProgressCount") %>
                            </div>

                        </div>

                        <div class="summary-icon text-warning">

                            <i class="bi bi-folder2-open"></i>

                        </div>

                    </div>

                </div>

            </div>

        </div>



        <!-- Resolved -->

        <div class="col-xl-3 col-lg-3 col-md-6 col-12">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">

                        <div>

                            <h6 class="text-muted">
                                Resolved
                            </h6>

                            <div class="summary-number">
                                <%= request.getAttribute("resolvedCount") %>
                            </div>

                        </div>

                        <div class="summary-icon text-info">

                            <i class="bi bi-arrow-repeat"></i>

                        </div>

                    </div>

                </div>

            </div>

        </div>



        <!-- Closed -->

        <div class="col-xl-3 col-lg-3 col-md-6 col-12">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">

                        <div>

                            <h6 class="text-muted">
                                Closed
                            </h6>

                            <div class="summary-number">
                                <%= request.getAttribute("closedCount") %>
                            </div>

                        </div>

                        <div class="summary-icon text-success">

                            <i class="bi bi-check-circle"></i>

                        </div>

                    </div>

                </div>

            </div>

        </div>


    </div>



    <!-- ================================================= -->
    <!-- MY ASSIGNED TICKETS -->
    <!-- ================================================= -->

    <div class="card ticket-card shadow-sm">


        <div class="card-body">


            <h5 class="card-title mb-4">

                <i class="bi bi-list-check me-2"></i>

                My Assigned Tickets

            </h5>


            <!-- Responsive Table -->

            <div class="table-responsive">


                <table class="table table-hover align-middle">


                    <!-- Table Header -->

                    <thead class="table-dark">

                        <tr>

                            <th>ID</th>

                            <th>Title</th>

                            <th>Assigned To</th>

                            <th>Category</th>

                            <th>Priority</th>

                            <th>Status</th>

                            <th>Created Date</th>

                            <th class="action-column">
                                Action
                            </th>

                        </tr>

                    </thead>



                    <!-- Table Body -->

                    <tbody>


                    <%
                        if (tickets != null && !tickets.isEmpty()) {

                            for (Ticket t : tickets) {

                                String categoryName =
                                    ticketdao.getCategoryName(
                                        t.getCategory_id()
                                    );

                                String technicianName = null;

                                if (t.getAssigned_to() != null) {

                                    technicianName =
                                        ticketdao.getUserName(
                                            t.getAssigned_to()
                                        );
                                }
                    %>


                        <tr>


                            <!-- Ticket ID -->

                            <td>

                                <strong>
                                    <%= t.getTicket_id() %>
                                </strong>

                            </td>



                            <!-- Title -->

                            <td>

                                <%= t.getTitle() %>

                            </td>



                            <!-- Assigned To -->

                            <td>

                                <%= technicianName != null
                                    ? technicianName
                                    : "Not Assigned" %>

                            </td>



                            <!-- Category -->

                            <td>

                                <%= categoryName %>

                            </td>



                            <!-- Priority -->

                            <td>

                                <%
                                    String priorityClass =
                                        "bg-primary";

                                    if ("CRITICAL".equals(t.getPriority())) {
                                        priorityClass = "bg-danger";
                                    }
                                    else if ("HIGH".equals(t.getPriority())) {
                                        priorityClass = "bg-warning text-dark";
                                    }
                                    else if ("MEDIUM".equals(t.getPriority())) {
                                        priorityClass = "bg-info text-dark";
                                    }
                                    else if ("LOW".equals(t.getPriority())) {
                                        priorityClass = "bg-success";
                                    }
                                %>

                                <span class="badge <%= priorityClass %>">

                                    <%= t.getPriority() %>

                                </span>

                            </td>



                            <!-- Status -->

                            <td>

                                <%
                                    String statusClass =
                                        "bg-primary";

                                    if ("OPEN".equals(t.getStatus())) {
                                        statusClass = "bg-primary";
                                    }
                                    else if ("ASSIGNED".equals(t.getStatus())) {
                                        statusClass = "bg-info text-dark";
                                    }
                                    else if ("IN_PROGRESS".equals(t.getStatus())) {
                                        statusClass = "bg-warning text-dark";
                                    }
                                    else if ("RESOLVED".equals(t.getStatus())) {
                                        statusClass = "bg-success";
                                    }
                                    else if ("CLOSED".equals(t.getStatus())) {
                                        statusClass = "bg-dark";
                                    }
                                %>

                                <span class="badge <%= statusClass %>">

                                    <%= t.getStatus() %>

                                </span>

                            </td>



                            <!-- Created Date -->

                            <td>

                                <%= t.getCreated_date() %>

                            </td>



                            <!-- Actions -->

                            <td class="action-column">


                                <div class="action-buttons">


                                    <!-- View -->

                                    <a href="ViewTicketServlet?id=<%= t.getTicket_id() %>"
                                       class="btn btn-outline-primary btn-sm">

                                        <i class="bi bi-eye"></i>

                                        View

                                    </a>



                                    <!-- Start Work -->

                                    <% if ("ASSIGNED".equals(t.getStatus())) { %>

                                        <a href="StartWorkServlet?id=<%= t.getTicket_id() %>"
                                           class="btn btn-sm btn-primary">

                                            <i class="bi bi-play-circle me-1"></i>

                                            Start Work

                                        </a>

                                    <% } %>



                                    <!-- Resolve -->

                                    <% if ("IN_PROGRESS".equals(t.getStatus())) { %>

                                        <a href="ResolveTicketServlet?id=<%= t.getTicket_id() %>"
                                           class="btn btn-sm btn-success">

                                            <i class="bi bi-check-circle me-1"></i>

                                            Resolve

                                        </a>

                                    <% } %>


                                </div>


                            </td>


                        </tr>


                    <%
                            }

                        } else {
                    %>


                        <!-- No Tickets -->

                        <tr>

                            <td colspan="8"
                                class="text-center text-muted py-4">

                                <i class="bi bi-inbox fs-3 d-block mb-2"></i>

                                No tickets are currently assigned to you.

                            </td>

                        </tr>


                    <%
                        }
                    %>


                    </tbody>


                </table>


            </div>


        </div>


    </div>


</div>



<!-- ================================================= -->
<!-- FOOTER -->
<!-- ================================================= -->

<footer class="bg-dark text-white text-center py-3">

    <div class="container">

        <p class="mb-0">

            © 2026 IT Service Desk.
            All Rights Reserved.

        </p>

    </div>

</footer>



<!-- Bootstrap JavaScript -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>