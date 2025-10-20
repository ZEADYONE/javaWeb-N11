-- Thêm dữ liệu mẫu cho bảng Brand (không trùng nếu đã tồn tại)

INSERT INTO brand (name)
SELECT 'Nike'
WHERE NOT EXISTS (SELECT 1 FROM brand WHERE name = 'Nike');

INSERT INTO brand (name)
SELECT 'Adidas'
WHERE NOT EXISTS (SELECT 1 FROM brand WHERE name = 'Adidas');

INSERT INTO brand (name)
SELECT 'Puma'
WHERE NOT EXISTS (SELECT 1 FROM brand WHERE name = 'Puma');

INSERT INTO brand (name)
SELECT 'New Balance'
WHERE NOT EXISTS (SELECT 1 FROM brand WHERE name = 'New Balance');

INSERT INTO brand (name)
SELECT 'Converse'
WHERE NOT EXISTS (SELECT 1 FROM brand WHERE name = 'Converse');
