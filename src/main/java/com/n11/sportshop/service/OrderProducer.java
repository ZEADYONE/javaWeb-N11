package com.n11.sportshop.service;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.n11.sportshop.config.RabbitConfig;
import com.n11.sportshop.domain.Order;

@Service
public class OrderProducer {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * Gửi đơn hàng (Order) sang RabbitMQ
     */
    public void sendOrderMessage(Order order) {
        try {
            String message = objectMapper.writeValueAsString(order);
            rabbitTemplate.convertAndSend(
                RabbitConfig.ORDER_EXCHANGE,   // tên exchange
                RabbitConfig.ORDER_ROUTING_KEY, // routing key
                message                         // nội dung message
            );
            System.out.println("✅ [RabbitMQ] Sent order message: " + order.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
