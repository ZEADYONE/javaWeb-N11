package com.n11.sportshop.controller.client;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.UserService;

@Controller
public class ClientAccountController {

    private final UserService userService;

    public ClientAccountController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/profile")
    public String viewProfile(Authentication authentication, Model model) {
        String username = authentication.getName();
        User user = this.userService.getUserByUsername(username);
        model.addAttribute("user", user);
        return "client/user/show";
    }

    @GetMapping("/profile/update")
    public String getUpdateUserPage(Model model, Authentication authentication) {
        String username = authentication.getName();
        User user = this.userService.getUserByUsername(username);
        model.addAttribute("newUser", user);
        return "client/user/update";
    }

    @PostMapping("/profile/update")
    public String updateUserPage(
            @ModelAttribute("user") User user,
            @RequestParam("images") MultipartFile file,
            Authentication authentication,
            RedirectAttributes redirectAttributes) {

        this.userService.updateUser(user, file);

        return "redirect:/profile";
    }
}
