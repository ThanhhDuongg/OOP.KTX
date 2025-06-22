# OOP_N01_Term3_2025_K17_Group9
# Phần 1: Tổng quan về Project
# Dormitory Management System (OOP Term Project)
Group 9
Members;

Nguyễn Tùng Bách
Github: BachNguyenn

Nguyễn Thành Dương
Github: ThanhhDuongg

Lê Duy Thái Dương
Github: Nora-LeDuong

Nguyễn Lệ Thu
Github: nglthu

---
## 1. Giới thiệu

**Dormitory Management System** là ứng dụng quản lý ký túc xá, phát triển bằng Java Spring Boot, cho phép quản lý toàn diện thông tin sinh viên, phòng ở, hợp đồng và phí dịch vụ trong ký túc xá. Ứng dụng hỗ trợ CRUD, giao diện web thân thiện, kiểm thử, lưu trữ dữ liệu lên Cloud MySQL và đáp ứng đầy đủ các tiêu chí của bài tập lớn OOP.

---

## 2. Tính năng nổi bật

- Quản lý sinh viên: thêm, sửa, xóa, tìm kiếm, hiển thị chi tiết, phân loại theo phòng, hợp đồng.
- Quản lý phòng: thêm, sửa, xóa, xem danh sách sinh viên trong từng phòng, loại phòng, số lượng giường.
- Quản lý hợp đồng: lập hợp đồng ở, cập nhật ngày bắt đầu/kết thúc, trạng thái, liên kết sinh viên và phòng.
- Quản lý phí: lưu và quản lý các loại phí (điện, nước, vệ sinh, v.v.), trạng thái thanh toán.
- Giao diện đồ họa (web) hiện đại, dễ sử dụng.
- Xử lý lỗi và kiểm thử tự động (Test).
- Lưu trữ, thao tác dữ liệu với Cloud MySQL và các Collection như ArrayList, Map…
- Đầy đủ các yêu cầu theo hướng dẫn báo cáo của trường.

---

## 3. Công nghệ sử dụng

- **Backend:** Java, Spring Boot, Spring MVC, JPA/Hibernate
- **Frontend:** Thymeleaf, Bootstrap (hoặc tương đương)
- **Database:** Cloud MySQL (Aiven), lưu trữ dữ liệu thực tế
- **Testing:** JUnit, TestNG (tùy chọn)
- **Quản lý mã nguồn:** GitHub

---

## 4. Kiến trúc dự án

Áp dụng mô hình **MVC (Model - View - Controller)**.  
Có đầy đủ các thành phần:  
- **Model:** Student, Room, Contract, Fee, PaymentStatus, FeeType
- **View:** Các trang giao diện quản lý (Spring Boot Web)
- **Controller:** Điều phối logic, kết nối Model - View

**Cấu trúc thư mục ví dụ:**
```plaintext
OOP_N01_Term3_2025_K17_Group9/
├── src/
│   ├── main/
│   │   ├── java/com/example/dorm_web/
│   │   │   ├── controller/
|   |   |   |___exception/
│   │   │   ├── model/
│   │   │   ├── repository/
│   │   │   ├── service/
│   │   │   └── DormWebApplication.java
│   │   └── resources/
│   │       ├── static/
│   │       └── templates/
│   │           └── *.html
├── test/
│   └── java/com/example/dorm_web/
│       └── ... (unit test)
├── README.md
└── ...
```

## 5. Đối tượng và chức năng (Objects & CRUD)

### 5.1. Đối tượng chính

- **Sinh viên (Student)**
    - Thông tin cá nhân, liên hệ, phòng, hợp đồng
    - CRUD: Thêm, sửa, xóa, tìm kiếm, xem chi tiết
- **Phòng (Room)**
    - Số phòng, loại phòng, số giường, danh sách sinh viên
    - CRUD: Thêm, sửa, xóa, xem danh sách
- **Hợp đồng (Contract)**
    - Liên kết sinh viên, phòng, ngày bắt đầu/kết thúc, trạng thái
    - CRUD: Thêm, sửa, xóa, hiển thị thông tin
- **Phí (Fee)**
    - Các loại phí: điện, nước, vệ sinh, trạng thái thanh toán
    - CRUD: Thêm, sửa, xóa, cập nhật trạng thái

