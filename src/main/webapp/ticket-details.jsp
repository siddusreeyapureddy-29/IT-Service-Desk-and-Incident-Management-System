<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.model.Comment" %>
<%@ page import="com.model.Ticket" %>
<%@ page import="com.model.User" %>
<%@ page import="com.DAO.TicketDAO" %>
<%@ page import="java.util.List" %>

<%

    Ticket ticket = (Ticket) request.getAttribute("ticket");

    if (ticket == null) {
        response.sendRedirect("EmployeeDashboardServlet");
        return;
    }


    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }


    TicketDAO ticketDAO = new TicketDAO();


    String categoryName =
            ticketDAO.getCategoryName(ticket.getCategory_id());


    String createdByName =
            ticketDAO.getUserName(ticket.getCreated_by());


    String assignedToName = null;

    if (ticket.getAssigned_to() != null) {

        assignedToName =
                ticketDAO.getUserName(ticket.getAssigned_to());

    }


    List<Comment> comments =
            (List<Comment>) request.getAttribute("comments");

%>


<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Ticket Details</title>


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



        /* ================= MAIN CONTENT ================= */

        .main-content {

            padding-top: 100px;

            padding-bottom: 50px;

        }



        /* ================= TICKET CARD ================= */

        .ticket-card {

            border: none;

            border-radius: 15px;

        }



        /* ================= TICKET HEADING ================= */

        .ticket-title {

            font-weight: 600;

        }



        /* ================= DETAILS ================= */

        .detail-label {

            font-weight: 600;

            color: #495057;

        }


        .detail-value {

            color: #212529;

        }



        /* ================= DESCRIPTION / RESOLUTION ================= */

        .description-box,
        .resolution-box {

            background-color: #f8f9fa;

            border-radius: 8px;

            padding: 15px;

            white-space: pre-wrap;

        }



        /* ================= FOOTER ================= */

        footer {

            margin-top: 30px;

        }


    </style>

</head>


