<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content border-0 shadow-lg">

                        <!-- Header -->
                        <div class="modal-header bg-gradient-primary text-white">
                            <h5 class="modal-title" id="detailModalLabel">User Detail</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Body -->
                        <div class="modal-body px-4 py-4">
                            <h4 class="text-dark mb-3" id="detailHeader"></h4>
                            <hr class="my-3" />

                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-light fw-bold text-dark">
                                    Account Information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><strong>Full Name:</strong> ${user.id}</li>
                                    <li class="list-group-item"><strong>Username:</strong> ${user.username}
                                    </li>
                                    <li class="list-group-item"><strong>Email:</strong> ${user.username}
                                    </li>
                                    <li class="list-group-item"><strong>Address:</strong></li> ${user.username}
                                    <li class="list-group-item"><strong>Phone Number:</strong></span></li>
                                    <li class="list-group-item"><strong>Role:</strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>