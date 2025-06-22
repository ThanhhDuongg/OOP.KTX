# Practice 1 – OOP_N01_Term3_2025_K17_Group9

## Câu 1. Tiêu đề của bài tập lớn cuối kỳ

**Phần mềm quản lý ký túc xá**  
*(Dormitory Management Software)*

---

## Câu 2. Phân tích các đối tượng chính

Hệ thống có 4 đối tượng chính:

1. **Sinh viên (Student):**
   - Thông tin cá nhân (họ tên, ngày sinh, giới tính, quê quán, ...)
   - Thông tin liên hệ
   - Thông tin về phòng ở
   - Thông tin về hợp đồng

2. **Phòng (Room):**
   - Thông tin về phòng (số phòng, loại phòng, số giường, giá phòng, ...)
   - Danh sách sinh viên ở

3. **Hợp đồng (Contract):**
   - Thông tin về hợp đồng (mã hợp đồng, ngày bắt đầu, ngày kết thúc, giá phòng, hình thức thanh toán, ...)

4. **Phí (Fee):**
   - Thông tin về các loại phí (phí điện, phí nước, phí vệ sinh, ...)

---

## Câu 3. Cấu trúc folder của Project

```plaintext
DormitoryManagement/
├── src/
│   ├── model/
│   │   ├── Student.java
│   │   ├── Room.java
│   │   ├── Contract.java
│   │   └── Fee.java
│   └── Main.java
├── test/
│   ├── TestStudent.java
├── README.md
## Câu 4. Các class đã xây dựng

Chúng em viết 7 class cho 4 đối tượng đã xác định ở câu 2 (bao gồm class Main).

- **Đối tượng sinh viên:**  
  - Student (class sinh viên)
- **Đối tượng phòng:**  
  - Room (class phòng)
- **Đối tượng hợp đồng:**  
  - Contract (class hợp đồng)
- **Đối tượng phí:**  
  - Fee (class phí)
- **Các class bổ sung:**  
  - FeeType (loại phí)  
  - PaymentStatus (trạng thái thanh toán)  
  - Main (class chạy chương trình)

*(Các chức năng cơ bản của từng class đã trình bày ở Câu 2.)*
