-- Tạo database cho hệ thống quản lý ký túc xá
CREATE DATABASE IF NOT EXISTS dormitory_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE dormitory_management;

-- Bảng phòng (Room)
CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type VARCHAR(50) NOT NULL,
    room_price DOUBLE NOT NULL,
    max_occupancy INT NOT NULL DEFAULT 4,
    is_occupied BOOLEAN DEFAULT FALSE,
    additional_fee DOUBLE DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Bảng sinh viên (Student) - student_id là khóa chính có thể nhập thủ công
CREATE TABLE students (
    student_id INT PRIMARY KEY NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Nam', 'Nữ', 'Khác') NOT NULL,
    address TEXT,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    room_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE SET NULL
);

-- Bảng hợp đồng (Contract)
CREATE TABLE contracts (
    contract_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    room_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    room_price DOUBLE NOT NULL,
    payment_method VARCHAR(50) DEFAULT 'Tiền mặt',
    status ENUM('Đang hiệu lực', 'Hết hạn', 'Đã hủy') DEFAULT 'Đang hiệu lực',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE CASCADE,
    UNIQUE KEY unique_student_contract (student_id, status)
);

-- Bảng phí (Fee)
CREATE TABLE fees (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    fee_type ENUM('WATER', 'ELECTRICITY', 'CLEANING') NOT NULL,
    amount DOUBLE NOT NULL,
    payment_date DATE,
    payment_method VARCHAR(50) DEFAULT 'Tiền mặt',
    month_year VARCHAR(7) NOT NULL, -- Format: MM/YYYY
    status ENUM('Chưa thanh toán', 'Đã thanh toán') DEFAULT 'Chưa thanh toán',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

-- Tạo index để tối ưu hiệu suất truy vấn
CREATE INDEX idx_students_room_id ON students(room_id);
CREATE INDEX idx_contracts_student_id ON contracts(student_id);
CREATE INDEX idx_contracts_room_id ON contracts(room_id);
CREATE INDEX idx_fees_student_id ON fees(student_id);
CREATE INDEX idx_fees_type ON fees(fee_type);
CREATE INDEX idx_fees_month_year ON fees(month_year);

-- Thêm dữ liệu mẫu cho bảng rooms
INSERT INTO rooms (room_number, room_type, room_price, max_occupancy, additional_fee) VALUES
('101', 'A', 1500000, 4, 200000),
('102', 'B', 1200000, 4, 0),
('103', 'A', 1500000, 4, 200000),
('104', 'B', 1200000, 4, 0),
('105', 'A', 1500000, 4, 200000),
('201', 'B', 1200000, 4, 0),
('202', 'A', 1500000, 4, 200000),
('203', 'B', 1200000, 4, 0),
('204', 'A', 1500000, 4, 200000),
('205', 'B', 1200000, 4, 0);

-- Thêm dữ liệu mẫu cho bảng students - student_id được nhập thủ công
INSERT INTO students (student_id, full_name, date_of_birth, gender, address, phone_number, email, room_id) VALUES
(20215007, 'Nghiêm Xuân Diện', '2003-05-15', 'Nam', 'Hà Nội', '0123456789', 'dien.nx@email.com', 1),
(20215014, 'Trần Đình Dũng', '2003-08-20', 'Nam', 'Hải Phòng', '0123456790', 'dung.td@email.com', 1),
(20215103, 'Ngọ Doãn Ngọc', '2003-03-10', 'Nam', 'Nam Định', '0123456791', 'ngoc.nd@email.com', 2),
(20215139, 'Phạm Minh Thắng', '2003-12-05', 'Nam', 'Thái Bình', '0123456792', 'thang.pm@email.com', 2),
(20215001, 'Nguyễn Thị Lan', '2003-06-18', 'Nữ', 'Hà Nội', '0123456793', 'lan.nt@email.com', 3),
(20215002, 'Lê Văn Nam', '2003-09-22', 'Nam', 'Quảng Ninh', '0123456794', 'nam.lv@email.com', 3),
(20215003, 'Trần Thị Hoa', '2003-04-12', 'Nữ', 'Hưng Yên', '0123456795', 'hoa.tt@email.com', 4),
(20215004, 'Phạm Văn Đức', '2003-11-08', 'Nam', 'Vĩnh Phúc', '0123456796', 'duc.pv@email.com', 4);

-- Cập nhật trạng thái phòng có sinh viên
UPDATE rooms SET is_occupied = TRUE WHERE room_id IN (1, 2, 3, 4);

-- Thêm dữ liệu mẫu cho bảng contracts
INSERT INTO contracts (student_id, room_id, start_date, end_date, room_price, payment_method) VALUES
(20215007, 1, '2024-09-01', '2025-06-30', 1500000, 'Chuyển khoản'),
(20215014, 1, '2024-09-01', '2025-06-30', 1500000, 'Tiền mặt'),
(20215103, 2, '2024-09-01', '2025-06-30', 1200000, 'Chuyển khoản'),
(20215139, 2, '2024-09-01', '2025-06-30', 1200000, 'Tiền mặt'),
(20215001, 3, '2024-09-01', '2025-06-30', 1500000, 'Chuyển khoản'),
(20215002, 3, '2024-09-01', '2025-06-30', 1500000, 'Tiền mặt'),
(20215003, 4, '2024-09-01', '2025-06-30', 1200000, 'Chuyển khoản'),
(20215004, 4, '2024-09-01', '2025-06-30', 1200000, 'Tiền mặt');

-- Thêm dữ liệu mẫu cho bảng fees
INSERT INTO fees (student_id, fee_type, amount, month_year, status) VALUES
-- Phí tháng 01/2025
(20215007, 'ELECTRICITY', 150000, '01/2025', 'Đã thanh toán'),
(20215007, 'WATER', 80000, '01/2025', 'Đã thanh toán'),
(20215007, 'CLEANING', 50000, '01/2025', 'Đã thanh toán'),
(20215014, 'ELECTRICITY', 160000, '01/2025', 'Chưa thanh toán'),
(20215014, 'WATER', 85000, '01/2025', 'Chưa thanh toán'),
(20215014, 'CLEANING', 50000, '01/2025', 'Chưa thanh toán'),
(20215103, 'ELECTRICITY', 140000, '01/2025', 'Đã thanh toán'),
(20215103, 'WATER', 75000, '01/2025', 'Đã thanh toán'),
(20215103, 'CLEANING', 50000, '01/2025', 'Đã thanh toán'),
(20215139, 'ELECTRICITY', 145000, '01/2025', 'Chưa thanh toán'),
(20215139, 'WATER', 78000, '01/2025', 'Chưa thanh toán'),
(20215139, 'CLEANING', 50000, '01/2025', 'Chưa thanh toán'),

-- Phí tháng 02/2025
(20215007, 'ELECTRICITY', 155000, '02/2025', 'Chưa thanh toán'),
(20215007, 'WATER', 82000, '02/2025', 'Chưa thanh toán'),
(20215007, 'CLEANING', 50000, '02/2025', 'Chưa thanh toán'),
(20215103, 'ELECTRICITY', 148000, '02/2025', 'Chưa thanh toán'),
(20215103, 'WATER', 77000, '02/2025', 'Chưa thanh toán'),
(20215103, 'CLEANING', 50000, '02/2025', 'Chưa thanh toán');

-- Tạo các view để hỗ trợ báo cáo và thống kê (đã cập nhật loại bỏ student_code)
-- View thống kê sinh viên theo phòng
CREATE VIEW student_room_summary AS
SELECT 
    r.room_number,
    r.room_type,
    r.room_price,
    r.max_occupancy,
    COUNT(s.student_id) as current_occupancy,
    (r.max_occupancy - COUNT(s.student_id)) as available_slots
FROM rooms r
LEFT JOIN students s ON r.room_id = s.room_id
GROUP BY r.room_id, r.room_number, r.room_type, r.room_price, r.max_occupancy;

-- View thống kê phí theo sinh viên (đã cập nhật loại bỏ student_code)
CREATE VIEW student_fee_summary AS
SELECT 
    s.student_id,
    s.full_name,
    f.month_year,
    SUM(CASE WHEN f.fee_type = 'ELECTRICITY' THEN f.amount ELSE 0 END) as electricity_fee,
    SUM(CASE WHEN f.fee_type = 'WATER' THEN f.amount ELSE 0 END) as water_fee,
    SUM(CASE WHEN f.fee_type = 'CLEANING' THEN f.amount ELSE 0 END) as cleaning_fee,
    SUM(f.amount) as total_fee,
    COUNT(CASE WHEN f.status = 'Đã thanh toán' THEN 1 END) as paid_count,
    COUNT(CASE WHEN f.status = 'Chưa thanh toán' THEN 1 END) as unpaid_count
FROM students s
LEFT JOIN fees f ON s.student_id = f.student_id
GROUP BY s.student_id, s.full_name, f.month_year;

-- View thống kê hợp đồng đang hiệu lực (đã cập nhật loại bỏ student_code)
CREATE VIEW active_contracts AS
SELECT 
    c.contract_id,
    s.student_id,
    s.full_name,
    r.room_number,
    c.start_date,
    c.end_date,
    c.room_price,
    c.payment_method,
    DATEDIFF(c.end_date, CURDATE()) as days_remaining
FROM contracts c
JOIN students s ON c.student_id = s.student_id
JOIN rooms r ON c.room_id = r.room_id
WHERE c.status = 'Đang hiệu lực' AND c.end_date >= CURDATE();

-- Tạo stored procedure để tính tổng doanh thu
DELIMITER //

CREATE PROCEDURE GetMonthlyRevenue(IN target_month VARCHAR(7))
BEGIN
    DECLARE total_room_fee DECIMAL(15,2) DEFAULT 0;
    DECLARE total_other_fee DECIMAL(15,2) DEFAULT 0;
    
    -- Tính tổng phí phòng từ hợp đồng
    SELECT COALESCE(SUM(room_price), 0) INTO total_room_fee
    FROM contracts 
    WHERE status = 'Đang hiệu lực'
    AND DATE_FORMAT(start_date, '%m/%Y') <= target_month
    AND DATE_FORMAT(end_date, '%m/%Y') >= target_month;
    
    -- Tính tổng các phí khác đã thanh toán
    SELECT COALESCE(SUM(amount), 0) INTO total_other_fee
    FROM fees 
    WHERE month_year = target_month 
    AND status = 'Đã thanh toán';
    
    SELECT 
        target_month as month_year,
        total_room_fee as room_revenue,
        total_other_fee as other_revenue,
        (total_room_fee + total_other_fee) as total_revenue;
END //

DELIMITER ;

-- Tạo trigger để tự động cập nhật trạng thái phòng
DELIMITER //

CREATE TRIGGER update_room_status_after_student_insert
AFTER INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.room_id IS NOT NULL THEN
        UPDATE rooms 
        SET is_occupied = TRUE 
        WHERE room_id = NEW.room_id;
    END IF;
END //

CREATE TRIGGER update_room_status_after_student_delete
AFTER DELETE ON students
FOR EACH ROW
BEGIN
    IF OLD.room_id IS NOT NULL THEN
        UPDATE rooms 
        SET is_occupied = CASE 
            WHEN (SELECT COUNT(*) FROM students WHERE room_id = OLD.room_id) = 0 
            THEN FALSE 
            ELSE TRUE 
        END
        WHERE room_id = OLD.room_id;
    END IF;
END //

DELIMITER ;

-- Kiểm tra dữ liệu đã tạo
SELECT 'Rooms created:' as info, COUNT(*) as count FROM rooms
UNION ALL
SELECT 'Students created:', COUNT(*) FROM students
UNION ALL
SELECT 'Contracts created:', COUNT(*) FROM contracts
UNION ALL
SELECT 'Fees created:', COUNT(*) FROM fees;