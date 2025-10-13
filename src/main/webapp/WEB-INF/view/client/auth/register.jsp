<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


			<!-- Start Header Area -->
			<jsp:include page="../layout/header.jsp" />
			<!-- End Header Area -->

			<!--================Login Box Area =================-->
			<section class="login_box_area section_gap">
				<div class="container">
					<div class="row">
						<!-- Ảnh bên trái -->
						<div class="col-lg-6">
							<div class="login_box_img">
								<img class="img-fluid" src="/client/img/login.jpg" alt="">
								<div class="hover">
									<h4>Already have an account?</h4>
									<p>Login to access your account and continue shopping with us.</p>
									<a class="primary-btn" href="/login">Log In</a>
								</div>
							</div>
						</div>

						<!-- Form đăng ký -->
						<div class="col-lg-6">
							<div class="login_form_inner">
								<h3>Create an Account</h3>
								<form:form class="row login_form" action="/register" method="post"
									modelAttribute="newUser" id="registerForm" novalidate="novalidate">

									<div class="col-md-6 form-group">
										<form:input type="text" class="form-control" path="firstName"
											placeholder="First name" onfocus="this.placeholder=''"
											onblur="this.placeholder='Username'" />
									</div>

									<div class="col-md-6 form-group">
										<form:input type="text" class="form-control" path="lastName"
											placeholder="Last name" onfocus="this.placeholder=''"
											onblur="this.placeholder='Username'" />
									</div>

									<div class="col-md-12 form-group">
										<form:input type="text" class="form-control" id="username" path="username"
											placeholder="Username" onfocus="this.placeholder=''"
											onblur="this.placeholder='Username'" />
									</div>

									<div class="col-md-12 form-group">
										<form:input type="email" class="form-control" id="email" path="email"
											placeholder="Email Address" onfocus="this.placeholder=''"
											onblur="this.placeholder='Email Address'" />
									</div>

									<div class="col-md-12 form-group">
										<form:input type="password" class="form-control" id="password" path="password"
											placeholder="Password" onfocus="this.placeholder=''"
											onblur="this.placeholder='Password'" />
									</div>

									<div class="col-md-12 form-group">
										<form:input type="password" class="form-control"
											path="confirmPassword" placeholder="Confirm Password"
											onfocus="this.placeholder=''"
											onblur="this.placeholder='Confirm Password'" />
									</div>

									<div class="col-md-12 form-group">
									</div>

									<div class="col-md-12 form-group">
										<button type="submit" class="primary-btn">Register</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!--================End Login Box Area =================-->

			<!-- start footer Area -->
			<jsp:include page="../layout/footer.jsp" />
			<!-- End footer Area -->