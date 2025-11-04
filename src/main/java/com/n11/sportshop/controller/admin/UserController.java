package com.n11.sportshop.controller.admin;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.n11.sportshop.domain.PaginationQuery;
import com.n11.sportshop.domain.Role;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.UserVoucher;
import com.n11.sportshop.domain.Voucher;
import com.n11.sportshop.service.PaginationService;
import com.n11.sportshop.service.UserService;
import com.n11.sportshop.service.ProductService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    private final UserService userService;
    private final PaginationService paginationServie;
    private final ProductService productService;

    public UserController(PaginationService paginationServie, ProductService productService, UserService userService) {
        this.paginationServie = paginationServie;
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/create")
    public String getUserCreatePage(Model model) {
        model.addAttribute("role", new Role());
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/create")
    public String postCreateUser(Model model, @ModelAttribute("newUser") @Valid User user,
            BindingResult userBindingResult,
            @RequestParam("images") MultipartFile file) {
        // @RequestParam("images") MultipartFile file dùng để lấy file từ client đây về

        // User có Role {id : null, name = "..."} -> về RoleRepo để tìm id và lưu lại.
        // Không được để id trống !!!
        // Nhớ thêm ADMIN, USER và database

        // Validate
        List<FieldError> errors = userBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getObjectName() + " - " + error.getDefaultMessage());
        }

        // Check trùng email
        if (userService.checkEmailExist(user.getEmail())) {
            userBindingResult.rejectValue("email", "error.user", "Email đã tồn tại");
        }

        // Check trùng username
        if (userService.checkUsernameExist(user.getUsername())) {
            userBindingResult.rejectValue("username", "error.user", "Tên đăng nhập đã tồn tại");
        }

        if (userBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        this.userService.createUserByAdmin(user, file);
        return "redirect:/admin/user";
    }

    @GetMapping
    public String getUserList(Model model, @RequestParam("page") Optional<String> pageOptinal) {

        PaginationQuery<User> paginationQuery = this.paginationServie.AdminUserPagination(pageOptinal, 8);

        // --------------- Lấy tất cả user-------------------
        model.addAttribute("users", paginationQuery.getPrs().getContent());

        // --------------Lấy STT trang hiện tại-------------------
        model.addAttribute("currentPage", paginationQuery.getPage());

        // ---------------Lấy tổng số trang ------------------
        model.addAttribute("totalPage", paginationQuery.getPrs().getTotalPages());

        model.addAttribute("newUser", new User());
        return "admin/user/show";
    }

    // Delete-User
    @GetMapping("/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable int id) {
        User user = this.userService.getUserByID(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    @PostMapping("/delete")
    public String postMethodName(Model model, @ModelAttribute("user") User user) {
        // Chỉ xóa ảnh nếu KHÔNG phải ảnh mặc định
        this.userService.deleteUser(user);
        return "redirect:/admin/user";
    }

    // Detail-User
    @GetMapping("/detail/{id}")
    public String getUserDetailPage(Model model, @PathVariable("id") int id) {
        User user = this.userService.getUserByID(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    // Update-User
    @GetMapping("/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable("id") int id) {
        User user = this.userService.getUserByID(id);
        List<Voucher> vouchers = this.productService.getVouchers();
        Map<Voucher, Integer> userHasVoucher = new TreeMap<>();
        for (var voucher : vouchers) {
            userHasVoucher.put(voucher, 0);
        }
        List<UserVoucher> userVouchers = user.getVoucherList();

        for (UserVoucher userVoucher : userVouchers) {
            userHasVoucher.put(userVoucher.getVoucher(), 1);
        }
        model.addAttribute("newUser", user);
        model.addAttribute("vouchers", userHasVoucher);
        return "admin/user/update";
    }

    @PostMapping("/update")
    public String updateUserPage(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("images") MultipartFile file) {
        // @RequestParam("images") MultipartFile file dùng để lấy file từ client đây về
        this.userService.updateUser(user, file);
        return "redirect:/admin/user";

    }
}
