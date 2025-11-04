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
                                                                        <td class="text-center">
                                                                            <h6 class="mb-0 text-sm">${cate.id}</h6>
                                                                        </td>
                                                                        <td>
                                                                            <p class="text-sm font-weight-bold mb-0">
                                                                                ${cate.name}</p>
                                                                        </td>
                                                                        <td> <span
                                                                                class="text-xs font-weight-bold">${cate.code}</span>
                                                                        </td>
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
                                                            Add Category
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

                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />



                                                                        <div class="modal-body">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Category
                                                                                    Name</label>
                                                                                <input type="text"
                                                                                    class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    name="name" required>
                                                                            </div>
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Code</label>
                                                                                <input type="text"
                                                                                    class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    name="code" required>
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
                                                                        <td class="text-center">
                                                                            <h6 class="mb-0 text-sm">${brand.id}</h6>
                                                                        </td>
                                                                        <td style="min-width: 180px;">
                                                                            <p class="text-sm font-weight-bold mb-0">
                                                                                ${brand.name}</p>
                                                                        </td>
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
                                                            Add Brand
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

                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />

                                                                        <div class="modal-body">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Brand
                                                                                    Name</label>
                                                                                <input type="text"
                                                                                    class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    name="name" required>
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

                                            <!-- VOUCHER -->
                                            <div class="accordion-item border shadow-sm">
                                                <h2 class="accordion-header" id="headingVoucher">
                                                    <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#collapseVoucher"
                                                        aria-expanded="false" aria-controls="collapseVoucher">
                                                        <i class="ni ni-credit-card text-warning me-2"></i> Voucher List
                                                    </button>
                                                </h2>

                                                <div id="collapseVoucher" class="accordion-collapse collapse"
                                                    aria-labelledby="headingVoucher" data-bs-parent="#catalogAccordion">
                                                    <div class="accordion-body">

                                                        <table class="table align-items-center mb-0">
                                                            <thead class="bg-light">
                                                                <tr>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                                                        ID</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                                        Code</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                                        Type</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                                        Value</th>
                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                                        Description
                                                                    </th>

                                                                    <th
                                                                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                                                        Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="voucher" items="${vouchers}">
                                                                    <tr>
                                                                        <td class="text-center">
                                                                            <h6 class="mb-0 text-sm">${voucher.id}</h6>
                                                                        </td>
                                                                        <td>
                                                                            <p class="text-sm font-weight-bold mb-0">
                                                                                ${voucher.code}</p>
                                                                        </td>

                                                                        <!-- Voucher Type -->
                                                                        <td>
                                                                            <span class="text-sm">
                                                                                <c:choose>
                                                                                    <c:when
                                                                                        test="${v.type == 'PERCENT'}">%
                                                                                    </c:when>
                                                                                    <c:otherwise>Amount</c:otherwise>
                                                                                </c:choose>
                                                                            </span>
                                                                        </td>

                                                                        <!-- Voucher Value -->
                                                                        <td>
                                                                            <span class="text-xs font-weight-bold">
                                                                                <c:choose>
                                                                                    <c:when
                                                                                        test="${v.type == 'PERCENT'}">
                                                                                        ${v.value}%</c:when>
                                                                                    <c:otherwise>${v.value} ₫
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </span>
                                                                        </td>

                                                                        <td>
                                                                            <span
                                                                                class="text-sm">${voucher.description}</span>
                                                                        </td>

                                                                        <!-- toggle -->
                                                                        <td class="text-center">
                                                                            <form method="post"
                                                                                action="/admin/catalog/voucher/toggle"
                                                                                style="display:inline;">
                                                                                <input type="hidden"
                                                                                    name="${_csrf.parameterName}"
                                                                                    value="${_csrf.token}">
                                                                                <input type="hidden" name="id"
                                                                                    value="${v.id}">

                                                                                <c:choose>

                                                                                    <c:when test="${v.status}">
                                                                                        <button type="submit"
                                                                                            class="btn btn-sm btn-success">
                                                                                            <i
                                                                                                class="bi bi-toggle-on fs-5"></i>
                                                                                        </button>
                                                                                    </c:when>

                                                                                    <c:otherwise>
                                                                                        <button type="submit"
                                                                                            class="btn btn-sm btn-secondary">
                                                                                            <i
                                                                                                class="bi bi-toggle-off fs-5"></i>
                                                                                        </button>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </form>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>


                                                        <button class="btn btn-sm btn-primary mt-3"
                                                            data-bs-toggle="modal" data-bs-target="#addVoucherModal">
                                                            Add Voucher
                                                        </button>


                                                        <div class="modal fade" id="addVoucherModal" tabindex="-1">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content border-0 shadow-lg">
                                                                    <div
                                                                        class="modal-header bg-gradient-primary text-white">
                                                                        <h5 class="modal-title">Add New Voucher</h5>
                                                                        <button type="button"
                                                                            class="btn-close btn-close-white"
                                                                            data-bs-dismiss="modal"></button>
                                                                    </div>

                                                                    <form action="/admin/catalog/voucher/create"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />

                                                                        <div class="modal-body">

                                                                            <div class="mb-3">
                                                                                <label class="form-label">Voucher
                                                                                    Code</label>
                                                                                <input type="text"
                                                                                    class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    name="code" required>
                                                                            </div>


                                                                            <div class="mb-3">
                                                                                <label class="form-label">Type</label>
                                                                                <select class="form-select" name="type"
                                                                                    style="padding-left: 20px;"
                                                                                    id="voucherType" required>
                                                                                    <option value="PERCENT">Percent (%)
                                                                                    </option>
                                                                                    <option value="AMOUNT">Fixed Amount
                                                                                        (₫)</option>
                                                                                </select>
                                                                            </div>

                                                                            <div class="mb-3">
                                                                                <label class="form-label"
                                                                                    id="valueLabel">Discount Value
                                                                                    (%)</label>
                                                                                <input type="number"
                                                                                    class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    id="voucherValue" name="value"
                                                                                    required min="1" max="100"
                                                                                    placeholder="Enter percent (1 - 100)">

                                                                            </div>
                                                                            <div class="mb-3">
                                                                                <label
                                                                                    class="form-label">Description</label>
                                                                                <textarea class="form-control border"
                                                                                    style="padding-left: 20px;"
                                                                                    name="description"
                                                                                    rows="2"></textarea>
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
                <script>
                    document.getElementById("voucherType").addEventListener("change", function () {
                        const type = this.value;
                        const valueInput = document.getElementById("voucherValue");
                        const label = document.getElementById("valueLabel");
                        const help = document.getElementById("valueHelp");

                        if (type === "PERCENT") {
                            valueInput.min = 1;
                            valueInput.max = 100;
                            valueInput.placeholder = "Enter percent (1 - 100)";

                        } else {
                            valueInput.removeAttribute("max");
                            valueInput.placeholder = "Enter amount";

                        }
                    });
                </script>
            </body>

            </html>