<body>


    <!-- ================= NAVBAR ================= -->

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">

        <div class="container-fluid">


            <!-- Brand -->

            <a class="navbar-brand fw-bold"
               href="EmployeeDashboardServlet">

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



            <!-- Navbar Content -->

            <div class="collapse navbar-collapse"
                 id="navbarMenu">


                <div class="ms-auto d-flex align-items-center gap-3">


                    <!-- Welcome -->

                    <span class="welcome-text">

                        Welcome,

                        <strong>
                            <%= user.getName() %>
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



    <!-- ================= MAIN CONTENT ================= -->

    <div class="container main-content">


        <div class="row justify-content-center">


            <div class="col-lg-8 col-md-10 col-12">


                <!-- Ticket Details Card -->

                <div class="card ticket-card shadow-sm">


                    <div class="card-body p-4 p-md-5">


                        <!-- Heading -->

                        <h2 class="ticket-title text-center mb-4">

                            <i class="bi bi-ticket-detailed me-2"></i>

                            Ticket Details

                        </h2>


                        <hr class="mb-4">



                        <!-- ================= TICKET ID ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Ticket ID

                            </div>

                            <div class="col-md-8 detail-value">

                                : <%= ticket.getTicket_id() %>

                            </div>

                        </div>



                        <!-- ================= TITLE ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Title

                            </div>

                            <div class="col-md-8 detail-value">

                                : <%= ticket.getTitle() %>

                            </div>

                        </div>



                        <!-- ================= DESCRIPTION ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Description

                            </div>


                            <div class="col-md-8">

                                <div class="description-box">

                                    <%= ticket.getDescription() %>

                                </div>

                            </div>

                        </div>



                        <!-- ================= CATEGORY ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Category

                            </div>


                            <div class="col-md-8 detail-value">

                                :

                                <%= categoryName != null
                                        ? categoryName
                                        : "Unknown" %>

                            </div>

                        </div>



                        <!-- ================= PRIORITY ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Priority

                            </div>


                            <div class="col-md-8">

                                :

                                <%

                                    String priorityClass =
                                            "bg-secondary";


                                    if ("CRITICAL".equals(
                                            ticket.getPriority())) {

                                        priorityClass =
                                                "bg-danger";

                                    }

                                    else if ("HIGH".equals(
                                            ticket.getPriority())) {

                                        priorityClass =
                                                "bg-warning text-dark";

                                    }

                                    else if ("MEDIUM".equals(
                                            ticket.getPriority())) {

                                        priorityClass =
                                                "bg-info text-dark";

                                    }

                                    else if ("LOW".equals(
                                            ticket.getPriority())) {

                                        priorityClass =
                                                "bg-success";

                                    }

                                %>


                                <span class="badge <%= priorityClass %>">

                                    <%= ticket.getPriority() %>

                                </span>

                            </div>

                        </div>



                        <!-- ================= STATUS ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Status

                            </div>


                            <div class="col-md-8">

                                :

                                <%

                                    String statusClass =
                                            "bg-secondary";


                                    if ("OPEN".equals(
                                            ticket.getStatus())) {

                                        statusClass =
                                                "bg-primary";

                                    }

                                    else if ("ASSIGNED".equals(
                                            ticket.getStatus())) {

                                        statusClass =
                                                "bg-info text-dark";

                                    }

                                    else if ("IN_PROGRESS".equals(
                                            ticket.getStatus())) {

                                        statusClass =
                                                "bg-warning text-dark";

                                    }

                                    else if ("RESOLVED".equals(
                                            ticket.getStatus())) {

                                        statusClass =
                                                "bg-success";

                                    }

                                    else if ("CLOSED".equals(
                                            ticket.getStatus())) {

                                        statusClass =
                                                "bg-dark";

                                    }

                                %>


                                <span class="badge <%= statusClass %>">

                                    <%= ticket.getStatus() %>

                                </span>

                            </div>

                        </div>



                        <!-- ================= CREATED BY ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Created By

                            </div>


                            <div class="col-md-8 detail-value">

                                :

                                <%= createdByName != null
                                        ? createdByName
                                        : "Unknown" %>

                            </div>

                        </div>



                        <!-- ================= CREATED DATE ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Created Date

                            </div>


                            <div class="col-md-8 detail-value">

                                : <%= ticket.getCreated_date() %>

                            </div>

                        </div>



                        <!-- ================= ASSIGNED TO ================= -->

                        <div class="row mb-3">

                            <div class="col-md-4 detail-label">

                                Assigned To

                            </div>


                            <div class="col-md-8 detail-value">

                                :

                                <%

                                    if (assignedToName != null) {

                                %>

                                    <%= assignedToName %>

                                <%

                                    } else {

                                %>

                                    <span class="text-muted">

                                        Not assigned yet

                                    </span>

                                <%

                                    }

                                %>

                            </div>

                        </div>



                        <!-- ================= RESOLUTION ================= -->

                        <div class="row mb-4">

                            <div class="col-md-4 detail-label">

                                Resolution

                            </div>


                            <div class="col-md-8">

                                <%

                                    if (ticket.getResolution() != null
                                            && !ticket.getResolution()
                                                       .trim()
                                                       .isEmpty()) {

                                %>


                                    <div class="resolution-box">

                                        <%= ticket.getResolution() %>

                                    </div>


                                <%

                                    } else {

                                %>


                                    <div class="resolution-box text-muted">

                                        Not resolved yet

                                    </div>


                                <%

                                    }

                                %>

                            </div>

                        </div>



                        <!-- ================= COMMENTS ================= -->

                        <div class="mt-4">


                            <h5 class="fw-bold mb-3">

                                <i class="bi bi-chat-left-text me-2"></i>

                                Ticket Comments

                            </h5>


                            <%

                                if (comments != null
                                        && !comments.isEmpty()) {


                                    for (Comment c : comments) {

                            %>


                                <div class="card mb-3 shadow-sm">

                                    <div class="card-body">


                                        <div class="d-flex justify-content-between">


                                            <strong>

                                                User ID:
                                                <%= c.getUser_id() %>

                                            </strong>


                                            <small class="text-muted">

                                                <%= c.getComment_date() %>

                                            </small>


                                        </div>


                                        <p class="mb-0 mt-2">

                                            <%= c.getComment() %>

                                        </p>


                                    </div>

                                </div>


                            <%

                                    }

                                } else {

                            %>


                                <div class="alert alert-light border text-muted">

                                    <i class="bi bi-chat me-2"></i>

                                    No comments yet.

                                </div>


                            <%

                                }

                            %>


                        </div>



                        <!-- ================= ADD COMMENT ================= -->

                        <div class="mt-4">


                            <h5 class="fw-bold mb-3">

                                <i class="bi bi-plus-circle me-2"></i>

                                Add Comment

                            </h5>


                            <form action="AddCommentServlet"
                                  method="post">


                                <input
                                    type="hidden"
                                    name="ticket_id"
                                    value="<%= ticket.getTicket_id() %>">


                                <div class="mb-3">

                                    <textarea
                                        name="comment"
                                        class="form-control"
                                        rows="4"
                                        placeholder="Write your comment..."
                                        required></textarea>

                                </div>


                                <button
                                    type="submit"
                                    class="btn btn-primary">

                                    <i class="bi bi-send me-1"></i>

                                    Add Comment

                                </button>


                            </form>


                        </div>


                        <hr>



                        <!-- ================= BACK BUTTON ================= -->

                        <div class="text-center mt-4">


                            <%

                                if ("Employee".equals(user.getRole())) {

                            %>


                                <a href="EmployeeDashboardServlet"
                                   class="btn btn-secondary px-4">

                                    <i class="bi bi-arrow-left me-2"></i>

                                    Back

                                </a>


                            <%

                                } else if ("Technician".equals(
                                            user.getRole())) {

                            %>


                                <a href="TechnicianDashboardServlet"
                                   class="btn btn-secondary px-4">

                                    <i class="bi bi-arrow-left me-2"></i>

                                    Back

                                </a>


                            <%

                                } else {

                            %>


                                <a href="AdminDashboardServlet"
                                   class="btn btn-secondary px-4">

                                    <i class="bi bi-arrow-left me-2"></i>

                                    Back

                                </a>


                            <%

                                }

                            %>


                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>



    <!-- ================= FOOTER ================= -->

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