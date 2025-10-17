package com.n11.sportshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.n11.sportshop.domain.PaginationQuery;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.Role;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.PaginationServie;
import com.n11.sportshop.service.UserService;

import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    private final UserService userService;
    private final PaginationServie paginationServie;

    public UserController(UserService userService, PaginationServie paginationServie) {
        this.userService = userService;
        this.paginationServie = paginationServie;
    }

    @GetMapping("/create")
    public String getUserCreatePage(Model model) {
        model.addAttribute("role", new Role());
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/create")
    public String postCreateUser(Model model, @ModelAttribute("newUser") @Valid User user, BindingResult bindingResult,
            @RequestParam("images") MultipartFile file) {
        // @RequestParam("images") MultipartFile file dùng để lấy file từ client đây về

        // User có Role {id : null, name = "..."} -> về RoleRepo để tìm id và lưu lại.
        // Không được để id trống !!!
        // Nhớ thêm ADMIN, USER và database

        // Validate
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getObjectName() + " - " + error.getDefaultMessage());
        }

        this.userService.createUserByAdmin(user, file);
        return "redirect:/admin/user";
    }

    @GetMapping
    public String getUserList(Model model, @RequestParam("page") Optional<String> pageOptinal) {

        PaginationQuery<User> paginationQuery = this.paginationServie.handelUserPagination(pageOptinal, 10);

        // --------------- Lấy tất cả sản phẩm-------------------
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
        model.addAttribute("newUser", user);
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
