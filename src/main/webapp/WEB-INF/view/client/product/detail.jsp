<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <fmt:setLocale value="vi_VN" />
            <fmt:setBundle basename="messages" />

            <!-- Start Header Area -->
            <jsp:include page="../layout/header.jsp" />
            <!-- End Header Area -->

            <!-- Start Banner Area -->
            <section class="banner-area organic-breadcrumb">
                <div class="container">
                    <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                        <div class="col-first">
                            <h1>Product Details Page</h1>
                            <nav class="d-flex align-items-center">
                                <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                                <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                                <a href="single-product.html">product-details</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Banner Area -->

            <!--================Single Product Area =================-->
            <div class="product_image_area" style="padding-bottom: 120px;">
                <div class="container">
                    <div class="row s_product_inner">
                        <div class="col-lg-6">
                            <div class="s_Product_carousel">
                                <div class="single-prd-item">
                                    <img class="img-fluid" src="/images/product/${product.image}" alt="">
                                </div>
                                <div class="single-prd-item">
                                    <img class="img-fluid" src="/images/product/${product.image}" alt="">
                                </div>
                                <div class="single-prd-item">
                                    <img class="img-fluid" src="/images/product/${product.image}" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 offset-lg-1">
                            <div class="s_product_text">
                                <h3>${product.name}</h3>
                                <fmt:formatNumber value="${product.price}" type="currency" />
                                <ul class="list">
                                    <li><span>Category</span> : ${product.category.name}s</li>
                                    <li><a href="#"><span>Availibility</span> : ${product.stockQuantity}</a></li>
                                </ul>
                                <p>${product.description}</p>
                                <form action="/products/add-product-to-cart/${product.id}" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                    <div class="product_count">
                                        <label for="sst">Quantity:</label>
                                        <input type="number" name="quantity" id="sst" min="1" value="1"
                                            title="Quantity:" class="input-text qty" readonly>

                                        <button type="button" class="increase items-count">
                                            <i class="lnr lnr-chevron-up"></i>
                                        </button>

                                        <button type="button" class="reduced items-count">
                                            <i class="lnr lnr-chevron-down"></i>
                                        </button>
                                    </div>

                                    <div class="card_area d-flex align-items-center">
                                        <a class="primary-btn" href="#"
                                            onclick="this.closest('form').submit(); return false;">
                                            Add to Cart
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!--================End Single Product Area =================-->


            <!-- start footer Area -->
            <jsp:include page="../layout/footer.jsp" />
            <!-- End footer Area -->