package com.n11.sportshop.service;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.n11.sportshop.config.RabbitConfig;
import com.n11.sportshop.domain.Order;

@Component
public class OrderConsumer {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @RabbitListener(queues = RabbitConfig.ORDER_QUEUE)
    public void handleOrderMessage(String message) {
        try {
            Order order = objectMapper.readValue(message, Order.class);
            System.out.println("📩 [RabbitMQ] Received order: " + order.getId());

            // TODO: Xử lý nền ở đây, ví dụ:
            // sendEmail(order);
            // logToAnalytics(order);
            // syncToWarehouseSystem(order);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
