package com.n11.sportshop.controller.admin;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.ProductItem;
import com.n11.sportshop.service.ProductItemService;
import com.n11.sportshop.service.ProductService;

@Controller
@RequestMapping("/admin/product/{productId}/items")
public class ProductItemController {

    private final ProductItemService productItemService;
    private final ProductService productService;

    public ProductItemController(ProductItemService productItemService, ProductService productService) {
        this.productItemService = productItemService;
        this.productService = productService;
    }

    @GetMapping
    public String getItemsPage(@PathVariable("productId") int productId, Model model) {
        Product product = productService.getProductById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm ID = " + productId));
        
        List<ProductItem> items = productItemService.findByProductId(productId);
        
        model.addAttribute("product", product);
        model.addAttribute("items", items);
        model.addAttribute("newItem", new ProductItem());
        
        return "admin/product/items";
    }

    @PostMapping("/create")
    public String createItem(
            @PathVariable("productId") int productId,
            @ModelAttribute("newItem") ProductItem productItem,
            org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        
        Product product = productService.getProductById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm ID = " + productId));
        
        if (productItemService.existsBySerialCode(productItem.getSerialCode())) {
            redirectAttributes.addFlashAttribute("error", "Mã Serial đã tồn tại!");
            return "redirect:/admin/product/" + productId + "/items";
        }

        if (productItem.getWarrantyStartDate() != null && productItem.getWarrantyEndDate() != null 
                && productItem.getWarrantyStartDate().isAfter(productItem.getWarrantyEndDate())) {
            redirectAttributes.addFlashAttribute("error", "Ngày bắt đầu bảo hành phải nhỏ hơn hoặc bằng ngày kết thúc bảo hành!");
            return "redirect:/admin/product/" + productId + "/items";
        }
        
        productItem.setProduct(product);
        productItemService.save(productItem);
        
        return "redirect:/admin/product/" + productId + "/items";
    }

    @PostMapping("/update")
    public String updateItem(
            @PathVariable("productId") int productId,
            @RequestParam("itemId") int itemId,
            @RequestParam("serialCode") String serialCode,
            @RequestParam("status") String status,
            @RequestParam(value = "warrantyStartDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate warrantyStartDate,
            @RequestParam(value = "warrantyEndDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate warrantyEndDate,
            org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        
        ProductItem item = productItemService.findById(itemId)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy Serial ID = " + itemId));
        
        // Check if serial code changed and if new code already exists
        if (!item.getSerialCode().equals(serialCode) && productItemService.existsBySerialCode(serialCode)) {
            redirectAttributes.addFlashAttribute("error", "Mã Serial đã tồn tại!");
            return "redirect:/admin/product/" + productId + "/items";
        }

        if (warrantyStartDate != null && warrantyEndDate != null 
                && warrantyStartDate.isAfter(warrantyEndDate)) {
            redirectAttributes.addFlashAttribute("error", "Ngày bắt đầu bảo hành phải nhỏ hơn hoặc bằng ngày kết thúc bảo hành!");
            return "redirect:/admin/product/" + productId + "/items";
        }
        
        item.setSerialCode(serialCode);
        item.setStatus(status);
        item.setWarrantyStartDate(warrantyStartDate);
        item.setWarrantyEndDate(warrantyEndDate);
        productItemService.save(item);
        
        return "redirect:/admin/product/" + productId + "/items";
    }

    @PostMapping("/delete/{itemId}")
    public String deleteItem(
            @PathVariable("productId") int productId,
            @PathVariable("itemId") int itemId) {
        
        productItemService.deleteById(itemId);
        return "redirect:/admin/product/" + productId + "/items";
    }
}
