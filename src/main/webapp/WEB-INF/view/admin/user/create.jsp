<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <div class="modal fade" id="CreateModal" tabindex="-1" aria-labelledby="CreateModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content border-0 shadow-lg rounded-4">

                        <!-- Header -->
                        <div class="modal-header bg-gradient-primary text-white rounded-top-4">
                            <h5 class="modal-title" id="CreateModalLabel">Create User</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>

                        <!-- Body -->
                        <div class="modal-body py-4 px-5">
                            <form:form method="post" action="/admin/user/create" modelAttribute="newUser">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Email:</label>
                                        <form:input type="email" class="form-control border border-primary"
                                            style="padding-left: 20px;" path="email" />
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">User name:</label>
                                        <form:input type="text" class="form-control border border-primary"
                                            style="padding-left: 20px;" path="username" />
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Password:</label>
                                        <form:input type="password" class="form-control border border-primary"
                                            style="padding-left: 20px;" path="password" />
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
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Select role</label>
                                        <form:select class="form-select border border-primary"
                                            style="padding-left: 20px;" path="role.name">
                                            <form:option value="">-----</form:option>
                                            <form:option value="ADMIN">ADMIN</form:option>
                                            <form:option value="USER">USER</form:option>
                                        </form:select>
                                    </div>


                                    <div class="col-md-12 mb-3">
                                        <label class="form-label fw-bold">Address:</label>
                                        <form:textarea type="text" class="form-control border border-primary"
                                            style="padding-left: 20px;" path="address" />
                                    </div>
                                </div>

                                <div class="text-center mt-4">
                                    <button type="submit" class="btn text-white px-4 py-2"
                                        style="background-color: #ffba00;">
                                        Create
                                    </button>
                                </div>
                            </form:form>
                        </div>

                        <!-- Footer -->
                        <div class="modal-footer justify-content-center border-0 pb-3"></div>

                    </div>
                </div>
            </div>