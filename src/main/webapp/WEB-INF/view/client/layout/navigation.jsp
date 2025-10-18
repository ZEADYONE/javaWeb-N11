<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%-- LƯU Ý: Đây là nội dung của file header/navigation, thường được đặt tại ../layout/header.jsp hoặc tương
                tự. --%>

                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <a class="navbar-brand logo_h" href="/"><img src="/client/img/logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <li class="nav-item"><a class="nav-link" href="/">Trang chủ</a></li>
                                <li class="nav-item"><a class="nav-link" href="/products">Sản phẩm</a></li>
                                <li class="nav-item"><a class="nav-link" href="/contact">Liên hệ</a></li>
                                <li class="nav-item"><a class="nav-link" href="/cart">Giỏ hàng</a></li>

                                <li class="nav-item dropdown">
                                    <c:choose>
                                        <c:when test="${empty sessionScope.fullName}">
                                            <a class="nav-link" href="/login">
                                                <i class="fa fa-sign-in mr-1"></i> Đăng nhập
                                            </a>
                                        </c:when>

                                        <c:otherwise>
                                            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#"
                                                id="userDropdown" role="button" data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false">
                                                <img src="/images/avatar/${sessionScope.avatar}" alt="Avatar"
                                                    class="rounded-circle" width="30" height="30"
                                                    style="object-fit: cover;">
                                                <span class="ml-2">${sessionScope.fullName}</span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right"
                                                aria-labelledby="userDropdown">

                                                <a class="dropdown-item" href="/profile">
                                                    <i class="fa fa-user-circle-o mr-2"></i> Thông tin tài khoản
                                                </a>

                                                <a class="dropdown-item" href="/orders">
                                                    <i class="fa fa-list-alt mr-2"></i> Quản lý đơn hàng
                                                </a>

                                                <div class="dropdown-divider"></div>

                                                <form id="logoutForm" action="/logout" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button type="submit"
                                                        class="dropdown-item text-danger border-0 bg-transparent w-100 text-start">
                                                        <i class="fa fa-sign-out mr-2"></i> Đăng xuất
                                                    </button>
                                                </form>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>