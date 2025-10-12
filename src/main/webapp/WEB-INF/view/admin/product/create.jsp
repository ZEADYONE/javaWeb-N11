<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <link id="pagestyle" href="/admin/css/form-input.css" rel="stylesheet" />

            <div class="modal fade" id="CreateModal" tabindex="-1" aria-labelledby="CreateModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content border-0 shadow-lg rounded-4">

                        <!-- Header -->
                        <div class="modal-header bg-gradient-primary text-white rounded-top-4">
                            <h5 class="modal-title" id="CreateModalLabel">Add product</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>

                        <!-- Body -->
                        <div class="modal-body py-4 px-5">
                            <form:form method="post" action="/admin/product/create" modelAttribute="newProduct">

                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label class="form-label fw-bold">Name:</label>
                                        <form:input type="text" class="form-control border " style="padding-left: 20px;"
                                            path="name" />
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Category</label>
                                        <form:select class="form-select border" style="padding-left: 20px;"
                                            path="category.name">
                                            <form:option value="">-----</form:option>
                                            <form:option value="Shirt">Shirt</form:option>
                                            <form:option value="Pant">Pant</form:option>
                                        </form:select>
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Brand</label>
                                        <form:select class="form-select border" style="padding-left: 20px;"
                                            path="brand.name">
                                            <form:option value="">-----</form:option>
                                            <form:option value="Hehe">Hehe</form:option>
                                            <form:option value="Hihi">Hihi</form:option>
                                        </form:select>
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Price:</label>
                                        <form:input type="text" class="form-control border " style="padding-left: 20px;"
                                            path="price" />
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Stock:</label>
                                        <form:input type="text" class="form-control border " style="padding-left: 20px;"
                                            path="stockQuantity" />
                                    </div>

                                    <div class="col-md-12 mb-3">
                                        <label class="form-label fw-bold">Description:</label>
                                        <form:textarea class="form-control border" style="padding-left: 20px;"
                                            path="description"></form:textarea>
                                    </div>

                                    <div class="col-md-12 mb-3 ">
                                        <label class="form-label fw-bold">Avatar:</label>
                                        <div class="d-flex align-items-center gap-3">
                                            <label for="formFileLg" class="upload-box">
                                                <i class="bi bi-cloud-upload"></i>
                                                <span>Upload image</span>
                                            </label>

                                            <input type="file" id="formFileLg" accept="image/*"
                                                onchange="previewImage(event)">
                                            <img id="preview" alt="preview">
                                        </div>

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
                    </div>
                </div>
            </div>

            <script>
                function previewImage(event) {
                    const image = document.getElementById('preview');
                    const uploadBox = document.querySelector('.upload-box');
                    const file = event.target.files[0];

                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            image.src = e.target.result;
                            image.style.display = 'block';

                            // Đợi ảnh load xong để tính chiều cao
                            image.onload = function () {
                                const newHeight = image.clientHeight;
                                uploadBox.style.minHeight = newHeight + 'px';
                            };
                        };
                        reader.readAsDataURL(file);
                    }
                }
            </script>