<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Employee Login</title>


    <!-- ================================================= -->
    <!-- BOOTSTRAP 5 CSS -->
    <!-- ================================================= -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- ================================================= -->
    <!-- BOOTSTRAP ICONS -->
    <!-- ================================================= -->

    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <!-- ================================================= -->
    <!-- CUSTOM CSS -->
    <!-- ================================================= -->

    <style>

        /* ================================================= */
        /* BODY */
        /* ================================================= */

        body {

            min-height: 100vh;

            display: flex;

            flex-direction: column;

            background-color: #f5f7fb;

            padding-top: 55px;
        }


        /* ================================================= */
        /* COMPACT COLORFUL NAVBAR */
        /* ================================================= */

        .navbar {

            position: fixed;

            top: 0;

            width: 100%;

            z-index: 1000;

            background: linear-gradient(
                90deg,
                #0d6efd,
                #6610f2
            ) !important;

            padding: 6px 20px;

            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.18);
        }


        /* Navbar Brand */

        .navbar-brand {

            color: white !important;

            font-size: 19px;

            font-weight: 600;

            padding-top: 2px;

            padding-bottom: 2px;
        }


        .navbar-brand i {

            font-size: 20px;
        }


        /* Navbar Links */

        .navbar .nav-link {

            color: rgba(255, 255, 255, 0.90) !important;

            font-size: 15px;

            font-weight: 500;

            margin-left: 5px;

            padding: 6px 12px !important;

            border-radius: 6px;

            transition: 0.3s;
        }


        /* Hover */

        .navbar .nav-link:hover {

            color: white !important;

            background-color: rgba(255, 255, 255, 0.18);
        }


        /* Active */

        .navbar .nav-link.active {

            color: white !important;

            background-color: rgba(255, 255, 255, 0.25);

            font-weight: 600;
        }


        /* Navbar Toggler */

        .navbar-toggler {

            padding: 4px 8px;

            border: 1px solid rgba(255, 255, 255, 0.7);
        }


        .navbar-toggler:focus {

            box-shadow: none;
        }


        /* ================================================= */
        /* LOGIN SECTION */
        /* ================================================= */

        .login-section {

            flex: 1;

            padding-top: 15px;

            padding-bottom: 25px;
        }


        /* ================================================= */
        /* LOGIN CARD */
        /* ================================================= */

        .login-card {

            border: none;

            border-radius: 15px;

            background-color: white;

            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.10);

            transition: 0.3s;
        }


        .login-card:hover {

            transform: translateY(-2px);

            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.13);
        }


        /* ================================================= */
        /* LOGIN HEADING */
        /* ================================================= */

        .login-title {

            font-weight: 600;

            color: #212529;
        }


        .login-title i {

            color: #6610f2;
        }


        /* ================================================= */
        /* FORM LABEL */
        /* ================================================= */

        .form-label {

            font-weight: 500;

            color: #212529;
        }


        /* ================================================= */
        /* INPUTS */
        /* ================================================= */

        .form-control {

            min-height: 48px;

            border-radius: 8px;

            border: 1px solid #dee2e6;

            padding: 9px 14px;

            transition: 0.3s;
        }


        .form-control:focus {

            border-color: #6610f2;

            box-shadow:
                0 0 0 0.2rem
                rgba(102, 16, 242, 0.15);
        }


        /* ================================================= */
        /* LOGIN BUTTON */
        /* ================================================= */

        .login-btn {

            min-height: 48px;

            border: none;

            border-radius: 8px;

            font-weight: 600;

            font-size: 16px;

            background: linear-gradient(
                90deg,
                #0d6efd,
                #6610f2
            );

            transition: 0.3s;
        }


        .login-btn:hover {

            transform: translateY(-2px);

            box-shadow:
                0 5px 15px
                rgba(102, 16, 242, 0.30);
        }


        /* ================================================= */
        /* REGISTER LINK */
        /* ================================================= */

        .register-link {

            color: #6610f2;

            font-weight: 600;

            text-decoration: none;
        }


        .register-link:hover {

            color: #0d6efd;

            text-decoration: underline;
        }


        /* ================================================= */
        /* FOOTER */
        /* ================================================= */

        footer {

            margin-top: auto;

            background-color: #212529;
        }


        /* ================================================= */
        /* MOBILE RESPONSIVE */
        /* ================================================= */

        @media (max-width: 768px) {

            body {

                padding-top: 55px;
            }


            .navbar {

                padding: 6px 12px;
            }


            .navbar-brand {

                font-size: 18px;
            }


            .navbar .nav-link {

                margin-left: 0;

                margin-top: 3px;
            }


            .login-section {

                padding-top: 5px;
            }


            .login-card {

                margin-top: 15px !important;

                margin-bottom: 15px !important;
            }

        }

    </style>

