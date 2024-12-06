-- Tạo cơ sở dữ liệu và chọn cơ sở dữ liệu
CREATE DATABASE tlunews;
USE tlunews;

-- Tạo bảng users
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Tự động tăng cho cột id
    username VARCHAR(255) NOT NULL,     -- Cột username không được để trống
    password VARCHAR(255) NOT NULL,     -- Cột password không được để trống
    role INT NOT NULL -- 0: người dùng, 1: quản trị viên (Không cần CHECK)
);

-- Tạo bảng categories
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Tự động tăng cho cột id
    name VARCHAR(255) NOT NULL          -- Cột name không được để trống
);

-- Tạo bảng news
CREATE TABLE news (
    id INT PRIMARY KEY AUTO_INCREMENT,   -- Tự động tăng cho cột id
    title VARCHAR(255) NOT NULL,         -- Cột title không được để trống
    content TEXT NOT NULL,               -- Cột content không được để trống
    image VARCHAR(255),                  -- Cột image có thể để trống
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Sử dụng CURRENT_TIMESTAMP thay vì GETDATE()
    category_id INT NOT NULL,
    CONSTRAINT FK_News_Category FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Thêm dữ liệu mẫu vào bảng users
INSERT INTO users (username, password, role) VALUES
('admin', 'adminpassword', 1), -- Quản trị viên
('user1', 'userpassword1', 0), -- Người dùng
('user2', 'userpassword2', 0); -- Người dùng

-- Thêm dữ liệu mẫu vào bảng categories
INSERT INTO categories (name) VALUES
('Thể thao'),
('Công nghệ'),
('Giải trí'),
('Kinh doanh'),
('Sức khỏe');

-- Thêm dữ liệu mẫu vào bảng news
INSERT INTO news (title, content, image, created_at, category_id) VALUES
('Bóng đá Việt Nam chiến thắng!', 'Đội tuyển Việt Nam đã giành chiến thắng trong trận đấu...', 'football.jpg', NOW(), 1),
('Điện thoại mới nhất được ra mắt', 'Hãng ABC đã công bố điện thoại thế hệ mới với các tính năng...', 'newphone.jpg', NOW(), 2),
('Bộ phim bom tấn sắp ra mắt', 'Bộ phim hành động XYZ sẽ chính thức ra rạp vào ngày...', 'movie.jpg', NOW(), 3),
('Kinh tế thế giới đang phục hồi', 'Các chuyên gia nhận định nền kinh tế toàn cầu đang có dấu hiệu phục hồi...', 'economy.jpg', NOW(), 4),
('Lợi ích của việc uống đủ nước', 'Nước rất quan trọng đối với cơ thể, giúp tăng cường sức khỏe...', 'health.jpg', NOW(), 5);