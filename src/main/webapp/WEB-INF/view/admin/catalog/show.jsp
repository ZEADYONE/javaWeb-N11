<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <link id="pagestyle" href="/admin/css/form-input.css" rel="stylesheet" />
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <link rel="apple-touch-icon" sizes="76x76" href="/admin/img/apple-icon.png">
                <link rel="icon" type="image/png" href="/admin/img/favicon.png">
                <title>Catalog Management</title>
                <!-- Fonts and icons -->
                <link rel="stylesheet" type="text/css"
                    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
                <link href="/admin/css/nucleo-icons.css" rel="stylesheet" />
                <link href="/admin/css/nucleo-svg.css" rel="stylesheet" />
                <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
                <link id="pagestyle" href="/admin/css/material-dashboard.css" rel="stylesheet" />
            </head>

            <body class="g-sidenav-show bg-gray-200">
                <aside
                    class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark"
                    id="sidenav-main">
                    <jsp:include page="../layout/sidebar.jsp" />
                </aside>

                <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
                    <div class="container-fluid py-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="card my-4">
                                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                        <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                                            <h6 class="text-white text-capitalize ps-3">Manager Catalog</h6>
                                        </div>
                                    </div>

                                    <div class="card-body px-3 pb-3">
                                        <div class="accordion" id="catalogAccordion">

                                            <!-- CATEGORY -->
                                            <div class="accordion-item border mb-3 shadow-sm">
                                                <h2 class="accordion-header" id="headingCategory">
                                                    <button class="accordion-button" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#collapseCategory"
                                                        aria-expanded="true" aria-controls="collapseCategory">
                                                        <i class="ni ni-tag text-info me-2"></i>Category List
                                                    </button>
                                                </h2>
                                                <div id="collapseCategory" class="accordion-collapse collapse show"
                                                    aria-labelledby="headingCategory"
                                                    data-bs-parent="#catalogAccordion">
                                                    <div class="accordion-body">
                                                        <table class="table align-items-center mb-0">
                                                            <thead class="bg-light">
                                                                <tr>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                                                        ID</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                                        Name</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                                        Code</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                                                        Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="cate" items="${categories}">
                                                                    <tr>
                                                                        <td class="text-center">${cate.id}</td>
                                                                        <td>${cate.name}</td>
                                                                        <td>${cate.code}</td>
                                                                        <td class="text-center">
                                                                            <button class="btn btn-sm btn-danger"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#deleteCategoryModal${cate.id}">
                                                                                <i class="bi bi-trash fs-5"></i>
                                                                            </button>

                                                                            <!-- Modal xác nhận xóa Category -->
                                                                            <div class="modal fade"
                                                                                id="deleteCategoryModal${cate.id}"
                                                                                tabindex="-1" aria-hidden="true">
                                                                                <div
                                                                                    class="modal-dialog modal-dialog-centered">
                                                                                    <div
                                                                                        class="modal-content border-0 shadow-lg">
                                                                                        <div
                                                                                            class="modal-header bg-gradient-primary text-white ">
                                                                                            <h5 class="modal-title">
                                                                                                Confirm Delete</h5>
                                                                                            <button type="button"
                                                                                                class="btn-close btn-close-white"
                                                                                                data-bs-dismiss="modal"></button>
                                                                                        </div>
                                                                                        <div
                                                                                            class="modal-body text-center py-4">
                                                                                            <p class="mb-2">Are you sure
                                                                                                you want to delete:</p>
                                                                                            <h6 class="text-danger
                                                                                                fw-bold mb-0">
                                                                                                ${cate.name}</h6>
                                                                                        </div>
                                                                                        <div
                                                                                            class="modal-footer justify-content-center border-0 pb-4">
                                                                                            <form method="post"
                                                                                                action="/admin/catalog/category/delete">
                                                                                                <input type="hidden"
                                                                                                    name="${_csrf.parameterName}"
                                                                                                    value="${_csrf.token}">
                                                                                                <input type="hidden"
                                                                                                    name="id"
                                                                                                    value="${cate.id}">
                                                                                                <input type="hidden"
                                                                                                    name="${_csrf.parameterName}"
                                                                                                    value="${_csrf.token}" />

                                                                                                <button type="button"
                                                                                                    class="btn btn-secondary me-2"
                                                                                                    data-bs-dismiss="modal">
                                                                                                    Cancel
                                                                                                </button>
                                                                                                <button type="submit"
                                                                                                    class="btn text-white"
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

                                                        <!-- Nút mở modal thêm mới -->
                                                        <button class="btn btn-sm btn-primary mt-3"
                                                            data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                                                            <i class="ni ni-fat-add"></i> Add Category
                                                        </button>

                                                        <!-- Modal thêm Category -->
                                                        <div class="modal fade" id="addCategoryModal" tabindex="-1"
                                                            aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content border-0 shadow-lg">
                                                                    <div
                                                                        class="modal-header bg-gradient-primary text-white">
                                                                        <h5 class="modal-title">Add New
                                                                            Category</h5>
                                                                        <button type="button"
                                                                            class="btn-close btn-close-white"
                                                                            data-bs-dismiss="modal"></button>
                                                                    </div>

                                                                    <form action="/admin/catalog/category/create"
                                                                        method="post">
                                                                        <div class="modal-body">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Category
                                                                                    Name</label>
                                                                                <input type="text"
                                                                                    class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    path="name" required>
                                                                            </div>
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Code</label>
                                                                                <input type="text"
                                                                                    class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    path="code" required>
                                                                            </div>
                                                                            <div class="text-end">
                                                                                <button type="submit"
                                                                                    class="btn btn-primary">Create</button>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>




                                            <!-- BRAND -->
                                            <div class="accordion-item border shadow-sm">
                                                <h2 class="accordion-header" id="headingBrand">
                                                    <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#collapseBrand"
                                                        aria-expanded="false" aria-controls="collapseBrand">
                                                        <i class="ni ni-badge text-success me-2"></i> Brand List
                                                    </button>
                                                </h2>
                                                <div id="collapseBrand" class="accordion-collapse collapse"
                                                    aria-labelledby="headingBrand" data-bs-parent="#catalogAccordion">
                                                    <div class="accordion-body">
                                                        <table class="table align-items-center mb-0">
                                                            <thead class="bg-light">
                                                                <tr>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                                                        ID</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                                        Name</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                                                        Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="brand" items="${brands}"
                                                                    varStatus="loop">

                                                                    <tr>
                                                                        <td class="text-center">${brand.id}</td>
                                                                        <td style="min-width: 180px;">${brand.name}</td>
                                                                        <td class="text-center">
                                                                            <button class="btn btn-sm btn-danger"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#deleteBrandModal${brand.id}">
                                                                                <i class="bi bi-trash fs-5"></i>
                                                                            </button>

                                                                            <!-- Modal xác nhận xóa Brand -->
                                                                            <div class="modal fade"
                                                                                id="deleteBrandModal${brand.id}"
                                                                                tabindex="-1" aria-hidden="true">
                                                                                <div
                                                                                    class="modal-dialog modal-dialog-centered">
                                                                                    <div
                                                                                        class="modal-content border-0 shadow-lg">
                                                                                        <div
                                                                                            class="modal-header bg-gradient-primary text-white ">
                                                                                            <h5 class="modal-title">
                                                                                                Confirm Delete</h5>
                                                                                            <button type="button"
                                                                                                class="btn-close btn-close-white"
                                                                                                data-bs-dismiss="modal"></button>
                                                                                        </div>
                                                                                        <div
                                                                                            class="modal-body text-center py-4">
                                                                                            <p class="mb-2">Are you sure
                                                                                                you want to delete:</p>
                                                                                            <h6 class="text-danger
                                                                                                fw-bold mb-0">
                                                                                                ${brand.name}</h6>
                                                                                        </div>
                                                                                        <div
                                                                                            class="modal-footer justify-content-center border-0 pb-4">
                                                                                            <form method="post"
                                                                                                action="/admin/catalog/brand/delete">
                                                                                                <input type="hidden"
                                                                                                    name="${_csrf.parameterName}"
                                                                                                    value="${_csrf.token}">
                                                                                                <input type="hidden"
                                                                                                    name="id"
                                                                                                    value="${brand.id}">
                                                                                                <input type="hidden"
                                                                                                    name="${_csrf.parameterName}"
                                                                                                    value="${_csrf.token}" />

                                                                                                <button type="button"
                                                                                                    class="btn btn-secondary me-2"
                                                                                                    data-bs-dismiss="modal">
                                                                                                    Cancel
                                                                                                </button>
                                                                                                <button type="submit"
                                                                                                    class="btn text-white"
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
                                                        <!-- Nút mở modal thêm mới -->
                                                        <button class="btn btn-sm btn-primary mt-3"
                                                            data-bs-toggle="modal" data-bs-target="#addBrandModal">
                                                            <i class="ni ni-fat-add"></i> Add Category
                                                        </button>

                                                        <!-- Modal thêm Brand -->
                                                        <div class="modal fade" id="addBrandModal" tabindex="-1"
                                                            aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content border-0 shadow-lg">
                                                                    <div
                                                                        class="modal-header bg-gradient-primary text-white">
                                                                        <h5 class="modal-title">Add New
                                                                            Brand</h5>
                                                                        <button type="button"
                                                                            class="btn-close btn-close-white"
                                                                            data-bs-dismiss="modal"></button>
                                                                    </div>

                                                                    <form action="/admin/catalog/brand/create"
                                                                        method="post">
                                                                        <div class="modal-body">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Brand
                                                                                    Name</label>
                                                                                <input type="text"
                                                                                    class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    path="name" required>
                                                                            </div>
                                                                            <div class="text-end">
                                                                                <button type="submit"
                                                                                    class="btn btn-primary">Create</button>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div> <!-- end accordion -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </main>


                <!-- Core JS Files -->
                <script src="/admin/js/core/popper.min.js"></script>
                <script src="/admin/js/core/bootstrap.min.js"></script>
                <script src="/admin/js/plugins/perfect-scrollbar.min.js"></script>
                <script src="/admin/js/plugins/smooth-scrollbar.min.js"></script>
                <script>
                    var win = navigator.platform.indexOf('Win') > -1;
                    if (win && document.querySelector('#sidenav-scrollbar')) {
                        Scrollbar.init(document.querySelector('#sidenav-scrollbar'), { damping: '0.5' });
                    }
                </script>
            </body>

            </html>