<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <div class="modal fade" id="detailModal${user.id}" tabindex="-1"
                aria-labelledby="detailModalLabel${user.id}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content border-0 shadow-lg">

                        <!-- Header -->
                        <div class="modal-header bg-gradient-primary text-white">
                            <h5 class="modal-title" id="detailModalLabel${user.id}">User Detail</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Body -->
                        <div class="modal-body px-4 pb-4 pt-0">
                            <h4 class="text-dark mb-3" id="detailHeader"></h4>
                            <div>
                                <h3><strong>User ID:</strong> ${user.id}</h3>
                            </div>
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-light fw-bold text-dark">
                                    Account Information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><strong>Full Name: </strong>${user.fullName}</li>
                                    <li class="list-group-item"><strong>Username: </strong>${user.username}</li>
                                    <li class="list-group-item"><strong>Email: </strong>${user.email}</li>
                                    <li class="list-group-item"><strong>Address: </strong>${user.address}</li>
                                    <li class="list-group-item"><strong>Phone Number: </strong>${user.phoneNumber}
                                    </li>
                                    <li class="list-group-item"><strong>Role: </strong>${user.role.name}</li>
                                    <!-- Show ảnh -->
                                    <img src="/images/avatar/${user.image}" alt="Avatar Preview">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>