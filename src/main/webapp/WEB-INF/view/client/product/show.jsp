<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!-- Start Header Area -->
            <jsp:include page="../layout/header.jsp" />
            <!-- End Header Area -->

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

                                    <li class="main-nav-list"><a data-toggle="collapse" href="#fruitsVegetable"
                                            aria-expanded="false" aria-controls="fruitsVegetable"><span
                                                class="lnr lnr-arrow-right"></span>${category.name}<span
                                                class="number">(53)</span></a>
                                    </li>

                                    <!-- <li class="main-nav-list"><a data-toggle="collapse" href="#meatFish"
                                            aria-expanded="false" aria-controls="meatFish"><span
                                                class="lnr lnr-arrow-right"></span>Meat and Fish<span
                                                class="number">(53)</span></a>

                                    </li>
                                    <li class="main-nav-list"><a data-toggle="collapse" href="#cooking"
                                            aria-expanded="false" aria-controls="cooking"><span
                                                class="lnr lnr-arrow-right"></span>Cooking<span
                                                class="number">(53)</span></a>

                                    </li>
                                    <li class="main-nav-list"><a data-toggle="collapse" href="#beverages"
                                            aria-expanded="false" aria-controls="beverages"><span
                                                class="lnr lnr-arrow-right"></span>Beverages<span
                                                class="number">(24)</span></a>

                                    </li>
                                    <li class="main-nav-list"><a data-toggle="collapse" href="#homeClean"
                                            aria-expanded="false" aria-controls="homeClean"><span
                                                class="lnr lnr-arrow-right"></span>Home and
                                            Cleaning<span class="number">(53)</span></a>

                                    </li> -->
                                </c:forEach>

                            </ul>
                        </div>
                        <div class="sidebar-filter mt-50">
                            <div class="top-filter-head">Product Filters</div>
                            <div class="common-filter">
                                <div class="head">Brands</div>
                                <form action="#">
                                    <ul>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="apple"
                                                name="brand"><label for="apple">Apple<span>(29)</span></label></li>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="asus"
                                                name="brand"><label for="asus">Asus<span>(29)</span></label></li>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="gionee"
                                                name="brand"><label for="gionee">Gionee<span>(19)</span></label></li>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="micromax"
                                                name="brand"><label for="micromax">Micromax<span>(19)</span></label>
                                        </li>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="samsung"
                                                name="brand"><label for="samsung">Samsung<span>(19)</span></label></li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-8 col-md-7">
                        <!-- Start Filter Bar -->
                        <div class="filter-bar d-flex flex-wrap align-items-center">
                            <div class="sorting">
                                <select>
                                    <option value="1">Default sorting</option>
                                    <option value="1">Default sorting</option>
                                    <option value="1">Default sorting</option>
                                </select>
                            </div>
                            <div class="sorting mr-auto">
                                <select>
                                    <option value="1">Show 12</option>
                                    <option value="1">Show 12</option>
                                    <option value="1">Show 12</option>
                                </select>
                            </div>
                            <!-- ------------------Phân trang----------------------------- -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="${ 1 eq currentPage ? 'page-item disabled' : 'page-item' }">
                                        <a class="page-link" href="/products?page=${currentPage-1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <!-- -----------forEach này chia số sản phẩm cho mỗi trang---------- -->
                                    <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${ loop.index eq currentPage ? 'active page-link' : 'page-link' }"
                                                href="/products?page=${loop.index}">
                                                ${loop.index}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="${ totalPage eq currentPage ? 'page-item disabled' : 'page-item' }">
                                        <a class="page-link" href="/products?page=${currentPage+1}" aria-label="Next">
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

                                                    <a href="" class="social-info">
                                                        <span class="ti-bag"></span>
                                                        <p class="hover-text">add to bag</p>
                                                    </a>
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
                        <div class="filter-bar d-flex flex-wrap align-items-center">
                            <div class="sorting mr-auto">
                                <select>
                                    <option value="1">Show 12</option>
                                    <option value="1">Show 12</option>
                                    <option value="1">Show 12</option>
                                </select>
                            </div>

                            <!-- ------------------Phân trang----------------------------- -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="${ 1 eq currentPage ? 'page-item disabled' : 'page-item' }">
                                        <a class="page-link" href="/products?page=${currentPage-1}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <!-- -----------forEach này chia số sản phẩm cho mỗi trang---------- -->
                                    <c:forEach begin="1" end="${totalPage}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${ loop.index eq currentPage ? 'active page-link' : 'page-link' }"
                                                href="/products?page=${loop.index}">
                                                ${loop.index}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="${ totalPage eq currentPage ? 'page-item disabled' : 'page-item' }">
                                        <a class="page-link" href="/products?page=${currentPage+1}" aria-label="Next">
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

            <!-- Modal Quick Product View -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="container relative">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="product-quick-view">
                            <div class="row align-items-center">
                                <div class="col-lg-6">
                                    <div class="quick-view-carousel">
                                        <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                        </div>
                                        <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                        </div>
                                        <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="quick-view-content">
                                        <div class="top">
                                            <h3 class="head">Mill Oil 1000W Heater, White</h3>
                                            <div class="price d-flex align-items-center"><span
                                                    class="lnr lnr-tag"></span>
                                                <span class="ml-10">$149.99</span>
                                            </div>
                                            <div class="category">Category: <span>Household</span></div>
                                            <div class="available">Availibility: <span>In Stock</span></div>
                                        </div>
                                        <div class="middle">
                                            <p class="content">Mill Oil is an innovative oil filled radiator with the
                                                most
                                                modern technology. If you are
                                                looking for something that can make your interior look awesome, and at
                                                the same
                                                time give you the pleasant
                                                warm feeling during the winter.</p>
                                            <a href="#" class="view-full">View full Details <span
                                                    class="lnr lnr-arrow-right"></span></a>
                                        </div>
                                        <div class="bottom">
                                            <div class="color-picker d-flex align-items-center">Color:
                                                <span class="single-pick"></span>
                                                <span class="single-pick"></span>
                                                <span class="single-pick"></span>
                                                <span class="single-pick"></span>
                                                <span class="single-pick"></span>
                                            </div>
                                            <div class="quantity-container d-flex align-items-center mt-15">
                                                Quantity:
                                                <input type="text" class="quantity-amount ml-15" value="1" />
                                                <div class="arrow-btn d-inline-flex flex-column">
                                                    <button class="increase arrow" type="button"
                                                        title="Increase Quantity"><span
                                                            class="lnr lnr-chevron-up"></span></button>
                                                    <button class="decrease arrow" type="button"
                                                        title="Decrease Quantity"><span
                                                            class="lnr lnr-chevron-down"></span></button>
                                                </div>

                                            </div>
                                            <div class="d-flex mt-20">
                                                <a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
                                                <a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
                                                <a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>