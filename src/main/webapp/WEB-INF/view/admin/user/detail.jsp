<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!-- Modal Detail -->
            <div class="modal fade" id="detailModal${param.id}" tabindex="-1"
                aria-labelledby="detailModalLabel${param.id}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content border-0 shadow-lg">

                        <!-- Header -->
                        <div class="modal-header bg-gradient-primary text-white">
                            <h5 class="modal-title" id="detailModalLabel${param.id}">User Detail</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Body -->
                        <div class="modal-body px-4 py-4">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>ID:</strong> ${param.id}</li>
                                <li class="list-group-item"><strong>Username:</strong> ${param.username}</li>
                                <li class="list-group-item"><strong>Fullname:</strong> ${param.fullname}</li>
                                <li class="list-group-item"><strong>Email:</strong> ${param.email}</li>
                                <li class="list-group-item"><strong>Phone:</strong> ${param.phone}</li>
                                <li class="list-group-item"><strong>Address:</strong> ${param.address}</li>
                                <li class="list-group-item"><strong>Role:</strong> ${param.role}</li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>