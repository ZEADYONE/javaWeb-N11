<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="zxx" class="no-js">

        <head>
            <!-- Mobile Specific Meta -->
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <!-- Favicon-->
            <link rel="shortcut icon" href="/client/imgfav.png">
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
        </head>

        <body>
            <header class="header_area sticky-header">
                <div class="main_menu">
                    <jsp:include page="../layout/navigation.jsp" />
                </div>
                <div class="search_input" id="search_input_box">
                    <div class="container">
                        <form class="d-flex justify-content-between">
                            <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                            <button type="submit" class="btn"></button>
                            <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
                        </form>
                    </div>
                </div>
            </header>
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
        </body>