<?php
// Giả sử đã có code để kết nối với cơ sở dữ liệu
$result = $conn->query("SELECT username, message FROM messages ORDER BY id DESC");

$messages = '';
while ($row = $result->fetch_assoc()) {
    $messages .= '<p><strong>' . htmlspecialchars($row['username'], ENT_QUOTES, 'UTF-8') . ':</strong> ' . htmlspecialchars($row['message'], ENT_QUOTES, 'UTF-8') . '</p>';
}

echo $messages;
?>
