<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <fmt:setLocale value="vi_VN" />
            <fmt:setBundle basename="messages" />
            <style>
                .author_img {
                    width: 120px;
                    height: 120px;
                    object-fit: cover;
                    border-radius: 50% !important;
                    display: block;
                    margin: 0 auto 10px auto;
                    /* căn giữa */
                    border: 3px solid #ddd;
                }
            </style>
            <!-- Start Header Area -->
            <jsp:include page="../layout/header.jsp" />
            <!-- End Header Area -->

            <!-- Start Banner Area -->
            <section class="banner-area organic-breadcrumb">
                <div class="container">
                    <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                        <div class="col-first">
                            <h1>Blog Page</h1>
                            <nav class="d-flex align-items-center">
                                <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                                <a href="category.html">Blog</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Banner Area -->

            <!--================Blog Area =================-->
            <section class="blog_area single-post-area section_gap">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="blog_right_sidebar">
                                <!-- <aside class="single_sidebar_widget search_widget">

                                    <div class="br"></div>
                                </aside> -->
                                <aside class="single_sidebar_widget author_widget">
                                    <img class="author_img rounded-circle" src="/images/avatar/${sessionScope.avatar}"
                                        alt="">
                                    <h4>${sessionScope.fullName}</h4>
                                    <div class="br"></div>
                                </aside>
                                <aside class="single_sidebar_widget popular_post_widget">
                                    <h3 class="widget_title">Order</h3>
                                    <div class="media post_item">

                                        <div class="media-body">
                                            <a href="/order">
                                                <h3>Pendding</h3>
                                            </a>

                                        </div>
                                    </div>
                                    <div class="media post_item">
                                        <div class="media-body">
                                            <a href="/order/shipping">
                                                <h3>Shipping</h3>
                                            </a>

                                        </div>
                                    </div>
                                    <div class="media post_item">
                                        <div class="media-body">
                                            <a href="/order/accpect">
                                                <h3>Accpect</h3>
                                            </a>
                                        </div>
                                    </div>
                                    <div class=" media post_item">
                                        <div class="media-body">
                                            <a href="/order/cancel">
                                                <h3>Cancel</h3>
                                            </a>

                                        </div>
                                    </div>
                                    <div class="br"></div>

                            </div>
                            </aside>
                            <aside class="single_sidebar_widget ads_widget">
                                <a href="#"><img class="img-fluid" src="img/blog/add.jpg" alt=""></a>
                                <div class="br"></div>
                            </aside>


                        </div>

                        <div class="col-lg-9 posts-list">
                            <c:forEach var="order" items="${orders}">
                                <div class="order_details_table">
                                    <h2>Order Details</h2>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Product</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${order.orderDetails}">

                                                    <tr>
                                                        <td>
                                                            <p>${item.product.name}</p>
                                                        </td>
                                                        <td>
                                                            <h5>x ${item.quantity}</h5>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <fmt:formatNumber
                                                                    value="${item.product.price * item.quantity}"
                                                                    type="currency" />
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                <tr>
                                                    <td>
                                                        <h4>Subtotal</h4>
                                                    </td>
                                                    <td>
                                                        <h5></h5>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value="${order.totalAmount}"
                                                            type="currency" />
                                                        <p></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h4>Shipping</h4>
                                                    </td>
                                                    <td>
                                                        <h5></h5>
                                                    </td>
                                                    <td>
                                                        <p>
                                                            <fmt:formatNumber value="${order.shipPrice}"
                                                                type="currency" />
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h4>Discount</h4>
                                                    </td>
                                                    <td>
                                                        <h5></h5>
                                                    </td>
                                                    <td>
                                                        <p>
                                                            <fmt:formatNumber value="${order.discountAmount}"
                                                                type="currency" />
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h4>Total</h4>
                                                    </td>
                                                    <td>
                                                        <h5></h5>
                                                    </td>
                                                    <td>
                                                        <p>
                                                            <fmt:formatNumber
                                                                value="${order.totalAmount + order.shipPrice - order.discountAmount}"
                                                                type="currency" />
                                                        </p>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:forEach>



                        </div>

                    </div>
                </div>
            </section>
            <!--================Blog Area =================-->

            <!-- start footer Area -->
            <jsp:include page="../layout/footer.jsp" />
            <!-- End footer Area -->