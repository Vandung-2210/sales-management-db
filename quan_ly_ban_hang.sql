-- [Bài tập] Xây dựng cơ sở dữ liệu quản lý bán hàng

CREATE DATABASE IF NOT EXISTS QuanLyBanHang;
USE QuanLyBanHang;

-- Xóa bảng cũ nếu tồn tại (theo thứ tự tránh lỗi khóa ngoại)
DROP TABLE IF EXISTS OrderDetail;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;

-- 1. Bảng Customer: lưu danh sách khách hàng
CREATE TABLE Customer (
    cID INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(100) NOT NULL,
    cAge TINYINT CHECK (cAge > 0)
);

-- 2. Bảng Order: lưu hóa đơn mua hàng
CREATE TABLE `Order` (
    oID INT AUTO_INCREMENT PRIMARY KEY,
    cID INT NOT NULL,
    oDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    oTotalPrice DECIMAL(15, 2) DEFAULT 0.00,
    FOREIGN KEY (cID) REFERENCES Customer(cID) ON DELETE CASCADE
);

-- 3. Bảng Product: lưu thông tin sản phẩm
CREATE TABLE Product (
    pID INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(255) NOT NULL,
    pPrice DECIMAL(12, 2) NOT NULL CHECK (pPrice >= 0)
);

-- 4. Bảng OrderDetail: chi tiết từng sản phẩm trong mỗi hóa đơn
CREATE TABLE OrderDetail (
    oID INT NOT NULL,
    pID INT NOT NULL,
    odQTY INT NOT NULL CHECK (odQTY > 0),
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID) ON DELETE CASCADE,
    FOREIGN KEY (pID) REFERENCES Product(pID) ON DELETE RESTRICT
);
