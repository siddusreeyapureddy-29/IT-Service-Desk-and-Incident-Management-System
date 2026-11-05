<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="com.model.User" %>
<%@ page import="com.model.Ticket" %>
<%@ page import="java.util.List" %>

<%
    User u = (User) session.getAttribute("user");

    // If user is not logged in, send them back to login page
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard</title>


    <!-- Bootstrap 5 CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- Bootstrap Icons -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <style>

        /* ================= BODY ================= */

        body {
            background-color: #f5f7fb;
            min-height: 100vh;
        }


        /* ================= NAVBAR ================= */

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

            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.18);
        }


        .navbar-brand {
            font-size: 19px;
        }


        .navbar-nav .nav-link {
            font-size: 15px;
            padding: 7px 12px;
        }


        .navbar-nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.12);
            border-radius: 6px;
        }


        .navbar-nav .nav-link.active {
            background-color: rgba(255, 255, 255, 0.18);
            border-radius: 6px;
        }


        /* Welcome text */

        .welcome-text {
            font-size: 15px;
            color: white;
        }


        .welcome-text strong {
            font-weight: 600;
        }


        /* Logout button */

        .logout-btn {
            font-size: 14px;
            padding: 5px 12px;
            border-radius: 6px;
        }


        /* ================= MAIN CONTENT ================= */

        .main-content {
            padding-top: 100px;
            padding-bottom: 40px;
        }


        /* ================= DASHBOARD HEADING ================= */

        .dashboard-title {
            font-weight: 600;
            color: #212529;
        }


        /* ================= SUMMARY CARDS ================= */

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


        /* ================= TICKETS CARD ================= */

        .ticket-card {
            border: none;
            border-radius: 12px;
        }


        /* ================= TABLE ================= */

        .table th {
            white-space: nowrap;
        }


        .table td {
            vertical-align: middle;
            white-space: nowrap;
        }


        /* ================= FOOTER ================= */

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
           href="AdminDashboardServlet">

            <i class="bi bi-headset me-2"></i>

            IT Service Desk

        </a>


        <!-- Mobile Toggler -->

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

            <i class="bi bi-speedometer2 me-2"></i>

            Admin Dashboard

        </h2>

    </div>



    <!-- ================================================= -->
    <!-- SUMMARY CARDS -->
    <!-- ================================================= -->

    <div class="row row-cols-1 row-cols-md-3 row-cols-xl-5 g-4 mb-5">


        <!-- ================= TOTAL TICKETS ================= -->

        <div class="col">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">


                        <div>

                            <h6 class="text-muted">
                                Total Tickets
                            </h6>

                            <div class="summary-number">

                                <h3>
                                    <%= request.getAttribute("totalTickets") %>
                                </h3>

                            </div>

                        </div>


                        <div class="summary-icon text-primary">

                            <i class="bi bi-ticket-detailed"></i>

                        </div>


                    </div>

                </div>

            </div>

        </div>



        <!-- ================= OPEN ================= -->

        <div class="col">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">


                        <div>

                            <h6 class="text-muted">
                                Open
                            </h6>

                            <div class="summary-number">

                                <h3>
                                    <%= request.getAttribute("openTickets") %>
                                </h3>

                            </div>

                        </div>


                        <div class="summary-icon text-warning">

                            <i class="bi bi-folder2-open"></i>

                        </div>


                    </div>

                </div>

            </div>

        </div>



        <!-- ================= ASSIGNED ================= -->

        <div class="col">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">


                        <div>

                            <h6 class="text-muted">
                                Assigned
                            </h6>

                            <div class="summary-number">

                                <h3>
                                    <%= request.getAttribute("assignedTickets") %>
                                </h3>

                            </div>

                        </div>


                        <div class="summary-icon text-info">

                            <i class="bi bi-person-check"></i>

                        </div>


                    </div>

                </div>

            </div>

        </div>



        <!-- ================= IN PROGRESS ================= -->

        <div class="col">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">


                        <div>

                            <h6 class="text-muted">
                                In Progress
                            </h6>

                            <div class="summary-number">

                                <h3>
                                    <%= request.getAttribute("inProgressTickets") %>
                                </h3>

                            </div>

                        </div>


                        <div class="summary-icon text-warning">

                            <i class="bi bi-hourglass-split"></i>

                        </div>


                    </div>

                </div>

            </div>

        </div>



        <!-- ================= RESOLVED ================= -->

        <div class="col">

            <div class="card summary-card shadow-sm h-100">

                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center">


                        <div>

                            <h6 class="text-muted">
                                Resolved
                            </h6>

                            <div class="summary-number">

                                <h3>
                                    <%= request.getAttribute("resolvedTickets") %>
                                </h3>

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
    <!-- ALL TICKETS -->
    <!-- ================================================= -->

    <div class="card ticket-card shadow-sm">

        <div class="card-body">


            <h5 class="card-title mb-4">

                <i class="bi bi-list-ul me-2"></i>

                All Tickets

            </h5>



            <!-- Responsive Table -->

            <div class="table-responsive">


                <table class="table table-hover align-middle">


                    <!-- Table Header -->

                    <thead class="table-dark">

                        <tr>

                            <th>ID</th>

                            <th>Title</th>

                            <th>Priority</th>

                            <th>Status</th>

                            <th>Assigned To</th>

                            <th>Action</th>

                        </tr>

                    </thead>



                    <!-- Table Body -->

                    <tbody>

                    <%

                        List<Ticket> tickets =
                            (List<Ticket>) request.getAttribute("tickets");

                        if (tickets != null && !tickets.isEmpty()) {

                            for (Ticket t : tickets) {

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



                            <!-- Priority -->

                            <td>

                                <span class="badge bg-danger">

                                    <%= t.getPriority() %>

                                </span>

                            </td>



                            <!-- Status -->

                            <td>

                                <span class="badge bg-primary">

                                    <%= t.getStatus() %>

                                </span>

                            </td>



                            <!-- Assigned To -->

                            <td>

                                <span class="text-muted">

                                    <%= t.getAssigned_to() %>

                                </span>

                            </td>



                            <!-- Action -->

                            <td>

                                <a
                                    href="AssignTicketServlet?id=<%= t.getTicket_id() %>"
                                    class="btn btn-sm btn-primary">

                                    <i class="bi bi-person-plus me-1"></i>

                                    Assign

                                </a>

                            </td>


                        </tr>


                    <%

                            }

                        } else {

                    %>


                        <tr>

                            <td colspan="6"
                                class="text-center text-muted py-4">

                                <i class="bi bi-inbox fs-3 d-block mb-2"></i>

                                No tickets available.

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