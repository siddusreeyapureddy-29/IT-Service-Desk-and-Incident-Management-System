<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.model.User" %>

<%
    User u = (User) session.getAttribute("user");

    // If user is not logged in, send them back to login page
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
    Integer ticketId =
            (Integer) request.getAttribute("ticketId");

    List<User> technicians =
            (List<User>) request.getAttribute("technicians");
%>


<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Assign Ticket - IT Service Desk</title>


    <!-- ================= BOOTSTRAP 5 ================= -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- ================= BOOTSTRAP ICONS ================= -->

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



        /* ================= ASSIGN CARD ================= */

        .assign-card {

            max-width: 600px;

            margin: 50px auto;

            background: white;

            padding: 35px;

            border-radius: 15px;

            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);

        }


        .assign-card h2 {

            font-weight: 600;

            margin-bottom: 30px;

        }



        /* ================= TICKET INFORMATION ================= */

        .ticket-info {

            background-color: #f8f9fa;

            border-radius: 10px;

            padding: 15px 20px;

            margin-bottom: 25px;

        }


        .ticket-info strong {

            font-size: 16px;

        }



        /* ================= FORM ================= */

        .form-label {

            font-weight: 500;

        }


        .btn-assign {

            min-width: 150px;

        }



        /* ================= FOOTER ================= */

        footer {

            margin-top: 80px;

        }


    </style>

</head>


<body>


    <!-- ================= NAVBAR ================= -->

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">

        <div class="container-fluid">


            <!-- Brand -->

            <a class="navbar-brand fw-bold"
               href="AdminDashboardServlet">

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



    <!-- ================= MAIN CONTENT ================= -->

    <div class="container-fluid main-content">


        <div class="assign-card">


            <!-- ================= PAGE HEADING ================= -->

            <h2 class="text-center">

                <i class="bi bi-person-check me-2"></i>

                Assign Ticket

            </h2>



            <!-- ================= TICKET INFORMATION ================= -->

            <div class="ticket-info">


                <div class="row">


                    <div class="col-6">

                        <strong>

                            Ticket ID:

                        </strong>

                    </div>


                    <div class="col-6 text-end">

                        <%= ticketId %>

                    </div>


                </div>


            </div>



            <!-- ================= ASSIGN FORM ================= -->

            <form action="AssignTicketServlet"
                  method="post">


                <!-- Hidden Ticket ID -->

                <input
                    type="hidden"
                    name="ticket_id"
                    value="<%= ticketId %>">



                <!-- ================= SELECT TECHNICIAN ================= -->

                <div class="mb-4">


                    <label
                        for="technician"
                        class="form-label">

                        Select Technician:

                    </label>


                    <select
                        class="form-select"
                        id="technician"
                        name="technician_id"
                        required>


                        <option
                            value=""
                            selected
                            disabled>

                            Select Technician

                        </option>


                        <%

                            if (technicians != null &&
                                !technicians.isEmpty()) {

                                for (User technician : technicians) {

                        %>


                            <option
                                value="<%= technician.getUser_id() %>">

                                <%= technician.getName() %>

                            </option>


                        <%

                                }

                            } else {

                        %>


                            <option
                                value=""
                                disabled>

                                No technicians available

                            </option>


                        <%

                            }

                        %>


                    </select>


                </div>



                <!-- ================= ASSIGN BUTTON ================= -->

                <div class="text-center">


                    <button
                        type="submit"
                        class="btn btn-primary btn-assign">


                        <i class="bi bi-person-check me-1"></i>

                        Assign Ticket


                    </button>


                </div>


            </form>


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



    <!-- ================= BOOTSTRAP JS ================= -->

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>


</body>

</html>