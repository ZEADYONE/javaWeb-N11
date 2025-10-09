<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="zxx" class="no-js">

    <head>
      <!-- Mobile Specific Meta -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <!-- Favicon-->
      <link rel="shortcut icon" href="/client/img/fav.png">
      <!-- Author Meta -->
      <meta name="author" content="CodePixar">
      <!-- Meta Description -->
      <meta name="description" content="">
      <!-- Meta Keyword -->
      <meta name="keywords" content="">
      <!-- meta character set -->
      <meta charset="UTF-8">
      <!-- Site Title -->
      <title>Karma Shop</title>
      <!--
		CSS
		============================================= -->
      <link rel="stylesheet" href="/client/css/linearicons.css">
      <link rel="stylesheet" href="/client/css/font-awesome.min.css">
      <link rel="stylesheet" href="/client/css/themify-icons.css">
      <link rel="stylesheet" href="/client/css/bootstrap.css">
      <link rel="stylesheet" href="/client/css/owl.carousel.css">
      <link rel="stylesheet" href="/client/css/nice-select.css">
      <link rel="stylesheet" href="/client/css/nouislider.min.css">
      <link rel="stylesheet" href="/client/css/ion.rangeSlider.css" />
      <link rel="stylesheet" href="/client/css/ion.rangeSlider.skinFlat.css" />
      <link rel="stylesheet" href="/client/css/magnific-popup.css">
      <link rel="stylesheet" href="/client/css/main.css">
      <!-- 
    Javascript
		============================================= -->
      <script src="/client/js/vendor/jquery-2.2.4.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
      <script src="/client/js/vendor/bootstrap.min.js"></script>
      <script src="/client/js/jquery.ajaxchimp.min.js"></script>
      <script src="/client/js/jquery.nice-select.min.js"></script>
      <script src="/client/js/jquery.sticky.js"></script>
      <script src="/client/js/nouislider.min.js"></script>
      <script src="/client/js/countdown.js"></script>
      <script src="/client/js/jquery.magnific-popup.min.js"></script>
      <script src="/client/js/owl.carousel.min.js"></script>
      <!--gmaps Js-->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
      <script src="/client/js/gmaps.min.js"></script>
      <script src="/client/js/main.js"></script>
    </head>

    <body>

      <!-- Start Header Area -->
      <jsp:include page="../layout/header.jsp" />
      <!-- End Header Area -->


      <!-- start banner Area -->
      <section class="banner-area">
        <div class="container">
          <div class="row fullscreen align-items-center justify-content-start">
            <div class="col-lg-12">
              <div>
                <!-- single-slide -->
                <div class="row single-slide align-items-center d-flex">
                  <div class="col-lg-5 col-md-6">
                    <div class="banner-content">
                      <h1>Nike New <br>Collection!</h1>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                        labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                      
                    </div>
                  </div>
                  <div class="col-lg-7">
                    <div class="banner-img">
                      <img class="img-fluid" src="/client/img/banner/banner-img.png" alt="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End banner Area -->

      <!-- start features Area -->
      <section class="features-area section_gap">
        <div class="container">
          <div class="row features-inner">
            <!-- single features -->
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="single-features">
                <div class="f-icon">
                  <img src="/client/img/features/f-icon1.png" alt="">
                </div>
                <h6>Free Delivery</h6>
                <p>Free Shipping on all order</p>
              </div>
            </div>
            <!-- single features -->
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="single-features">
                <div class="f-icon">
                  <img src="/client/img/features/f-icon2.png" alt="">
                </div>
                <h6>Return Policy</h6>
                <p>Free Shipping on all order</p>
              </div>
            </div>
            <!-- single features -->
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="single-features">
                <div class="f-icon">
                  <img src="/client/img/features/f-icon3.png" alt="">
                </div>
                <h6>24/7 Support</h6>
                <p>Free Shipping on all order</p>
              </div>
            </div>
            <!-- single features -->
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="single-features">
                <div class="f-icon">
                  <img src="/client/img/features/f-icon4.png" alt="">
                </div>
                <h6>Secure Payment</h6>
                <p>Free Shipping on all order</p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- end features Area -->

      <!-- Start category Area -->
      <section class="category-area">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-12">
              <div class="row">
                <div class="col-lg-8 col-md-8">
                  <div class="single-deal">
                    <div class="overlay"></div>
                    <img class="img-fluid w-100" src="/client/img/category/c1.jpg" alt="">
                    <a href="/client/img/category/c1.jpg" class="img-pop-up" target="_blank">
                      <div class="deal-details">
                        <h6 class="deal-title">Sneaker for Sports</h6>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="col-lg-4 col-md-4">
                  <div class="single-deal">
                    <div class="overlay"></div>
                    <img class="img-fluid w-100" src="/client/img/category/c2.jpg" alt="">
                    <a href="/client/img/category/c2.jpg" class="img-pop-up" target="_blank">
                      <div class="deal-details">
                        <h6 class="deal-title">Sneaker for Sports</h6>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="col-lg-4 col-md-4">
                  <div class="single-deal">
                    <div class="overlay"></div>
                    <img class="img-fluid w-100" src="/client/img/category/c3.jpg" alt="">
                    <a href="/client/img/category/c3.jpg" class="img-pop-up" target="_blank">
                      <div class="deal-details">
                        <h6 class="deal-title">Product for Couple</h6>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="col-lg-8 col-md-8">
                  <div class="single-deal">
                    <div class="overlay"></div>
                    <img class="img-fluid w-100" src="/client/img/category/c4.jpg" alt="">
                    <a href="/client/img/category/c4.jpg" class="img-pop-up" target="_blank">
                      <div class="deal-details">
                        <h6 class="deal-title">Sneaker for Sports</h6>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6">
              <div class="single-deal">
                <div class="overlay"></div>
                <img class="img-fluid w-100" src="/client/img/category/c5.jpg" alt="">
                <a href="/client/img/category/c5.jpg" class="img-pop-up" target="_blank">
                  <div class="deal-details">
                    <h6 class="deal-title">Sneaker for Sports</h6>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End category Area -->

      <!-- start product Area -->
      <section>
        <!-- single product slide -->
        <div class="single-product-slider">
          <div class="container">
              <div class="row justify-content-center">
              <div class="col-lg-6 text-center">
                <div class="section-title">
                  <h1>Latest Products</h1>
                  <p>Hiển thị sản phẩm tại đây.</p>
                </div>
              </div>
            </div>
            <div class="row">
              <!-- single product -->
              <div class="col-lg-3 col-md-6">
                <div class="single-product">
                  <img class="img-fluid" src="/client/img/product/p1.jpg" alt="">
                  <div class="product-details">
                    <h6>addidas New Hammer sole
                      for Sports person</h6>
                    <div class="price">
                      <h6>$150.00</h6>
                      <h6 class="l-through">$210.00</h6>
                    </div>
                    <div class="prd-bottom">

                      <a href="" class="social-info">
                        <span class="ti-bag"></span>
                        <p class="hover-text">add to bag</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-heart"></span>
                        <p class="hover-text">Wishlist</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-sync"></span>
                        <p class="hover-text">compare</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-move"></span>
                        <p class="hover-text">view more</p>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- single product -->
              <div class="col-lg-3 col-md-6">
                <div class="single-product">
                  <img class="img-fluid" src="/client/img/product/p2.jpg" alt="">
                  <div class="product-details">
                    <h6>addidas New Hammer sole
                      for Sports person</h6>
                    <div class="price">
                      <h6>$150.00</h6>
                      <h6 class="l-through">$210.00</h6>
                    </div>
                    <div class="prd-bottom">

                      <a href="" class="social-info">
                        <span class="ti-bag"></span>
                        <p class="hover-text">add to bag</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-heart"></span>
                        <p class="hover-text">Wishlist</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-sync"></span>
                        <p class="hover-text">compare</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-move"></span>
                        <p class="hover-text">view more</p>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- single product -->
              <div class="col-lg-3 col-md-6">
                <div class="single-product">
                  <img class="img-fluid" src="/client/img/product/p3.jpg" alt="">
                  <div class="product-details">
                    <h6>addidas New Hammer sole
                      for Sports person</h6>
                    <div class="price">
                      <h6>$150.00</h6>
                      <h6 class="l-through">$210.00</h6>
                    </div>
                    <div class="prd-bottom">
                      <a href="" class="social-info">
                        <span class="ti-bag"></span>
                        <p class="hover-text">add to bag</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-heart"></span>
                        <p class="hover-text">Wishlist</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-sync"></span>
                        <p class="hover-text">compare</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-move"></span>
                        <p class="hover-text">view more</p>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- single product -->
              <div class="col-lg-3 col-md-6">
                <div class="single-product">
                  <img class="img-fluid" src="/client/img/product/p4.jpg" alt="">
                  <div class="product-details">
                    <h6>addidas New Hammer sole
                      for Sports person</h6>
                    <div class="price">
                      <h6>$150.00</h6>
                      <h6 class="l-through">$210.00</h6>
                    </div>
                    <div class="prd-bottom">

                      <a href="" class="social-info">
                        <span class="ti-bag"></span>
                        <p class="hover-text">add to bag</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-heart"></span>
                        <p class="hover-text">Wishlist</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-sync"></span>
                        <p class="hover-text">compare</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-move"></span>
                        <p class="hover-text">view more</p>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- single product -->
              <div class="col-lg-3 col-md-6">
                <div class="single-product">
                  <img class="img-fluid" src="/client/img/product/p5.jpg" alt="">
                  <div class="product-details">
                    <h6>addidas New Hammer sole
                      for Sports person</h6>
                    <div class="price">
                      <h6>$150.00</h6>
                      <h6 class="l-through">$210.00</h6>
                    </div>
                    <div class="prd-bottom">

                      <a href="" class="social-info">
                        <span class="ti-bag"></span>
                        <p class="hover-text">add to bag</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-heart"></span>
                        <p class="hover-text">Wishlist</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-sync"></span>
                        <p class="hover-text">compare</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-move"></span>
                        <p class="hover-text">view more</p>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- single product -->
              <div class="col-lg-3 col-md-6">
                <div class="single-product">
                  <img class="img-fluid" src="/client/img/product/p6.jpg" alt="">
                  <div class="product-details">
                    <h6>addidas New Hammer sole
                      for Sports person</h6>
                    <div class="price">
                      <h6>$150.00</h6>
                      <h6 class="l-through">$210.00</h6>
                    </div>
                    <div class="prd-bottom">

                      <a href="" class="social-info">
                        <span class="ti-bag"></span>
                        <p class="hover-text">add to bag</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-heart"></span>
                        <p class="hover-text">Wishlist</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-sync"></span>
                        <p class="hover-text">compare</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-move"></span>
                        <p class="hover-text">view more</p>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- single product -->
              <div class="col-lg-3 col-md-6">
                <div class="single-product">
                  <img class="img-fluid" src="/client/img/product/p7.jpg" alt="">
                  <div class="product-details">
                    <h6>addidas New Hammer sole
                      for Sports person</h6>
                    <div class="price">
                      <h6>$150.00</h6>
                      <h6 class="l-through">$210.00</h6>
                    </div>
                    <div class="prd-bottom">

                      <a href="" class="social-info">
                        <span class="ti-bag"></span>
                        <p class="hover-text">add to bag</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-heart"></span>
                        <p class="hover-text">Wishlist</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-sync"></span>
                        <p class="hover-text">compare</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-move"></span>
                        <p class="hover-text">view more</p>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- single product -->
              <div class="col-lg-3 col-md-6">
                <div class="single-product">
                  <img class="img-fluid" src="/client/img/product/p8.jpg" alt="">
                  <div class="product-details">
                    <h6>addidas New Hammer sole
                      for Sports person</h6>
                    <div class="price">
                      <h6>$150.00</h6>
                      <h6 class="l-through">$210.00</h6>
                    </div>
                    <div class="prd-bottom">

                      <a href="" class="social-info">
                        <span class="ti-bag"></span>
                        <p class="hover-text">add to bag</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-heart"></span>
                        <p class="hover-text">Wishlist</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-sync"></span>
                        <p class="hover-text">compare</p>
                      </a>
                      <a href="" class="social-info">
                        <span class="lnr lnr-move"></span>
                        <p class="hover-text">view more</p>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- single product slide -->
        <div class="single-product-slider">
          <!-- Không được xóa div này. Tôi đéo hiểu sao nó lỗi  -->
        </div>
      </section>
      <!-- end product Area -->

      <!-- start footer Area -->
      <jsp:include page="../layout/footer.jsp" />
      <!-- End footer Area -->

      
    </body>

    </html>