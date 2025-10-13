<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!-- Start Header Area -->
		<jsp:include page="../layout/header.jsp" />
		<!-- End Header Area -->

		<!-- Start Banner Area -->
		<!-- <section class="banner-area organic-breadcrumb">
			<div class="container">
				<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
					<div class="col-first">
						<h1>Login/Register</h1>
						<nav class="d-flex align-items-center">
							<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
							<a href="category.html">Login/Register</a>
						</nav>
					</div>
				</div>
			</div>
		</section> -->
		<!-- End Banner Area -->

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
							<form class="row login_form" action="register_process.php" method="post" id="registerForm"
								novalidate="novalidate">

								<div class="col-md-12 form-group">
									<input type="text" class="form-control" id="username" name="username"
										placeholder="Username" onfocus="this.placeholder=''"
										onblur="this.placeholder='Username'">
								</div>

								<div class="col-md-12 form-group">
									<input type="email" class="form-control" id="email" name="email"
										placeholder="Email Address" onfocus="this.placeholder=''"
										onblur="this.placeholder='Email Address'">
								</div>

								<div class="col-md-12 form-group">
									<input type="password" class="form-control" id="password" name="password"
										placeholder="Password" onfocus="this.placeholder=''"
										onblur="this.placeholder='Password'">
								</div>

								<div class="col-md-12 form-group">
									<input type="password" class="form-control" id="confirm_password"
										name="confirm_password" placeholder="Confirm Password"
										onfocus="this.placeholder=''" onblur="this.placeholder='Confirm Password'">
								</div>

								<div class="col-md-12 form-group">
									<div class="creat_account">
										<input type="checkbox" id="terms" name="terms">
										<label for="terms">I agree to the terms & conditions</label>
									</div>
								</div>

								<div class="col-md-12 form-group">
									<button type="submit" value="submit" class="primary-btn">Register</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!--================End Login Box Area =================-->

		<!-- start footer Area -->
		<jsp:include page="../layout/footer.jsp" />
		<!-- End footer Area -->