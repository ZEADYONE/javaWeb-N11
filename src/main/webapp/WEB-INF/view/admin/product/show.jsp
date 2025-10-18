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
          .modal-backdrop.show {
            opacity: 0.15 !important;

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

          <div class="container-fluid py-4">
            <div class=" row">
              <div class="col-12">
                <div class="card my-4">
                  <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                      <h6 class="text-white text-capitalize ps-3">Manager Product</h6>
                    </div>
                  </div>

                  <!-- Nút mở modal Create -->
                  <button type="button" class="btn btn-primary"
                    style="background-color: #ffba00; margin: 20px 0 0 30px; width: 130px;" data-bs-toggle="modal"
                    data-bs-target="#CreateModal" title="Create">
                    Add product
                  </button>

                  <!-- Modal create -->
                  <jsp:include page="../product/create.jsp" />

                  <div class="card-body px-0 pb-2">
                    <div class="table-responsive p-0">
                      <table class="table align-items-center mb-0">
                        <thead class="bg-light">
                          <tr>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                              ID
                            </th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                              Name
                            </th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                              Category
                            </th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                              Price
                            </th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                              Action
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach var="product" items="${products}">
                            <tr class="align-middle">
                              <!-- ID -->
                              <td class="text-center">
                                <h6 class="mb-0 text-sm">${product.id}</h6>
                              </td>

                              <!-- Name -->
                              <td style="min-width: 220px;">
                                <p class="text-sm font-weight-bold mb-0">${product.name}</p>
                              </td>

                              <!-- Category -->
                              <td style="min-width: 250px;">
                                <span class="text-xs font-weight-bold">${product.category.name}</span>
                              </td>

                              <!-- Price -->
                              <td style="min-width: 180px;">
                                <p class="text-sm font-weight-bold mb-0">${product.price}</p>
                              </td>

                              <!-- Action -->
                              <td class="text-center">
                                <!-- View Detail-->
                                <a href="javascript:void(0);" class="btn btn-sm btn-info border-0"
                                  data-bs-toggle="modal" data-bs-target="#detailModal${product.id}">
                                  <i class="bi bi-card-text fs-5"></i>
                                </a>

                                <!-- Modal View Detail -->
                                <c:set var="product" value="${product}" scope="request" />
                                <jsp:include page="../product/detail.jsp" />


                                <!-- Edit -->
                                <a href="/admin/product/update/${product.id}" class="btn btn-sm btn-primary border-0">
                                  <i class="bi bi-pencil-square fs-5"></i>
                                </a>

                                <!-- Delete (modal trigger) -->
                                <button type="button" class="btn btn-sm btn-danger border-0" data-bs-toggle="modal"
                                  data-bs-target="#deleteModal${product.id}" title="Delete">
                                  <i class="bi bi-trash fs-5"></i>
                                </button>

                                <!-- Modal Delete -->
                                <div class="modal fade" id="deleteModal${product.id}" tabindex="-1"
                                  aria-labelledby="deleteModalLabel${product.id}" aria-hidden="true">
                                  <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border-0 shadow-lg">

                                      <!-- Header -->
                                      <div class="modal-header bg-gradient-primary text-white">
                                        <h5 class="modal-title" id="deleteModalLabel${product.id}">
                                          Confirm Delete
                                        </h5>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                          aria-label="Close"></button>
                                      </div>

                                      <!-- Body -->
                                      <div class="modal-body text-center py-4">
                                        <p class="mb-2">Are you sure you want to delete:</p>
                                        <h6 class="text-danger fw-bold mb-0">${product.name}</h6>
                                      </div>

                                      <!-- Footer -->
                                      <div class="modal-footer justify-content-center border-0 pb-4">
                                        <form method="post" action="/admin/product/delete/${product.id}">
                                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                          <input type="hidden" name="id" value="${product.id}">
                                          <input type="hidden" name="image" value="${user.image}">
                                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

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

                      <!-- ------------------Phân trang----------------------------- -->
                      <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                          <li class="page-item">
                            <a class="${ 1 eq currentPage ? 'disabled page-link' : 'page-link' }"
                              href="/admin/product?page=${currentPage-1}" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <!-- -----------forEach này chia số sản phẩm cho mỗi trang---------- -->
                          <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                            <li class="page-item">
                              <a class="${ loop.index eq currentPage ? 'active page-link' : 'page-link' }"
                                href="/admin/product?page=${loop.index}">
                                ${loop.index}
                              </a>
                            </li>
                          </c:forEach>
                          <li class="page-item">
                            <a class="${ totalPage eq currentPage ? 'disabled page-link' : 'page-link' }"
                              href="/admin/product?page=${currentPage+1}" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                      </nav>

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

        </script>



      </body>

      </html>