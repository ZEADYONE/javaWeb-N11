<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!-- Start Header Area -->
            <jsp:include page="../layout/header.jsp" />
            <!-- End Header Area -->
            <style>
                .pagination .page-link {
                    color: #ffba00;
                    border-color: #ffba00;
                }

                .pagination .page-item.active .page-link {
                    background-color: linear-gradient(90deg, #ffba00 0%, #ff6c00 100%);

                    color: #fff;
                    border-color: #ffba00;
                }
            </style>

            <!-- Start Banner Area -->
            <section class="banner-area organic-breadcrumb">
                <div class="container">
                    <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                        <div class="col-first">
                            <h1>Shop Category page</h1>
                            <nav class="d-flex align-items-center">
                                <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                                <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                                <a href="category.html">Fashon Category</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Banner Area -->
            <div class="container">
                <div class="row" style="margin-bottom: 100px; margin-top: 100px;">
                    <div class="col-xl-3 col-lg-4 col-md-5">
                        <div class="sidebar-categories">
                            <div class="head">Browse Categories</div>
                            <ul class="main-categories">
                                <c:forEach var="category" items="${categories}">
                                    <li class="filter-list">
                                        <input class="pixel-radio" type="radio" id="category-${category.id}"
                                            name="category" value="${category.id}">
                                        <label for="category-${category.id}">${category.name}</label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="sidebar-filter mt-50">
                            <div class="top-filter-head">Product Filters</div>
                            <div class="common-filter">
                                <div class="head">Brands</div>
                                <form action="#">
                                    <ul>
                                        <c:forEach var="brand" items="${brands}">
                                            <li class="filter-list">
                                                <input class="pixel-radio" type="radio" id="brand-${brand.id}"
                                                    name="brand" value="${brand.id}">
                                                <label for="brand-${brand.id}">${brand.name}</label>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-9 col-lg-8 col-md-7">
                        <!-- Start Filter Bar -->

                        <div class="filter-bar d-flex flex-wrap align-items-center justify-content-end">
                            <!-- ------------------Phân trang----------------------------- -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="${1 eq currentPage ? 'page-item disabled' : 'page-item'}">
                                        <a class="page-link" href="/products?page=${currentPage - 1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <!-- Hiển thị chỉ vài số quanh trang hiện tại -->
                                    <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                        <c:if test="${loop.index >= currentPage - 2 && loop.index <= currentPage + 2}">
                                            <li class="page-item">
                                                <a class="${loop.index eq currentPage ? 'active page-link' : 'page-link'}"
                                                    href="/products?page=${loop.index}">
                                                    ${loop.index}
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:forEach>

                                    <li class="${totalPage eq currentPage ? 'page-item disabled' : 'page-item'}">
                                        <a class="page-link" href="/products?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                        <!-- End Filter Bar -->
                        <!-- Start Best Seller -->
                        <section class="lattest-product-area pb-40 category-list">
                            <div class="row">
                                <!-- single product -->
                                <c:forEach var="product" items="${products}">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="single-product">
                                            <img class="img-fluid" src="/images/product/${product.image}" alt="">
                                            <div class="product-details">
                                                <a href="/products/${product.id}">
                                                    <h6>${product.name}</h6>
                                                </a>
                                                <div class="price">
                                                    <h6>${product.price}</h6>
                                                </div>
                                                <div class="prd-bottom">
                                                    <form action="/products/add-product-to-cart/${product.id}" method="post"
                                                        class="d-inline">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <a href="#" class="social-info"
                                                            onclick="this.closest('form').submit(); return false;">
                                                            <span class="ti-bag"></span>
                                                            <p class="hover-text">add to bag</p>
                                                        </a>
                                                    </form>


                                                    <a href="" class="social-info">
                                                        <span class="lnr lnr-move"></span>
                                                        <p class="hover-text">view more</p>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </section>
                        <!-- End Best Seller -->
                        <!-- Start Filter Bar -->
                        <div class="filter-bar d-flex flex-wrap align-items-center justify-content-end">
                            <!-- ------------------Phân trang----------------------------- -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="${1 eq currentPage ? 'page-item disabled' : 'page-item'}">
                                        <a class="page-link" href="/products?page=${currentPage - 1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <!-- Hiển thị chỉ vài số quanh trang hiện tại -->
                                    <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                        <c:if test="${loop.index >= currentPage - 2 && loop.index <= currentPage + 2}">
                                            <li class="page-item">
                                                <a class="${loop.index eq currentPage ? 'active page-link' : 'page-link'}"
                                                    href="/products?page=${loop.index}">
                                                    ${loop.index}
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:forEach>

                                    <li class="${totalPage eq currentPage ? 'page-item disabled' : 'page-item'}">
                                        <a class="page-link" href="/products?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                        <!-- End Filter Bar -->
                    </div>
                </div>
            </div>


            <!-- start footer Area -->
            <jsp:include page="../layout/footer.jsp" />
            <!-- End footer Area -->