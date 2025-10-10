<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <aside
                class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark"
                id="sidenav-main">
                <jsp:include page="../layout/sidebar.jsp" />
            </aside>

            <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
                <jsp:include page="../layout/header.jsp" />
                <div class="container-fluid py-4">
                    <div class="col-12">
                        <div class="card my-4">
                            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                                    <h6 class="text-white text-capitalize ps-3">Update User</h6>
                                </div>
                            </div>

                            <div class="card-body px-5 py-4">
                                <div class="row justify-content-center">
                                    <div class="col-md-8">
                                        <form:form method="post" action="/admin/user/update" modelAttribute="newUser">
                                            <!-- Hidden ID -->
                                            <form:input type="hidden" path="id" />

                                            <div class="row">
                                                <div class="col-md-12 mb-3">
                                                    <label class="form-label fw-bold">Email:</label>
                                                    <form:input type="email" class="form-control border border-primary"
                                                        style="padding-left: 20px;" path="email" readonly="true" />
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">User name:</label>
                                                    <form:input type="text" class="form-control border border-primary"
                                                        style="padding-left: 20px;" path="username" />
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Full name:</label>
                                                    <form:input type="text" class="form-control border border-primary"
                                                        style="padding-left: 20px;" path="fullName" />
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Phone number:</label>
                                                    <form:input type="text" class="form-control border border-primary"
                                                        style="padding-left: 20px;" path="phoneNumber" />
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Select role:</label>
                                                    <form:select class="form-select border border-primary"
                                                        style="padding-left: 20px;" path="role.name">
                                                        <form:option value="">-----</form:option>
                                                        <form:option value="ADMIN">ADMIN</form:option>
                                                        <form:option value="USER">USER</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="col-md-12 mb-3">
                                                    <label class="form-label fw-bold">Address:</label>
                                                    <form:textarea class="form-control border border-primary"
                                                        style="padding-left: 20px;" path="address"></form:textarea>
                                                </div>
                                            </div>

                                            <div class="text-center mt-4">
                                                <button type="submit" class="btn text-white px-4 py-2"
                                                    style="background-color: #ffba00;">
                                                    Update
                                                </button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </main>