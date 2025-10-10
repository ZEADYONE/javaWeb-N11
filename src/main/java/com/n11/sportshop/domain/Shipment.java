package com.n11.sportshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "Shipment")
public class Shipment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order; // mỗi Shipment chỉ thuộc 1 Order

    @Column(length = 100)
    private String carrier; // tên hãng vận chuyển (VD: GHN, GHTK)

    @Column(length = 100)
    private String trackingNumber; // mã vận đơn

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private ShipmentStatus status = ShipmentStatus.SHIPPING; // trạng thái mặc định

   

    // ===== Getters & Setters =====
    public int getId() { return id; }
    public void setId(int shipmentId) { this.id = shipmentId; }

    public Order getOrder() { return order; }
    public void setOrder(Order order) { this.order = order; }

    public String getCarrier() { return carrier; }
    public void setCarrier(String carrier) { this.carrier = carrier; }

    public String getTrackingNumber() { return trackingNumber; }
    public void setTrackingNumber(String trackingNumber) { this.trackingNumber = trackingNumber; }

    public ShipmentStatus getStatus() { return status; }
    public void setStatus(ShipmentStatus status) { this.status = status; }
}