</head>


<body>


    <!-- ================================================= -->
    <!-- NAVBAR -->
    <!-- ================================================= -->

    <nav class="navbar navbar-expand-lg fixed-top">

        <div class="container-fluid">


            <!-- Brand -->

            <a class="navbar-brand"
               href="login.jsp">

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

            <div
                class="collapse navbar-collapse"
                id="navbarMenu">


                <ul class="navbar-nav ms-auto">


                    <!-- Register -->

                    <li class="nav-item">

                        <a
                            class="nav-link"
                            href="register.jsp">

                            <i class="bi bi-person-plus me-1"></i>

                            Register

                        </a>

                    </li>


                    <!-- Login -->

                    <li class="nav-item">

                        <a
                            class="nav-link active"
                            href="login.jsp">

                            <i class="bi bi-box-arrow-in-right me-1"></i>

                            Login

                        </a>

                    </li>


                    <!-- About -->

                    <li class="nav-item">

                        <a
                            class="nav-link"
                            href="about.jsp">

                            <i class="bi bi-info-circle me-1"></i>

                            About

                        </a>

                    </li>


                </ul>

            </div>

        </div>

    </nav>


    <!-- ================================================= -->
    <!-- LOGIN SECTION -->
    <!-- ================================================= -->

    <section class="login-section">

        <div class="container-fluid">

            <div class="row justify-content-center">


                <!-- LEFT 3 COLUMNS -->

                <div class="col-lg-3 col-md-2 d-none d-md-block">
                </div>


                <!-- ================================================= -->
                <!-- MIDDLE 6 COLUMNS -->
                <!-- ================================================= -->

                <div class="col-lg-6 col-md-8 col-12">


                    <div class="card login-card mt-4 mb-4">


                        <div class="card-body p-4 p-md-5">


                            <!-- Heading -->

                            <h2 class="text-center mb-4 login-title">

                                <i class="bi bi-box-arrow-in-right me-2"></i>

                                 Login

                            </h2>


                            <!-- ================================================= -->
                            <!-- LOGIN FORM -->
                            <!-- ================================================= -->

                            <form
                                action="LoginServlet"
                                method="post">


                                <!-- EMAIL -->

                                <div class="mb-3">

                                    <label
                                        for="email"
                                        class="form-label">

                                        <i class="bi bi-envelope me-1"></i>

                                        Email

                                    </label>


                                    <input
                                        type="email"
                                        class="form-control"
                                        id="email"
                                        name="email"
                                        placeholder="Enter your email"
                                        required>

                                </div>


                                <!-- PASSWORD -->

                                <div class="mb-4">

                                    <label
                                        for="password"
                                        class="form-label">

                                        <i class="bi bi-lock me-1"></i>

                                        Password

                                    </label>


                                    <input
                                        type="password"
                                        class="form-control"
                                        id="password"
                                        name="password"
                                        placeholder="Enter your password"
                                        required>

                                </div>


                                <!-- LOGIN BUTTON -->

                                <div class="d-grid">

                                    <button
                                        type="submit"
                                        class="btn btn-primary login-btn">

                                        <i class="bi bi-box-arrow-in-right me-2"></i>

                                        Login

                                    </button>

                                </div>


                                <!-- REGISTER LINK -->

                                <div class="text-center mt-4">

                                    <p class="mb-0">

                                        Don't have an account?

                                        <a
                                            href="register.jsp"
                                            class="register-link">

                                            Register

                                        </a>

                                    </p>

                                </div>


                            </form>


                        </div>

                    </div>

                </div>


                <!-- RIGHT 3 COLUMNS -->

                <div class="col-lg-3 col-md-2 d-none d-md-block">
                </div>


            </div>

        </div>

    </section>


    <!-- ================================================= -->
    <!-- FOOTER -->
    <!-- ================================================= -->

    <footer class="text-white text-center py-3">

        <div class="container">

            <p class="mb-0">

                © 2026 IT Service Desk Management System.
                All Rights Reserved.

            </p>

        </div>

    </footer>


    <!-- ================================================= -->
    <!-- BOOTSTRAP JAVASCRIPT -->
    <!-- ================================================= -->

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>


</body>

</html>