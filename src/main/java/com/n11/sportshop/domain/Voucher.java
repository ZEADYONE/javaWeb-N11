package com.n11.sportshop.domain;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "Voucher")
public class Voucher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   
    private int id;

    //@Column( unique = true, nullable = false, length = 50)
    private String code;

    @Column( length = 255)
    private String description;

    @Enumerated(EnumType.STRING)
    //@Column( nullable = false)
    private DiscountType discountType;

    //@Column( precision = 12, scale = 2, nullable = false)
    private BigDecimal discountValue;

    //@Column(nullable = false)
    private LocalDate startDate;

   // @Column(nullable = false)
    private LocalDate endDate;

    @Enumerated(EnumType.STRING)
    //@Column(nullable = false)
    private VoucherStatus status = VoucherStatus.active;

   
    

    
    public int getId() { return id; }
    public void setId(int voucherId) { this.id = voucherId; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public DiscountType getDiscountType() { return discountType; }
    public void setDiscountType(DiscountType discountType) { this.discountType = discountType; }

    public BigDecimal getDiscountValue() { return discountValue; }
    public void setDiscountValue(BigDecimal discountValue) { this.discountValue = discountValue; }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public VoucherStatus getStatus() { return status; }
    public void setStatus(VoucherStatus status) { this.status = status; }
}
