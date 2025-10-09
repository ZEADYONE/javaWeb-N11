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
        <jsp:include page="../layout/sidebar.jsp" />
      </aside>
      <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
        <jsp:include page="../layout/header.jsp" />
        <div class="container-fluid py-4">
          <div class="row">
            <div class="col-12">
              <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                  <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                    <h6 class="text-white text-capitalize ps-3">Manager User</h6>
                  </div>
                </div>
                <div><a type="button" class="btn btn-primary"
                    style="background-color: #ffba00;margin-top: 20px; margin-left: 20px; margin-bottom: 0px;"
                    href="/admin/user/create" role="button">Create user</a>
                </div>
                <div class="card-body px-0 pb-2">
                  <div class="table-responsive p-0" style="height: 80vh;">
                    <table class="table align-items-center justify-content-center mb-0">
                      <thead>
                        <tr>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                            style="text-align: center; vertical-align: middle;">
                            ID</th>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                            Name</th>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                            Email</th>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                            Phone number</th>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                            <i style="padding-left: 20px; font-style: normal;">ACTION</i>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- sẽ for Each tại đây modelAttribute = UserList nhận List<User> -->
                        <c:forEach var="user" items="${users}">
                          <tr>
                            <td style="text-align: center; vertical-align: middle;">
                              <div class="my-auto">
                                <h6 class="mb-0 text-sm">${user.id}</h6>
                              </div>
                            </td>
                            <td style="width: 300px;">
                              <p class="text-sm font-weight-bold mb-0">${user.fullName}</p>
                            </td>
                            <td style="width: 300px;">
                              <span class="text-xs font-weight-bold">${user.email}</span>
                            </td>
                            <td>
                              <p class="text-sm font-weight-bold mb-0">${user.phoneNumber}</p>
                            </td>
                            <td>
                              <i class="bi bi-person-vcard mx-2"></i>
                              <i class="bi bi-person-gear mx-2"></i>
                              <i class="bi bi-trash mx-2"></i>
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