<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <fmt:setLocale value="vi_VN" />
        <fmt:setBundle basename="messages" />

        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
          <link rel="apple-touch-icon" sizes="76x76" href="/admin/img/apple-icon.png">
          <link rel="icon" type="image/png" href="/admin/img/favicon.png">
          <title>
            Manage Product Serials
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
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
                        <h6 class="text-white text-capitalize ps-3">Manager Serials for Product: ${product.name} (ID: ${product.id})</h6>
                      </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                      <a href="/admin/product" type="button" class="btn btn-secondary"
                        style="margin: 20px 0 0 30px;"><i class="bi bi-arrow-left"></i> Back to Products</a>
                      
                      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal"
                        style="background-color: #ffba00; margin: 20px 30px 0 0;"><i class="bi bi-plus-circle"></i> Add Serial</button>
                    </div>

                    <div class="card-body px-0 pb-2">
                      
                      <c:if test="${not empty error}">
                          <div class="alert alert-danger mx-4 text-white" role="alert">
                              ${error}
                          </div>
                      </c:if>

                      <div class="table-responsive p-0">
                        <table class="table align-items-center mb-0">
                          <thead class="bg-light">
                            <tr>
                              <th
                                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                ID
                              </th>
                              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                Serial Code / IMEI
                              </th>
                              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                Status
                              </th>
                              <th
                                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                Action
                              </th>
                            </tr>
                          </thead>

                          <tbody>
                            <c:forEach var="item" items="${items}">
                              <tr class="align-middle">
                                <td class="text-center">
                                  <h6 class="mb-0 text-sm">${item.id}</h6>
                                </td>

                                <td style="min-width: 250px;">
                                  <p class="text-sm font-weight-bold mb-0">${item.serialCode}</p>
                                </td>

                                <td style="min-width: 180px;">
                                  <span class="badge ${item.status == 'Có sẵn' ? 'bg-success' : (item.status == 'Đã bán' ? 'bg-secondary' : 'bg-danger')}">
                                    ${item.status}
                                  </span>
                                </td>

                                <td class="text-center">
                                  <!-- Edit -->
                                  <a href="javascript:void(0);" class="btn btn-sm btn-primary border-0"
                                    data-bs-toggle="modal" data-bs-target="#editModal${item.id}">
                                    <i class="bi bi-pencil-square fs-5"></i>
                                  </a>

                                  <!-- Delete -->
                                  <form method="post" action="/admin/product/${product.id}/items/delete/${item.id}"
                                    style="display:inline;" onsubmit="return confirm('Bạn có chắc chắn muốn xóa Serial này?');">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <button type="submit" class="btn btn-sm btn-danger" title="Xóa Serial">
                                      <i class="bi bi-trash fs-5"></i>
                                    </button>
                                  </form>

                                  <!-- Edit Modal -->
                                  <div class="modal fade" id="editModal${item.id}" tabindex="-1" aria-labelledby="editModalLabel${item.id}" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="editModalLabel${item.id}">Chỉnh sửa Serial</h5>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/admin/product/${product.id}/items/update" method="POST">
                                            <div class="modal-body text-start">
                                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                              <input type="hidden" name="itemId" value="${item.id}">
                                              
                                              <div class="mb-3">
                                                <label for="serialCode" class="form-label">Mã Serial / IMEI</label>
                                                <input type="text" class="form-control border px-2" name="serialCode" value="${item.serialCode}" required>
                                              </div>
                                              
                                              <div class="mb-3">
                                                <label for="status" class="form-label">Trạng thái</label>
                                                <select class="form-select border px-2" name="status" required>
                                                    <option value="Có sẵn" ${item.status == 'Có sẵn' ? 'selected' : ''}>Có sẵn</option>
                                                    <option value="Đã bán" ${item.status == 'Đã bán' ? 'selected' : ''}>Đã bán</option>
                                                    <option value="Lỗi" ${item.status == 'Lỗi' ? 'selected' : ''}>Lỗi</option>
                                                </select>
                                              </div>
                                            </div>
                                            <div class="modal-footer">
                                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                              <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                            </div>
                                        </form>
                                      </div>
                                    </div>
                                  </div>

                                </td>
                              </tr>
                            </c:forEach>
                            <c:if test="${empty items}">
                                <tr>
                                    <td colspan="4" class="text-center py-4">Chưa có Serial nào cho sản phẩm này.</td>
                                </tr>
                            </c:if>
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

          <!-- Add Modal -->
          <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header bg-gradient-primary">
                  <h5 class="modal-title text-white" id="addModalLabel">Thêm mới Serial</h5>
                  <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form:form action="/admin/product/${product.id}/items/create" method="POST" modelAttribute="newItem">
                    <div class="modal-body text-start">
                      
                      <div class="mb-3">
                        <label for="serialCode" class="form-label fw-bold">Mã Serial / IMEI</label>
                        <form:input path="serialCode" class="form-control border px-2" required="required" placeholder="Nhập mã Serial" />
                      </div>
                      
                      <div class="mb-3">
                        <label for="status" class="form-label fw-bold">Trạng thái</label>
                        <form:select path="status" class="form-select border px-2" required="required">
                            <form:option value="Có sẵn">Có sẵn</form:option>
                            <form:option value="Đã bán">Đã bán</form:option>
                            <form:option value="Lỗi">Lỗi</form:option>
                        </form:select>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                      <button type="submit" class="btn btn-primary">Thêm mới</button>
                    </div>
                </form:form>
              </div>
            </div>
          </div>

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
        </body>

        </html>
