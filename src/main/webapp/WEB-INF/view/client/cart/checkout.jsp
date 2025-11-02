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
                            <h1>Checkout</h1>
                            <nav class="d-flex align-items-center">
                                <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                                <a href="single-product.html">Checkout</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Banner Area -->

            <!--================Checkout Area =================-->
            <section class="checkout_area section_gap">
                <div class="container">
                    <div class="billing_details">
                        <div class="row">
                            <div class="col-lg-7">
                                <h3>Billing Details</h3>
                                <form class="row contact_form" action="#" method="post" novalidate="novalidate">

                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="first" name="name">
                                        <span class="placeholder" data-placeholder="Name"></span>
                                    </div>

                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="number" name="number">
                                        <span class="placeholder" data-placeholder="Phone number"></span>
                                    </div>

                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="email" name="compemailany">
                                        <span class="placeholder" data-placeholder="Email Address"></span>
                                    </div>

                                    <div class="col-md-12 form-group p_star">
                                        <textarea class="form-control" name="message" id="message" rows="1"
                                            placeholder="Address line 01"></textarea>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="creat_account">
                                            <h3>Shipping Details</h3>
                                        </div>
                                        <textarea class="form-control" name="message" id="message" rows="1"
                                            placeholder="Order Notes"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-5">
                                <div class="order_box">
                                    <h2>Your Order</h2>
                                    <ul class="list">
                                        <li><a href="#">Product <span>Total</span></a></li>
                                        <c:forEach var="item" items="${items}">
                                            <li><a>${item.product.name} x ${item.quantity}
                                                    <span class="last">
                                                        <fmt:formatNumber value="${item.product.price * item.quantity}"
                                                            type="currency" />
                                                    </span></a>
                                            </li>
                                        </c:forEach>


                                        <!--
                                        <li><a href="#">Fresh Tomatoes <span class="middle">x 02</span> <span
                                                    class="last">$720.00</span></a></li>
                                        <li><a href="#">Fresh Brocoli <span class="middle">x 02</span> <span
                                                    class="last">$720.00</span></a></li> -->
                                    </ul>

                                    <ul class="list list_2">
                                        <li><a>Subtotal <span>
                                                    <fmt:formatNumber value="${totalPrice}" type="currency" />
                                                </span></a></li>
                                        <li><a>Shipping <span>
                                                    <fmt:formatNumber value="30000" type="currency" />
                                                </span></a></li>
                                        <li><a>Total <span>
                                                    <fmt:formatNumber value="${totalPrice + 30000}" type="currency" />
                                                </span></a></li>
                                    </ul>
                                    <div class="payment_item">
                                        <div class="radion_btn">
                                            <input type="radio" id="pay_cash" name="payment_method">
                                            <label for="pay_cash">Check payments</label>
                                            <div class="check"></div>
                                        </div>
                                        <p>Please send a check to Store Name, Store Street, Store Town, Store State /
                                            County, Store Postcode.</p>
                                    </div>

                                    <div class="payment_item">
                                        <div class="radion_btn">
                                            <input type="radio" id="pay_paypal" name="payment_method">
                                            <label for="pay_paypal">Paypal</label>
                                            <img src="img/product/card.jpg" alt="">
                                            <div class="check"></div>
                                        </div>
                                        <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal
                                            account.</p>
                                    </div>

                                    <div class="creat_account">
                                        <input type="checkbox" id="terms">
                                        <label for="terms">I’ve read and accept the </label>
                                        <a href="#">terms & conditions*</a>
                                    </div>

                                    <!-- Buttons -->
                                    <a class="primary-btn" id="btn-paypal" style="display:none;" href="#">Proceed to
                                        Paypal</a>
                                    <a class="primary-btn" id="btn-cash" style="display:none;" href="/cart/confirmation">Proceed to Cash
                                        Payment</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--================End Checkout Area =================-->
            <script>
                const paypalRadio = document.getElementById("pay_paypal");
                const cashRadio = document.getElementById("pay_cash");
                const btnPaypal = document.getElementById("btn-paypal");
                const btnCash = document.getElementById("btn-cash");

                paypalRadio.addEventListener("change", function () {
                    btnPaypal.style.display = "inline-block";
                    btnCash.style.display = "none";
                });

                cashRadio.addEventListener("change", function () {
                    btnCash.style.display = "inline-block";
                    btnPaypal.style.display = "none";
                });
            </script>
            <!-- start footer Area -->
            <jsp:include page="../layout/footer.jsp" />
            <!-- End footer Area -->