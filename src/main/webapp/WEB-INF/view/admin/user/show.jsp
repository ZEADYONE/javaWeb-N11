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

        <style>
          /* Làm nền modal mờ nhẹ thay vì đen đậm */
          .modal-backdrop.show {
            opacity: 0.15 !important;
            /* mặc định Bootstrap là 0.5 */
          }
        </style>
      </head>

      <body class="g-sidenav-show  bg-gray-200">
        <aside
          class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark"
          id="sidenav-main">
          <jsp:include page="../layout/sidebar.jsp" />
        </aside>
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
          <jsp:include page="../layout/header.jsp" />
          <div class="container-fluid py-4">
            <div class=" row">
              <div class="col-12">
                <div class="card my-4">
                  <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                      <h6 class="text-white text-capitalize ps-3">Manager User</h6>
                    </div>
                  </div>
                  <!-- Nút mở modal Create -->
                  <button type="button" class="btn btn-primary"
                    style="background-color: #ffba00; margin: 20px 0 0 30px; width: 130px;" data-bs-toggle="modal"
                    data-bs-target="#CreateModal" title="Create">
                    Create User
                  </button>

                  <!-- Modal Create -->
                  <div class="modal fade" id="CreateModal" tabindex="-1" aria-labelledby="CreateModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                      <div class="modal-content border-0 shadow-lg rounded-4">

                        <!-- Header -->
                        <div class="modal-header bg-gradient-primary text-white rounded-top-4">
                          <h5 class="modal-title" id="CreateModalLabel">Create User</h5>
                          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                        </div>

                        <!-- Body -->
                        <div class="modal-body py-4 px-5">
                          <form:form method="post" action="/admin/user/create" modelAttribute="newUser">
                            <div class="row">
                              <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Email:</label>
                                <form:input type="email" class="form-control border border-primary"
                                  style="padding-left: 20px;" path="email" />
                              </div>

                              <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">User name:</label>
                                <form:input type="text" class="form-control border border-primary"
                                  style="padding-left: 20px;" path="username" />
                              </div>

                              <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Password:</label>
                                <form:input type="password" class="form-control border border-primary"
                                  style="padding-left: 20px;" path="password" />
                              </div>

                              <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Full name:</label>
                                <form:input type="text" class="form-control border border-primary"
                                  style="padding-left: 20px;" path="fullName" />
                              </div>

                              <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Phone number:</label>
                                <form:input type="text" class="form-control border border-primary"
                                  style="padding-left: 20px;" path="phoneNumber" />
                              </div>

                              <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Address:</label>
                                <form:input type="text" class="form-control border border-primary"
                                  style="padding-left: 20px;" path="address" />
                              </div>
                            </div>

                            <div class="text-center mt-4">
                              <button type="submit" class="btn text-white px-4 py-2" style="background-color: #ffba00;">
                                Create
                              </button>
                            </div>
                          </form:form>
                        </div>

                        <!-- Footer -->
                        <div class="modal-footer justify-content-center border-0 pb-3"></div>

                      </div>
                    </div>
                  </div>

                  <div class="card-body px-0 pb-2" style="height:70vh;">

                    <div class="table-responsive p-0">
                      <table class="table align-items-center mb-0">
                        <thead class="bg-light">
                          <tr>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                              ID
                            </th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                              Full Name
                            </th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                              Email
                            </th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                              Phone Number
                            </th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                              Action
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach var="user" items="${users}">
                            <tr class="align-middle">
                              <!-- ID -->
                              <td class="text-center">
                                <h6 class="mb-0 text-sm">${user.id}</h6>
                              </td>

                              <!-- Full Name -->
                              <td style="min-width: 220px;">
                                <p class="text-sm font-weight-bold mb-0">${user.fullName}</p>
                              </td>

                              <!-- Email -->
                              <td style="min-width: 250px;">
                                <span class="text-xs font-weight-bold">${user.email}</span>
                              </td>

                              <!-- Phone -->
                              <td style="min-width: 180px;">
                                <p class="text-sm font-weight-bold mb-0">${user.phoneNumber}</p>
                              </td>

                              <!-- Action -->
                              <td class="text-center">
                                <!-- View -->
                                <a href="/admin/user/detail/${user.id}" class="btn btn-sm btn-outline-info mx-1"
                                  title="View">
                                  <i class="bi bi-person-vcard"></i>
                                </a>

                                <!-- Edit -->
                                <a href="/admin/user/update/${user.id}" class="btn btn-sm btn-outline-primary mx-1"
                                  title="Edit">
                                  <i class="bi bi-person-gear"></i>
                                </a>

                                <!-- Delete (modal trigger) -->
                                <button type="button" class="btn btn-sm btn-outline-danger mx-1" data-bs-toggle="modal"
                                  data-bs-target="#deleteModal${user.id}" title="Delete">
                                  <i class="bi bi-trash"></i>
                                </button>

                                <!-- Modal Delete -->
                                <div class="modal fade" id="deleteModal${user.id}" tabindex="-1"
                                  aria-labelledby="deleteModalLabel${user.id}" aria-hidden="true">
                                  <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border-0 shadow-lg">

                                      <!-- Header -->
                                      <div class="modal-header bg-gradient-primary text-white">
                                        <h5 class="modal-title" id="deleteModalLabel${user.id}">
                                          Confirm Delete
                                        </h5>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                          aria-label="Close"></button>
                                      </div>

                                      <!-- Body -->
                                      <div class="modal-body text-center py-4">
                                        <p class="mb-2">Are you sure you want to delete:</p>
                                        <h6 class="text-danger fw-bold mb-0">${user.fullName}</h6>
                                      </div>

                                      <!-- Footer -->
                                      <div class="modal-footer justify-content-center border-0 pb-4">
                                        <form method="post" action="/admin/user/delete">
                                          <input type="hidden" name="id" value="${user.id}">
                                          <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">
                                            Cancel
                                          </button>
                                          <button type="submit" class="btn text-white"
                                            style="background-color: #ffba00;">
                                            Delete
                                          </button>
                                        </form>
                                      </div>

                                    </div>
                                  </div>
                                </div>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>


                    </div>
                  </div>
                </div>
              </div>
            </div>
            <jsp:include page="../layout/footer.jsp" />
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