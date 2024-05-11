<?php
// Giả sử đã có code để kết nối với cơ sở dữ liệu
$message = $_POST['message'] ?? '';
$username = 'Guest'; // Bạn có thể thêm tính năng đăng nhập để thay thế

// Đảm bảo tin nhắn không rỗng
if (!empty($message)) {
    // Lưu tin nhắn vào cơ sở dữ liệu
    // Bạn cần tạo cấu trúc cơ sở dữ liệu phù hợp và thay thế câu lệnh SQL tương ứng
    $stmt = $conn->prepare("INSERT INTO messages (username, message) VALUES (?, ?)");
    $stmt->bind_param("ss", $username, $message);
    $stmt->execute();

    echo htmlspecialchars($message, ENT_QUOTES, 'UTF-8'); // Trả về tin nhắn đã được mã hóa để hiển thị
}
?>
