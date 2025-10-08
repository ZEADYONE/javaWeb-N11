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
        <% request.setAttribute("pageTitle", "User" ); %>
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
                    <h6 class="text-white text-capitalize ps-3">User table</h6>
                  </div>
                </div>
                <div class="card-body px-0 pb-2">
                  <div class="table-responsive p-0">
                    <table class="table align-items-center justify-content-center mb-0">
                      <thead>
                        <tr>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                            ID</th>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                            Name</th>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                            Email</th>
                          <th
                            class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">
                            Phone number</th>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                            Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- sẽ for Each tại đây modelAttribute = UserList nhận List<User> -->
                        <tr>
                          <td>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">1</h6>
                            </div>
                          </td>
                          <td>
                            <p class="text-sm font-weight-bold mb-0">Nguyễn Trường Giang</p>
                          </td>
                          <td>
                            <span class="text-xs font-weight-bold">truonggiang29122005@gmail.com</span>
                          </td>
                          <td class="align-middle text-center">
                            <p class="text-sm font-weight-bold mb-0">0869668798</p>
                          </td>
                          <td>
                            <a type="button" class="btn bg-gradient-info">Info</a>
                            <a type="button" class="btn bg-gradient-success">Success</a>
                            <a type="button" class="btn bg-gradient-danger">Danger</a>
                            <a type="button" class="btn bg-gradient-warning">Warning</a>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">2</h6>
                            </div>
                          </td>
                          <td>
                            <p class="text-sm font-weight-bold mb-0">Đỗ Trí Cương</p>
                          </td>
                          <td>
                            <span class="text-xs font-weight-bold">truonggiang29122005@gmail.com</span>
                          </td>
                          <td class="align-middle text-center">
                            <p class="text-sm font-weight-bold mb-0">0869668798</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">3</h6>
                            </div>
                          </td>
                          <td>
                            <p class="text-sm font-weight-bold mb-0">Ngô Minh Đức</p>
                          </td>
                          <td>
                            <span class="text-xs font-weight-bold">truonggiang29122005@gmail.com</span>
                          </td>
                          <td class="align-middle text-center">
                            <p class="text-sm font-weight-bold mb-0">0869668798</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">4</h6>
                            </div>
                          </td>
                          <td>
                            <p class="text-sm font-weight-bold mb-0">Nguyễn Văn Thanh Tùng</p>
                          </td>
                          <td>
                            <span class="text-xs font-weight-bold">truonggiang29122005@gmail.com</span>
                          </td>
                          <td class="align-middle text-center">
                            <p class="text-sm font-weight-bold mb-0">0869668798</p>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="my-auto">
                              <h6 class="mb-0 text-sm">5</h6>
                            </div>
                          </td>
                          <td>
                            <p class="text-sm font-weight-bold mb-0">Nguyễn Nhật Anh</p>
                          </td>
                          <td>
                            <span class="text-xs font-weight-bold">truonggiang29122005@gmail.com</span>
                          </td>
                          <td class="align-middle text-center">
                            <p class="text-sm font-weight-bold mb-0">0869668798</p>
                          </td>
                        </tr>
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