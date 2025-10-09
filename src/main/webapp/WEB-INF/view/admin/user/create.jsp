<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <link rel="apple-touch-icon" sizes="76x76" href="/admin/img/apple-icon.png">
                <link rel="icon" type="image/png" href="/admin/img/favicon.png">
                <title>
                    Material Dashboard 2 by Creative Tim
                </title>

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
                            <div class="card my-4">
                                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                                        <h6 class="text-white text-capitalize ps-3">Manager User</h6>
                                    </div>
                                </div>
                                <div class="table-responsive p-0">
                                    <div class="container-fluid py-4">
                                        <div class="container mt-5">
                                            <div class="row">
                                                <div class="col-md-6 col-12 mx-auto">
                                                    <h3 style="color: black;">Create a user</h3>
                                                    <hr />
                                                    <form:form method="post" action="/admin/user/create"
                                                        modelAttribute="newUser">
                                                        <div class="mb-3">
                                                            <label class="form-label">Email:</label>
                                                            <form:input type="email"
                                                                class="form-control border border-primary"
                                                                style="padding-left: 20px;" path="email" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">User name:</label>
                                                            <form:input type="text"
                                                                class="form-control border border-primary"
                                                                style="padding-left: 20px;" path="username" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Password:</label>
                                                            <form:input type="password"
                                                                class="form-control border border-primary"
                                                                style="padding-left: 20px;" path="password" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Full name:</label>
                                                            <form:input type="text"
                                                                class="form-control border border-primary"
                                                                style="padding-left: 20px;" path="fullName" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Phone number:</label>
                                                            <form:input type="text"
                                                                class="form-control border border-primary"
                                                                style="padding-left: 20px;" path="phoneNumber" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Address:</label>
                                                            <form:input type="text"
                                                                class="form-control border border-primary"
                                                                style="padding-left: 20px;" path="address" />
                                                        </div>

                                                        <button type="submit" class="btn btn-primary"
                                                            style="background-color: #ffba00;">Create</button>
                                                    </form:form>
                                                    <jsp:include page="../layout/footer.jsp" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                </main>

            </body>

            </html>