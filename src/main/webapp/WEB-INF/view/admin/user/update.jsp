<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <form:form method="post" action="/admin/user/update" modelAttribute="newUser">
                <div class="row">
                    <!-- ID hidden -->
                    <div class="mb-3" style="display: none;">
                        <form:input type="int" class="form-control" path="id" />
                    </div>

                    <div class="col-md-12 mb-3">
                        <label class="form-label fw-bold">Email:</label>
                        <form:input type="email" class="form-control border border-primary" style="padding-left: 20px;"
                            path="email" disabled="true" />
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">User name:</label>
                        <form:input type="text" class="form-control border border-primary" style="padding-left: 20px;"
                            path="username" />${newUser.username}
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Full name:</label>
                        <form:input type="text" class="form-control border border-primary" style="padding-left: 20px;"
                            path="fullName" />
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Phone number:</label>
                        <form:input type="text" class="form-control border border-primary" style="padding-left: 20px;"
                            path="phoneNumber" />
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Select role:</label>
                        <form:select class="form-select border border-primary" style="padding-left: 20px;"
                            path="role.name">
                            <form:option value="">-----</form:option>
                            <form:option value="ADMIN">ADMIN</form:option>
                            <form:option value="USER">USER</form:option>
                        </form:select>
                    </div>

                    <div class="col-md-12 mb-3">
                        <label class="form-label fw-bold">Address:</label>
                        <form:textarea class="form-control border border-primary" style="padding-left: 20px;"
                            path="address" />
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn text-white px-4 py-2" style="background-color: #ffba00;">
                        Update
                    </button>
                </div>
            </form:form>