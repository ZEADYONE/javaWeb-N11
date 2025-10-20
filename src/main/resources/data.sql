-- =========================================
-- RESET DATA
-- =========================================
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE product;
TRUNCATE TABLE brand;
TRUNCATE TABLE category;
SET FOREIGN_KEY_CHECKS = 1;

-- =========================================
-- INSERT DATA FOR CATEGORY
-- =========================================
INSERT INTO category (id, code, name) VALUES
(1, 'CLO', 'Clothing'),
(2, 'SHO', 'Shoes'),
(3, 'RAC', 'Rackets'),
(4, 'ACC', 'Accessories');

-- =========================================
-- INSERT DATA FOR BRAND
-- =========================================
INSERT INTO brand (id, name) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Yonex'),
(4, 'Li-Ning'),
(5, 'Decathlon');

-- =========================================
-- INSERT DATA FOR PRODUCT
-- =========================================
INSERT INTO product 
(id, name, description, price, stock_quantity, category_id, brand_id, image) VALUES
(1, 'Nike Dri-FIT T-Shirt', 'Moisture-wicking fabric keeps you dry during workouts.', 450000, 120, 1, 1, NULL),
(2, 'Adidas Climacool Jacket', 'Lightweight and breathable jacket for outdoor training.', 650000, 80, 1, 2, NULL),
(3, 'Li-Ning Sports Shorts', 'Stretchy, soft shorts for gym or basketball.', 300000, 150, 1, 4, NULL),
(4, 'Decathlon Training Pants', 'Elastic, soft, and comfortable for running.', 350000, 90, 1, 5, NULL),
(5, 'Yonex CoolFit Tank Top', 'Smooth fabric with anti-bacterial properties.', 400000, 100, 1, 3, NULL),

(6, 'Nike Air Zoom Running Shoes', 'Air-cushioned sole for comfort and shock absorption.', 2200000, 60, 2, 1, NULL),
(7, 'Adidas Harden Vol.6 Basketball Shoes', 'Designed for agility and explosive jumps.', 2600000, 40, 2, 2, NULL),
(8, 'Yonex Aerus Z Badminton Shoes', 'Ultra-lightweight shoes for speed and control.', 2800000, 30, 2, 3, NULL),
(9, 'Li-Ning Pro Court Tennis Shoes', 'Anti-slip sole and heel protection.', 2400000, 45, 2, 4, NULL),
(10, 'Decathlon WalkEasy Shoes', 'Comfortable, breathable walking shoes.', 1200000, 70, 2, 5, NULL),

(11, 'Yonex Astrox 88D Badminton Racket', 'Enhanced power and precision with Namd technology.', 3500000, 25, 3, 3, NULL),
(12, 'Li-Ning Turbo Charging 75 Racket', 'Carbon frame with strong repulsion.', 3200000, 20, 3, 4, NULL),
(13, 'Decathlon TR990 Tennis Racket', 'Carbon frame for intermediate players.', 2900000, 15, 3, 5, NULL),
(14, 'Adidas Kalkul A5 Racket', 'Balanced racket suitable for offense and defense.', 2700000, 25, 3, 2, NULL),
(15, 'Nike Speed Shot Racket', 'Aerodynamic design for maximum swing speed.', 3100000, 18, 3, 1, NULL),

(16, 'Decathlon Water Bottle', '750ml leak-proof and easy-to-clean sports bottle.', 150000, 200, 4, 5, NULL),
(17, 'Nike Gym Bag', 'Water-resistant gym bag with separate shoe compartment.', 250000, 100, 4, 1, NULL),
(18, 'Adidas Wristband', 'Elastic and sweat-absorbing wristband.', 90000, 300, 4, 2, NULL),
(19, 'Yonex 3-Compartment Sports Bag', 'Spacious and moisture-resistant sports bag.', 550000, 60, 4, 3, NULL),
(20, 'Li-Ning Headband', 'Stretchable headband that keeps hair in place.', 80000, 250, 4, 4, NULL);
