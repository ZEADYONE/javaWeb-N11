<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <link id="pagestyle" href="/admin/css/material-dashboard.css" rel="stylesheet" />

            <div class="modal fade" id="detailModal${user.id}" tabindex="-1"
                aria-labelledby="detailModalLabel${user.id}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">

                        <div class="modal-header bg-gradient-primary">
                            <h5 class="modal-title fw-bold text-white" id="detailModalLabel${user.id}">
                                <i class="bi bi-person-vcard me-2"></i> User Details
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>

                        <div class="modal-body p-4">
                            <div class="text-center mb-4">
                                <img src="/images/avatar/${user.image}" alt="Avatar Preview"
                                    class="rounded-circle shadow-sm border border-3"
                                    style="width: 140px; height: 140px; object-fit: cover; border-color:#ffba00;">
                                <h4 class="mt-3 fw-bold">${user.fullName}</h4>
                                <div class="text-muted small">
                                    <i class="bi bi-person-circle me-1"></i>
                                    <span class="fw-semibold">@${user.username}</span>
                                </div>
                                <span class="badge mt-2 px-3 py-1 fw-normal bg-gradient-primary">
                                    ${user.role.name}
                                </span>
                            </div>

                            <div class="card border-0 shadow-sm rounded-3">
                                <div class="card-header fw-semibold">
                                    <i class="bi bi-info-circle me-2"></i> Account Information
                                </div>
                                <div class="card-body px-4">
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-2">
                                            <strong><i class="bi bi-hash me-1"></i>User ID:</strong>
                                            <div class="text-muted">${user.id}</div>
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <strong><i class="bi bi-envelope me-1"></i>Email:</strong>
                                            <div class="text-muted">${user.email}</div>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-2">
                                            <strong><i class="bi bi-telephone me-1"></i>Phone Number:</strong>
                                            <div class="text-muted">${user.phoneNumber}</div>
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <strong><i class="bi bi-geo-alt me-1"></i>Address:</strong>
                                            <div class="text-muted">${user.address}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer border-0">
                            <button type="button" class="btn bg-gradient-primary" style="font-weight:500;"
                                data-bs-dismiss="modal">
                                Close
                            </button>
                        </div>

                    </div>
                </div>
            </div>