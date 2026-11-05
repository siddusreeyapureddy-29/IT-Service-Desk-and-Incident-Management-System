<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>About - IT Service Desk</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
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
            padding-top: 55px;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;

            padding: 6px 20px;

            background: linear-gradient(90deg, #0d6efd, #6610f2) !important;

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


        /* ================= MAIN CONTAINER ================= */

        .about-container {
            margin-top: 45px;
            margin-bottom: 50px;
        }


        /* ================= HERO SECTION ================= */

        .hero-section {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .hero-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background-color: #0d6efd;
            color: white;

            font-size: 38px;

            margin: 0 auto 20px;
        }


        /* ================= FEATURE CARDS ================= */

        .feature-card {
            background: white;
            border: none;
            border-radius: 12px;

            padding: 25px;
            height: 100%;

            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.07);

            transition: 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 30px;
            color: #0d6efd;
            margin-bottom: 15px;
        }


        /* ================= TECHNOLOGY SECTION ================= */

        .tech-box {
            background: white;
            border-radius: 15px;

            padding: 30px;

            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.07);
        }


        /* ================= FOOTER ================= */

        footer {
            margin-top: 50px;
            padding: 20px;

            background-color: #212529;
            color: white;

            text-align: center;
        }

    </style>

</head>


<body>


    <!-- ================= NAVBAR ================= -->

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">

        <div class="container-fluid">

            <!-- Brand -->
            <a class="navbar-brand fw-bold" href="login.jsp">

                <i class="bi bi-headset me-2"></i>

                IT Service Desk

            </a>


            <!-- Mobile Toggler -->
            <button class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarMenu">

                <span class="navbar-toggler-icon"></span>

            </button>


            <!-- Navbar Menu -->
            <div class="collapse navbar-collapse"
                 id="navbarMenu">

                <ul class="navbar-nav ms-auto">


                    <!-- Register -->
                    <li class="nav-item">

                        <a class="nav-link"
                           href="register.jsp">

                            <i class="bi bi-person-plus me-1"></i>

                            Register

                        </a>

                    </li>


                    <!-- Login -->
                    <li class="nav-item">

                        <a class="nav-link"
                           href="login.jsp">

                            <i class="bi bi-box-arrow-in-right me-1"></i>

                            Login

                        </a>

                    </li>


                    <!-- About -->
                    <li class="nav-item">

                        <a class="nav-link active"
                           href="about.jsp">

                            <i class="bi bi-info-circle me-1"></i>

                            About

                        </a>

                    </li>


                </ul>

            </div>

        </div>

    </nav>



    <!-- ================= MAIN CONTENT ================= -->

    <div class="container about-container">


        <!-- ================= HERO SECTION ================= -->

        <div class="hero-section text-center">

            <div class="hero-icon">

                <i class="bi bi-headset"></i>

            </div>


            <h1 class="fw-bold">

                IT Service Desk & Incident Management System

            </h1>


            <p class="text-muted mt-3">

                A centralized web-based platform for managing IT incidents,
                service requests, technician assignments, and ticket resolutions.

            </p>

        </div>



        <!-- ================= ABOUT PROJECT ================= -->

        <div class="row mt-5">

            <div class="col-lg-8 mx-auto">

                <div class="card border-0 shadow-sm p-4">

                    <h3 class="fw-bold mb-3">

                        <i class="bi bi-info-circle text-primary me-2"></i>

                        About the System

                    </h3>


                    <p>

                        The <strong>IT Service Desk & Incident Management System</strong>
                        is a web-based application designed to simplify and manage
                        IT support requests within an organization.

                    </p>


                    <p>

                        The system provides a centralized platform where employees
                        can report technical issues, technicians can manage and
                        resolve assigned tickets, and administrators can monitor
                        and manage the overall support process.

                    </p>


                    <p class="mb-0">

                        The application helps organizations track IT issues from
                        the initial ticket creation through assignment, resolution,
                        and final closure.

                    </p>

                </div>

            </div>

        </div>



        <!-- ================= KEY FEATURES ================= -->

        <div class="mt-5">

            <h3 class="text-center fw-bold mb-4">

                Key Features

            </h3>


            <div class="row g-4">


                <!-- Feature 1 -->

                <div class="col-md-6 col-lg-4">

                    <div class="feature-card text-center">

                        <div class="feature-icon">

                            <i class="bi bi-people"></i>

                        </div>


                        <h5 class="fw-bold">

                            Role-Based Access

                        </h5>


                        <p class="text-muted">

                            Separate functionality for Employees,
                            Technicians, and Administrators.

                        </p>

                    </div>

                </div>



                <!-- Feature 2 -->

                <div class="col-md-6 col-lg-4">

                    <div class="feature-card text-center">

                        <div class="feature-icon">

                            <i class="bi bi-ticket-perforated"></i>

                        </div>


                        <h5 class="fw-bold">

                            Ticket Management

                        </h5>


                        <p class="text-muted">

                            Create, assign, track, resolve, and close
                            IT support tickets.

                        </p>

                    </div>

                </div>



                <!-- Feature 3 -->

                <div class="col-md-6 col-lg-4">

                    <div class="feature-card text-center">

                        <div class="feature-icon">

                            <i class="bi bi-arrow-repeat"></i>

                        </div>


                        <h5 class="fw-bold">

                            Ticket Lifecycle

                        </h5>


                        <p class="text-muted">

                            OPEN → ASSIGNED → IN_PROGRESS →
                            RESOLVED → CLOSED

                        </p>

                    </div>

                </div>



                <!-- Feature 4 -->

                <div class="col-md-6 col-lg-4">

                    <div class="feature-card text-center">

                        <div class="feature-icon">

                            <i class="bi bi-person-check"></i>

                        </div>


                        <h5 class="fw-bold">

                            Technician Assignment

                        </h5>


                        <p class="text-muted">

                            Administrators can assign tickets to
                            appropriate technicians.

                        </p>

                    </div>

                </div>



                <!-- Feature 5 -->

                <div class="col-md-6 col-lg-4">

                    <div class="feature-card text-center">

                        <div class="feature-icon">

                            <i class="bi bi-chat-left-text"></i>

                        </div>


                        <h5 class="fw-bold">

                            Ticket Comments

                        </h5>


                        <p class="text-muted">

                            Employees and technicians can communicate
                            through ticket comments.

                        </p>

                    </div>

                </div>



                <!-- Feature 6 -->

                <div class="col-md-6 col-lg-4">

                    <div class="feature-card text-center">

                        <div class="feature-icon">

                            <i class="bi bi-bar-chart"></i>

                        </div>


                        <h5 class="fw-bold">

                            Dashboard

                        </h5>


                        <p class="text-muted">

                            View ticket statistics and monitor
                            current ticket status.

                        </p>

                    </div>

                </div>


            </div>

        </div>



        <!-- ================= TECHNOLOGY SECTION ================= -->

        <div class="tech-box mt-5">

            <h3 class="fw-bold text-center mb-4">

                Technologies Used

            </h3>


            <div class="row text-center g-3">


                <div class="col-6 col-md-3">

                    <div class="fw-bold">

                        Java

                    </div>

                    <small class="text-muted">

                        Backend Programming

                    </small>

                </div>



                <div class="col-6 col-md-3">

                    <div class="fw-bold">

                        JSP & Servlets

                    </div>

                    <small class="text-muted">

                        Web Application

                    </small>

                </div>



                <div class="col-6 col-md-3">

                    <div class="fw-bold">

                        JDBC

                    </div>

                    <small class="text-muted">

                        Database Connectivity

                    </small>

                </div>



                <div class="col-6 col-md-3">

                    <div class="fw-bold">

                        MySQL

                    </div>

                    <small class="text-muted">

                        Database

                    </small>

                </div>



                <div class="col-6 col-md-3">

                    <div class="fw-bold">

                        HTML

                    </div>

                    <small class="text-muted">

                        Frontend

                    </small>

                </div>



                <div class="col-6 col-md-3">

                    <div class="fw-bold">

                        CSS

                    </div>

                    <small class="text-muted">

                        Styling

                    </small>

                </div>



                <div class="col-6 col-md-3">

                    <div class="fw-bold">

                        Bootstrap

                    </div>

                    <small class="text-muted">

                        Responsive UI

                    </small>

                </div>



                <div class="col-6 col-md-3">

                    <div class="fw-bold">

                        Apache Tomcat

                    </div>

                    <small class="text-muted">

                        Application Server

                    </small>

                </div>


            </div>

        </div>



        <!-- ================= PROJECT GOAL ================= -->

        <div class="card border-0 shadow-sm mt-5 p-4 text-center">

            <h3 class="fw-bold mb-3">

                <i class="bi bi-bullseye text-primary me-2"></i>

                Project Goal

            </h3>


            <p class="text-muted mb-0">

                The goal of this system is to provide an organized and efficient
                way to handle IT support requests, improve communication between
                employees and technicians, reduce manual tracking, and provide
                better visibility into the status of IT issues.

            </p>

        </div>


    </div>



    <!-- ================= FOOTER ================= -->

    <footer>

        <p class="mb-1">

            <i class="bi bi-headset me-1"></i>

            IT Service Desk & Incident Management System

        </p>


        <small>

            Java | JSP | Servlets | JDBC | MySQL

        </small>

    </footer>



    <!-- Bootstrap JS -->

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>


</body>

</html>