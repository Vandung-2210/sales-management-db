# [Bài tập] Xây dựng cơ sở dữ liệu Quản lý bán hàng (QuanLyBanHang)

## 1. Cấu trúc các bảng
- **Customer**: `cID` (PK), `cName`, `cAge`
- **Order**: `oID` (PK), `cID` (FK trỏ tới Customer), `oDate`, `oTotalPrice`
- **Product**: `pID` (PK), `pName`, `pPrice`
- **OrderDetail**: `oID` (PK, FK), `pID` (PK, FK), `odQTY`

## 2. Các ràng buộc toàn vẹn
- Khóa chính kết hợp `(oID, pID)` trong bảng `OrderDetail` bảo đảm một mặt hàng chỉ xuất hiện 1 lần trong 1 đơn hàng.
- Ràng buộc `CHECK (odQTY > 0)` và `CHECK (pPrice >= 0)` bảo đảm tính hợp lệ của số lượng và đơn giá.
- Ràng buộc khóa ngoại `FOREIGN KEY` với `ON DELETE CASCADE` và `ON DELETE RESTRICT` để bảo vệ toàn vẹn dữ liệu.
