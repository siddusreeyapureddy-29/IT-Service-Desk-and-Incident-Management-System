<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.model.User" %>

<%
    User u = (User) session.getAttribute("user");

    // Check whether the employee is logged in
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

    <title>Create New Ticket</title>

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


        /* ================= FORM CARD ================= */

        .ticket-card {
            border: none;
            border-radius: 15px;
        }


        /* ================= PAGE HEADING ================= */

        .page-title {
            font-weight: 600;
        }


        /* ================= FORM LABELS ================= */

        .form-label {
            font-weight: 500;
        }


        /* ================= TEXTAREA ================= */

        textarea {
            resize: vertical;
        }


        /* ================= BUTTONS ================= */

        .btn {
            border-radius: 7px;
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

            <!-- Logo / Brand -->

            <a class="navbar-brand fw-bold"
               href="employee-dashboard.jsp">

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

    <div class="container main-content">


        <!-- Form Card -->

        <div class="row justify-content-center">

            <div class="col-lg-7 col-md-9 col-12">

                <div class="card ticket-card shadow-sm">

                    <div class="card-body p-4 p-md-5">


                        <!-- Page Title -->

                        <h2 class="page-title text-center mb-4">

                            <i class="bi bi-plus-circle me-2"></i>

                            Create New Ticket

                        </h2>



                        <!-- ================= FORM ================= -->

                        <form action="CreateTicketServlet"
                              method="post">


                            <!-- ================= TITLE ================= -->

                            <div class="mb-4">

                                <label for="title"
                                       class="form-label">

                                    Title

                                </label>

                                <input
                                    type="text"
                                    class="form-control"
                                    id="title"
                                    name="title"
                                    placeholder="Enter ticket title"
                                    required>

                            </div>



                            <!-- ================= DESCRIPTION ================= -->

                            <div class="mb-4">

                                <label for="description"
                                       class="form-label">

                                    Description

                                </label>

                                <textarea
                                    class="form-control"
                                    id="description"
                                    name="description"
                                    rows="5"
                                    placeholder="Describe your issue..."
                                    required></textarea>

                            </div>



                            <!-- ================= CATEGORY ================= -->

                            <div class="mb-4">

                                <label for="category_id"
                                       class="form-label">

                                    Category

                                </label>

                                <select
                                    class="form-select"
                                    id="category_id"
                                    name="category_id"
                                    required>

                                    <option value=""
                                            selected
                                            disabled>

                                        Select Category

                                    </option>

                                    <option value="1">
                                        Hardware
                                    </option>

                                    <option value="2">
                                        Software
                                    </option>

                                    <option value="3">
                                        Network
                                    </option>

                                    <option value="4">
                                        Email
                                    </option>

                                    <option value="5">
                                        Access / Login
                                    </option>

                                    <option value="6">
                                        Other
                                    </option>

                                </select>

                            </div>



                            <!-- ================= PRIORITY ================= -->

                            <div class="mb-4">

                                <label for="priority"
                                       class="form-label">

                                    Priority

                                </label>

                                <select
                                    class="form-select"
                                    id="priority"
                                    name="priority"
                                    required>

                                    <option value=""
                                            selected
                                            disabled>

                                        Select Priority

                                    </option>

                                    <option value="LOW">
                                        LOW
                                    </option>

                                    <option value="MEDIUM">
                                        MEDIUM
                                    </option>

                                    <option value="HIGH">
                                        HIGH
                                    </option>

                                    <option value="CRITICAL">
                                        CRITICAL
                                    </option>

                                </select>

                            </div>



                            <!-- ================= BUTTONS ================= -->

                            <div class="d-flex justify-content-center gap-3 mt-4">


                                <!-- Submit -->

                                <button
                                    type="submit"
                                    class="btn btn-primary px-4">

                                    <i class="bi bi-send me-2"></i>

                                    Submit Ticket

                                </button>



                                <!-- Cancel -->

                                <a
                                    href="employee-dashboard.jsp"
                                    class="btn btn-secondary px-4">

                                    <i class="bi bi-x-circle me-2"></i>

                                    Cancel

                                </a>


                            </div>


                        </form>


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