package com.n11.sportshop.service.Validator;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.UserService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class AdminUserValidator implements ConstraintValidator<AdminUserChecked, User> {

    private final UserService userService;

    public AdminUserValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(User user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Kiểm tra email tồn tại
        if (this.userService.checkEmailExist(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email đã tồn tại")
                    .addPropertyNode("email")
                    // addPropertyNode("email"): Lỗi sẽ được áp dụng vào trường
                    // email trong đối tượng User
                    // Điều này có nghĩa là lỗi sẽ liên kết với trường email, không phải
                    // với username
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // Kiểm tra username tồn tại
        if (this.userService.checkUsernameExist(user.getUsername())) {
            context.buildConstraintViolationWithTemplate("Tên đăng nhập đã tồn tại")
                    .addPropertyNode("username")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        return valid;
    }
}
