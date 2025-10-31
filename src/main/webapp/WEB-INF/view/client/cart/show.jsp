<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <fmt:setLocale value="vi_VN" />
            <fmt:setBundle basename="messages" />
            <style>
                td .item-total,
                .cart-total {
                    white-space: nowrap;
                    display: inline-block;
                }
            </style> <!-- Start Header Area -->
            <jsp:include page="../layout/header.jsp" /> <!-- End Header Area --> <!-- Start Banner Area -->
            <section class="banner-area organic-breadcrumb">
                <div class="container">
                    <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                        <div class="col-first">
                            <h1>Shopping Cart</h1>
                            <nav class="d-flex align-items-center"> <a href="index.html">Home<span
                                        class="lnr lnr-arrow-right"></span></a> <a href="category.html">Cart</a> </nav>
                        </div>
                    </div>
                </div>
            </section> <!-- End Banner Area --> <!--================Cart Area =================-->
            <section class="cart_area">
                <div class="container">
                    <div class="cart_inner">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${items}">
                                        <tr>
                                            <td>
                                                <div class="media">
                                                    <div class="d-flex"> <img
                                                            src="/images/product/${item.product.image}" alt=""
                                                            style="width: 80px; height: 80px; object-fit: cover; border-radius: 8px;">
                                                    </div>
                                                    <div class="media-body">
                                                        <p>${item.product.description}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <h5>
                                                    <fmt:formatNumber value="${item.product.price}" /> đ
                                                </h5>
                                            </td>
                                            <td>
                                                <div class="product_count"> <input type="text" name="qty" maxlength="12"
                                                        value="${item.quantity}" title="Quantity:"
                                                        class="input-text qty" data-item-price="${item.product.price}"
                                                        data-item-id="${item.product.id}"> <button class="increase"
                                                        type="button"><i class="lnr lnr-chevron-up"></i></button>
                                                    <button class="reduced" type="button"><i
                                                            class="lnr lnr-chevron-down"></i></button>
                                                </div>
                                            </td>
                                            <td>
                                                <h5 data-item-id="${item.product.id}" class="item-total">
                                                    <fmt:formatNumber value="${item.quantity * item.product.price}"
                                                        type="number" /> đ
                                                </h5>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr class="bottom_button">
                                        <td> <a class="gray_btn" href="#">Update Cart</a> </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <h5>Subtotal</h5>
                                        </td>
                                        <td>
                                            <h5 class="cart-total" data-item-total-price="${totalPrice}">
                                                <fmt:formatNumber value="${totalPrice}" /> đ
                                            </h5>
                                        </td>
                                    </tr>
                                    <tr class="out_button_area">
                                        <td> </td>
                                        <td> </td>
                                        <td> </td>
                                        <td>
                                            <div class="checkout_btn_inner d-flex align-items-center"> <a
                                                    class="primary-btn" href="#">Proceed to checkout</a> </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section> <!--================End Cart Area =================--> <!-- start footer Area -->
            <jsp:include page="../layout/footer.jsp" /> <!-- End footer Area --> giờ tôi muốn có thể update cart