---

## 6. Tương tác & hoạt động chính

- **Liên kết giữa các đối tượng:**  
    - Sinh viên đăng ký phòng → sinh viên có hợp đồng phòng.
    - Mỗi phòng có danh sách sinh viên.
    - Mỗi hợp đồng liên kết sinh viên và phòng, có ngày bắt đầu/kết thúc, trạng thái.
    - Phí liên kết với hợp đồng/sinh viên, cập nhật trạng thái thanh toán.
- **Tính năng tìm kiếm, lọc, thống kê (filter, search, statistics).**
- **Hoạt động chính:**  
    - Quản lý chu trình từ đăng ký ở ký túc xá → tạo hợp đồng → phát sinh phí → thanh toán.

---

## 7. UML Diagram & Sơ đồ thuật toán

- Sơ đồ UML:
  ![image](https://github.com/user-attachments/assets/8b01904d-db98-4db3-a3d6-8951e7230177)

- Đầy đủ các sơ đồ Use Case, Class Diagram, Sequence Diagram,... (xem file `/uml` trong repo hoặc báo cáo giấy).

---

## 8. Xử lý lỗi và kiểm thử (Exception Handling & Testing)

- Tất cả các chức năng được bọc trong try-catch đồng thời có thêm file GlobalExceptionHandler.java để xử lý toàn cụccục, xử lý và hiển thị thông báo lỗi rõ ràng, không làm gián đoạn chương trình.
- Có unit test cho các class nghiệp vụ chính.

---

## 9. Hướng dẫn cài đặt & chạy

1. Clone repository về máy:
    ```bash
    git clone https://github.com/BachNguyenn/dorm_web.git
    ```
2. Import project vào IDE (IntelliJ/VS Code/Eclipse)
3. Cấu hình `application.properties` để kết nối Cloud MySQL.
4. Chạy ứng dụng:
    ```bash
    ./mvnw spring-boot:run
    ```
5. Truy cập giao diện web tại `http://localhost:8080`

---

## 10. Liên kết hữu ích

- **Source code:** [GitHub Repo](https://github.com/BachNguyenn/dorm_web)
- **Demo Youtube:** (Thêm link nếu có)
- **Public deployment:** (Thêm link nếu có)
- **Báo cáo PDF:** (Thêm link nếu có)

---

## 11. Đóng góp & Phân chia công việc

- [Tên thành viên 1] – Chức năng X, Y
- [Tên thành viên 2] – Chức năng Z, kiểm thử,...
- [Tên thành viên 3] - Chức năng ABCD
- [Tên thành viên 4] - Hướng dẫn, giảng dạy
- Đóng góp:(theo báo cáo)
---

> **Tài liệu tham khảo:**

- Giáo trình OOP Đại học Phenikaa 
- [Spring Boot Reference Documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/)
- [Spring Data JPA Documentation](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/)
- [Exception Handling in Spring Boot REST API - Baeldung](https://www.baeldung.com/exception-handling-for-rest-with-spring)
- [Testing in Spring Boot (Spring Official)](https://spring.io/guides/gs/testing-web/)
- [Introduction to Maven - Baeldung](https://www.baeldung.com/maven)

---

# Phần 2: Trả lời một số yêu cầu trong các hoạt động trên lớp
## 1. Tiêu đề của bài tập lớn cuối kỳ

**Phần mềm quản lý ký túc xá**
*(Dormitory Management Software)*

---

## 2. Phân tích các đối tượng chính

Hệ thống có 4 đối tượng chính:

- **Sinh viên (Student):**
    - Thông tin cá nhân (họ tên, ngày sinh, giới tính, quê quán, ...)
    - Thông tin liên hệ
    - Thông tin về phòng ở
    - Thông tin về hợp đồng

- **Phòng (Room):**
    - Thông tin về phòng (số phòng, loại phòng, số giường, giá phòng, ...)
    - Danh sách sinh viên ở

- **Hợp đồng (Contract):**
    - Thông tin về hợp đồng (mã hợp đồng, ngày bắt đầu, ngày kết thúc, giá phòng, hình thức thanh toán, ...)

- **Phí (Fee):**
    - Thông tin về các loại phí (phí điện, phí nước, phí vệ sinh, ...)

---

## 3. Cấu trúc folder của Project
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
```
---

## 4. Các class đã xây dựng

Chúng em viết 7 class cho 4 đối tượng đã xác định ở câu 2 (bao gồm class Main):

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

(Các chức năng cơ bản của từng class đã trình bày ở Câu 2.)

---

## 5. Kiểm thử lớp Student

Để kiểm tra tính đúng đắn và ổn định của lớp Student, chúng em thực hiện kiểm thử các chức năng chính sau:

- Tạo mới sinh viên với đầy đủ thông tin cá nhân.
- Hiển thị thông tin sinh viên ra màn hình.
- Cập nhật, thay đổi thông tin của sinh viên (ví dụ: số điện thoại, địa chỉ, email).

Việc kiểm thử giúp đảm bảo lớp Student hoạt động chính xác, các thuộc tính được gán và lấy đúng giá trị.

---
# Chức năng chính: Thêm sinh viên kèm hợp đồng thuê KTX

## Mục tiêu

Khi người dùng nhập thông tin sinh viên mới, hệ thống sẽ:

1. Thêm sinh viên vào bảng `students`.
2. Lấy giá phòng từ bảng `rooms`.
3. Thêm hợp đồng thuê mới vào bảng `contracts`.

---

## I. Phân tích chức năng và phân chia công việc

### 1. Các bước xử lý

| Bước | Mô tả                                                         | Thành viên thực hiện           |
|------|---------------------------------------------------------------|-------------------------------|
| 1    | Nhập và lưu thông tin sinh viên vào bảng `students`           | Lê Duy Thái Dương             |
| 2    | Truy vấn lấy giá phòng từ bảng `rooms` dựa trên mã phòng      | Nguyễn Tùng Bách              |
| 3    | Nhập thông tin và lưu hợp đồng thuê vào bảng `contracts`      | Nguyễn Thành Dương            |

**Cả nhóm:** Tích hợp các hàm con thành quy trình hoàn chỉnh, kiểm thử và hoàn thiện báo cáo.

---

### 2. Lưu đồ thuật toán

```mermaid
flowchart TD
    A([Bắt đầu])
    B[Nhập thông tin sinh viên]
    C[Lưu vào bảng students]
    D{Thành công?}
    E[Hiện lỗi \n và Kết thúc]
    F[Lấy giá phòng từ bảng rooms]
    G{Lấy được giá phòng?}
    H[Hiện lỗi \n và Kết thúc]
    I[Nhập & lưu hợp đồng vào bảng contracts]
    J{Thành công?}
    K[Rollback, Hiện lỗi \n và Kết thúc]
    L[Thông báo thành công]
    M([Kết thúc])

    A --> B --> C --> D
    D -- "Không" --> E
    D -- "Có" --> F --> G
    G -- "Không" --> H
    G -- "Có" --> I --> J
    J -- "Không" --> K
    J -- "Có" --> L --> M
```
## II.Ảnh chụp chạy kiểm thửthử
![image](https://github.com/user-attachments/assets/6efddceb-0d4c-4f68-8bd6-b91d0af8c0aa)
---
## Giao diện website
1. Giao diện chính
Khi truy cập vào trang web sẽ có giao diện như sau
![image](https://github.com/user-attachments/assets/fa6680b7-b620-4b1e-904a-604ae9bd3d9d)
Khi nhấn vào phần giới thiệu sẽ tạo pop-up để giới thiệu
![image](https://github.com/user-attachments/assets/bdb444f5-2555-4913-858b-1847a66a5cce)
2. Nhiệm vụ UI trong Practice 8
-Lê Duy Thái Dương: Danh sách sinh viên
![image](https://github.com/user-attachments/assets/d4b54f87-6a86-4854-a25e-8093b50164d6)
-Nguyễn Thành Dương: Chi tiết sinh viên
![image](https://github.com/user-attachments/assets/6d966641-5c9a-4018-a1bb-d8ec321aaa23)
-Nguyễn Tùng Bách: Thêm sinh viên
![image](https://github.com/user-attachments/assets/3183f130-e9b9-4985-bb71-bb0162075b3c)

   

