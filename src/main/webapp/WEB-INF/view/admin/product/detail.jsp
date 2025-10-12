<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <div class="modal fade" id="detailModal${product.id}" tabindex="-1"
                aria-labelledby="detailModalLabel${product.id}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content border-0 shadow-lg">

                        <!-- Header -->
                        <div class="modal-header bg-gradient-primary text-white">
                            <h5 class="modal-title" id="detailModalLabel${product.id}">Product Detail</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Body -->
                        <div class="modal-body px-4 pb-4 pt-0">
                            <h4 class="text-dark mb-3" id="detailHeader"></h4>
                            <div>
                                <h3><strong>Product ID:</strong> ${product.id}</h3>
                            </div>
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-light fw-bold text-dark">
                                    Product Information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><strong>Name: </strong>${product.name}</li>
                                    <li class="list-group-item"><strong>Category: </strong>${product.category.name}</li>
                                    <li class="list-group-item"><strong>Brand: </strong>${product.brand.name}</li>
                                    <li class="list-group-item"><strong>Price: </strong>${product.price}</li>
                                    <li class="list-group-item"><strong>Stock: </strong>${product.stockQuantity}
                                    </li>
                                    <li class="list-group-item"><strong>Description: </strong>${product.description}
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>