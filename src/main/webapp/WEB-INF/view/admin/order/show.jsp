<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <!--     Fonts and icons     -->
            <link rel="stylesheet" type="text/css"
                href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
            <!-- Nucleo Icons -->
            <link href="/admin/css/nucleo-icons.css" rel="stylesheet" />
            <link href="/admin/css/nucleo-svg.css" rel="stylesheet" />
            <!-- Font Awesome Icons -->
            <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
            <!-- Material Icons -->
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
            <!-- CSS Files -->
            <link id="pagestyle" href="/admin/css/material-dashboard.css" rel="stylesheet" />


        </head>

        <body class="g-sidenav-show  bg-gray-200">
            <aside
                class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark"
                id="sidenav-main">
                <% request.setAttribute("pageTitle", "Order" ); %>
                    <jsp:include page="../layout/sidebar.jsp" />
            </aside>
            <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">

                <div class="container-fluid py-4">
                    <div class="row">
                        <!-- Pending -->
                        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                            <a href="/admin/order">
                                <div class="card">
                                    <div class="card-header p-3 pt-2">
                                        <div
                                            class="icon icon-lg icon-shape bg-gradient-warning shadow-warning text-center border-radius-xl mt-n4 position-absolute">
                                            <i class="material-icons opacity-10">hourglass_empty</i>
                                        </div>
                                        <div class="text-end pt-1">
                                            <h6 class="mb-0">PENDING</h6>
                                            <h4 class="mb-0">${pendingCount}</h4>
                                        </div>
                                    </div>
                                    <hr class="dark horizontal my-0">
                                    <div class="card-footer p-3">
                                        <p class="mb-0"></p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Shipping -->
                        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                            <a href="/admin/order/shipping">
                                <div class="card">
                                    <div class="card-header p-3 pt-2">
                                        <div
                                            class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                                            <i class="material-icons opacity-10">local_shipping</i>
                                        </div>
                                        <div class="text-end pt-1">
                                            <h6 class="mb-0">SHIPPING</h6>
                                            <h4 class="mb-0">${shippingCount}</h4>
                                        </div>
                                    </div>
                                    <hr class="dark horizontal my-0">
                                    <div class="card-footer p-3">
                                        <p class="mb-0"></p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Accepted -->
                        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                            <a href="/admin/order/accepted">
                                <div class="card">
                                    <div class="card-header p-3 pt-2">
                                        <div
                                            class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                                            <i class="material-icons opacity-10">check_circle</i>
                                        </div>
                                        <div class="text-end pt-1">
                                            <h6 class="mb-0">ACCEPTED</h6>
                                            <h4 class="mb-0">${acceptedCount}</h4>
                                        </div>
                                    </div>
                                    <hr class="dark horizontal my-0">
                                    <div class="card-footer p-3">
                                        <p class="mb-0"></p>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- Canceled -->
                        <div class="col-xl-3 col-sm-6">
                            <a href="/admin/order/canceled">
                                <div class="card">
                                    <div class="card-header p-3 pt-2">
                                        <div
                                            class="icon icon-lg icon-shape bg-gradient-danger shadow-danger text-center border-radius-xl mt-n4 position-absolute">
                                            <i class="material-icons opacity-10">cancel</i>
                                        </div>
                                        <div class="text-end pt-1">
                                            <h6 class="mb-0">CANCELED</h6>
                                            <h4 class="mb-0">${canceledCount}</h4>
                                        </div>
                                    </div>
                                    <hr class="dark horizontal my-0">
                                    <div class="card-footer p-3">
                                        <p class="mb-0"></p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>



                    <jsp:include page="../layout/footer.jsp" />
                </div>
                <div class="col-md-12 mt-4">
                    <div class="card">
                        <div class="card-header pb-0 px-3">
                            <h6 class="mb-0">Order ${status}</h6>
                        </div>
                        <div class="card-body pt-4 p-3">
                            <ul class="list-group">
                                <c:forEach var="order" items="${orders}">
                                    <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-3 text-sm">Order ID: ${order.id}</h6>
                                            <span class="mb-2 text-xs">User id: <span
                                                    class="text-dark font-weight-bold ms-sm-2">${order.user.id}</span></span>
                                            <span class="mb-2 text-xs">Name: <span
                                                    class="text-dark ms-sm-2 font-weight-bold">${order.name}</span></span>
                                            <!-- <span class="text-xs">Address: <span
                                                    class="text-dark ms-sm-2 font-weight-bold">${order.address}</span></span> -->
                                        </div>
                                        <div class="ms-auto text-end">
                                            <c:if test="${order.status == 'pending'}">
                                                <form method="post" action="/admin/order/update/${order.id}">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}">

                                                    <button class="btn btn-link text-warning text-gradient px-3 mb-0"
                                                        type="submit"><i class="material-icons text-sm
                                                            me-2">local_shipping</i>Shipping</button>
                                                </form>
                                            </c:if>
                                            <a class="btn btn-link text-danger text-gradient px-3 mb-0"
                                                href="javascript:;"><i
                                                    class="material-icons text-sm me-2">delete</i>Delete</a>
                                            <a class="btn btn-link text-dark px-3 mb-0" href="javascript:;"><i
                                                    class="material-icons text-sm me-2">edit</i>Edit</a>
                                        </div>
                                    </li>

                                </c:forEach>

                                <!-- <li class="list-group-item border-0 d-flex p-4 mb-2 mt-3 bg-gray-100 border-radius-lg">
                                    <div class="d-flex flex-column">
                                        <h6 class="mb-3 text-sm">Lucas Harper</h6>
                                        <span class="mb-2 text-xs">Company Name: <span
                                                class="text-dark font-weight-bold ms-sm-2">Stone Tech Zone</span></span>
                                        <span class="mb-2 text-xs">Email Address: <span
                                                class="text-dark ms-sm-2 font-weight-bold">lucas@stone-tech.com</span></span>
                                        <span class="text-xs">VAT Number: <span
                                                class="text-dark ms-sm-2 font-weight-bold">FRB1235476</span></span>
                                    </div>
                                    <div class="ms-auto text-end">
                                        <a class="btn btn-link text-danger text-gradient px-3 mb-0"
                                            href="javascript:;"><i
                                                class="material-icons text-sm me-2">delete</i>Delete</a>
                                        <a class="btn btn-link text-dark px-3 mb-0" href="javascript:;"><i
                                                class="material-icons text-sm me-2">edit</i>Edit</a>
                                    </div>
                                </li>
                                <li class="list-group-item border-0 d-flex p-4 mb-2 mt-3 bg-gray-100 border-radius-lg">
                                    <div class="d-flex flex-column">
                                        <h6 class="mb-3 text-sm">Ethan James</h6>
                                        <span class="mb-2 text-xs">Company Name: <span
                                                class="text-dark font-weight-bold ms-sm-2">Fiber Notion</span></span>
                                        <span class="mb-2 text-xs">Email Address: <span
                                                class="text-dark ms-sm-2 font-weight-bold">ethan@fiber.com</span></span>
                                        <span class="text-xs">VAT Number: <span
                                                class="text-dark ms-sm-2 font-weight-bold">FRB1235476</span></span>
                                    </div>
                                    <div class="ms-auto text-end">
                                        <a class="btn btn-link text-danger text-gradient px-3 mb-0"
                                            href="javascript:;"><i
                                                class="material-icons text-sm me-2">delete</i>Delete</a>
                                        <a class="btn btn-link text-dark px-3 mb-0" href="javascript:;"><i
                                                class="material-icons text-sm me-2">edit</i>Edit</a>
                                    </div>
                                </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </main>

            <!--   Core JS Files   -->
            <script src="/admin/js/core/popper.min.js"></script>
            <script src="/admin/js/core/bootstrap.min.js"></script>
            <script src="/admin/js/plugins/perfect-scrollbar.min.js"></script>
            <script src="/admin/js/plugins/smooth-scrollbar.min.js"></script>
            <script>
                var win = navigator.platform.indexOf('Win') > -1;
                if (win && document.querySelector('#sidenav-scrollbar')) {
                    var options = {
                        damping: '0.5'
                    }
                    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                }
            </script>
            <!-- Github buttons -->
            <script async defer src="https://buttons.github.io/buttons.js"></script>
            <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
            <script src="/admin/js/material-dashboard.min.js?v=3.0.0"></script>

        </body>

        </html>