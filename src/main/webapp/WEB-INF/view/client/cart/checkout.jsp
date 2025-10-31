<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <fmt:setLocale value="vi_VN" />



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
                            <div class="col-lg-8">
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
                            <div class="col-lg-4">
                                <div class="order_box">
                                    <h2>Your Order</h2>
                                    <ul class="list">
                                        <li><a href="#">Product <span>Total</span></a></li>
                                        <li><a href="#">Fresh Blackberry <span class="middle">x 02</span> <span
                                                    class="last">$720.00</span></a></li>
                                        <li><a href="#">Fresh Tomatoes <span class="middle">x 02</span> <span
                                                    class="last">$720.00</span></a></li>
                                        <li><a href="#">Fresh Brocoli <span class="middle">x 02</span> <span
                                                    class="last">$720.00</span></a></li>
                                    </ul>
                                    <ul class="list list_2">
                                        <li><a href="#">Subtotal <span>$2160.00</span></a></li>
                                        <li><a href="#">Shipping <span>Flat rate: $50.00</span></a></li>
                                        <li><a href="#">Total <span>$2210.00</span></a></li>
                                    </ul>
                                    <div class="payment_item">
                                        <div class="radion_btn">
                                            <input type="radio" id="f-option5" name="selector">
                                            <label for="f-option5">Check payments</label>
                                            <div class="check"></div>
                                        </div>
                                        <p>Please send a check to Store Name, Store Street, Store Town, Store State /
                                            County,
                                            Store Postcode.</p>
                                    </div>
                                    <div class="payment_item active">
                                        <div class="radion_btn">
                                            <input type="radio" id="f-option6" name="selector">
                                            <label for="f-option6">Paypal </label>
                                            <img src="img/product/card.jpg" alt="">
                                            <div class="check"></div>
                                        </div>
                                        <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal
                                            account.</p>
                                    </div>
                                    <div class="creat_account">
                                        <input type="checkbox" id="f-option4" name="selector">
                                        <label for="f-option4">I’ve read and accept the </label>
                                        <a href="#">terms & conditions*</a>
                                    </div>
                                    <a class="primary-btn" href="#">Proceed to Paypal</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--================End Checkout Area =================-->

            <!-- start footer Area -->
            <jsp:include page="../layout/footer.jsp" />
            <!-- End footer Area -->