<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User detail ${user.id}</title>

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <link href=/css/demo.css rel="stylesheet">
            </head>

            <body>
                <aside
                    class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark"
                    id="sidenav-main">
                    <jsp:include page="../layout/sidebar.jsp" />
                </aside>

                <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
                    <jsp:include page="../layout/header.jsp" />
                    <div class="container-fluid py-4">
                        <div class="col-12 mx-auto">
                            <div class="card my-4 border-0 shadow-sm">
                                <!-- Header -->
                                <div class="card-header p-0 mt-n4 mx-3 z-index-2 position-relative">
                                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3 px-3">
                                        <h6 class="text-white text-capitalize mb-0">User Detail</h6>
                                    </div>
                                </div>

                                <!-- Body -->
                                <div class="card-body px-4 py-4">
                                    <h4 class="text-dark mb-3">User Detail - ID: ${user.id}</h4>
                                    <hr class="my-3" />

                                    <div class="card border-0 shadow-sm">
                                        <div class="card-header bg-light fw-bold text-dark">
                                            Account Information
                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">
                                                <strong>ID:</strong> ${user.id}
                                            </li>
                                            <li class="list-group-item">
                                                <strong>Full Name:</strong> ${user.fullName}
                                            </li>
                                            <li class="list-group-item">
                                                <strong>Username:</strong> ${user.username}
                                            </li>
                                            <li class="list-group-item">
                                                <strong>Address:</strong> ${user.address}
                                            </li>
                                            <li class="list-group-item">
                                                <strong>Phone Number:</strong> ${user.phoneNumber}
                                            </li>
                                            <li class="list-group-item">
                                                <strong>Role:</strong> ${user.role}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <jsp:include page="../layout/footer.jsp" />
                </main>

            </body>

            </html>