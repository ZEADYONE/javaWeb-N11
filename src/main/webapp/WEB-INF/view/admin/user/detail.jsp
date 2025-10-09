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
                        <div class="col-12">
                            <div class="card my-4" style="height: 60vh;">
                                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                                        <h6 class="text-white text-capitalize ps-3">Manager User</h6>
                                    </div>
                                </div>
                                <div class="table-responsive p-0">
                                    <div class="container-fluid py-4">
                                        <div class="container mt-5">
                                            <div class="row">
                                                <div class="col-12 mx-auto">
                                                    <div class="d-flex justify-content-between">
                                                        <h3 style="color: black;">User detail id = ${user.id}</h3>
                                                    </div>
                                                    <hr />
                                                    <div class="card">
                                                        <div class="card-header">
                                                            Featured
                                                        </div>
                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item">ID : ${user.id}</li>
                                                            <li class="list-group-item">Email : ${user.fullName}</li>
                                                            <li class="list-group-item">Fullname : ${user.username}</li>
                                                            <li class="list-group-item">Address : ${user.address}</li>
                                                            <li class="list-group-item">phoneNumber :
                                                                ${user.phoneNumber}</li>
                                                            <li class="list-group-item">Role : ${user.role}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../layout/footer.jsp" />
                </main>

            </body>

            </html>