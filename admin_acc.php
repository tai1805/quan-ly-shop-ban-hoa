<?php
//quản trị người dùng trong hệ thống 
@include 'config.php';

session_start();

$admin_id = $_SESSION['admin_id']; // Lấy admin_id từ phiên đang hoạt động

if(!isset($admin_id)){
   header('location:home.php'); // Nếu không có admin_id, chuyển hướng đến trang đăng nhập
};

if(isset($_GET['delete'])){
   // Lấy ID người dùng cần xóa từ tham số trong URL

   $delete_id = $_GET['delete'];
   // Xóa người dùng từ cơ sở dữ liệu
   $delete_users = $conn->prepare("DELETE FROM `users` WHERE id = ?");
   $delete_users->execute([$delete_id]);
   // Sau khi xóa, chuyển hướng lại đến trang quản trị người dùng
   header('location:admin_users.php');

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Quản trị - Người dùng</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="icon" href="images/logo.jpg"/>
   

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/admin_style.css">
   <link rel="stylesheet" href="css/table.css">



</head>
<body>
   
<?php include 'admin_header.php'; ?>

<section class="user-accounts">

   <h1 class="title">Tài khoản người dùng</h1>
   <?php
         // Truy vấn và lấy danh sách người dùng từ cơ sở dữ liệu
         $select_users = $conn->prepare("SELECT * FROM `users`");
         $select_users->execute();
         while($fetch_users = $select_users->fetch(PDO::FETCH_ASSOC)){
      ?>

<table>
   <!-- Hiển thị thông tin người dùng trong bảng -->
   <tr>
      <th>Ảnh đại diện</th>
      <th>ID người dùng</th>
      <th>Tên người dùng</th>
      <th>Email</th>
      <th>Kiểu tài khoản</th>
      <th>Thiết lập</th>
   </tr>
   <br>
   <tr>
      <!-- Các dữ liệu tương ứng với thông tin người dùng -->
      <div class="box-containers">
      <div class="box" style="<?php if($fetch_users['id'] == $admin_id){ echo 'display:none'; }; ?>">
         <td><img src="uploaded_img/<?= $fetch_users['image']; ?>" alt=""></td>
         <td><p><span><?= $fetch_users['id']; ?></span></p></td>
         <td><p><span><?= $fetch_users['name']; ?></span></p></td>
         <td><p><span><?= $fetch_users['email']; ?></span></p></td>
         <td><p><span style=" color:<?php if($fetch_users['user_type'] == 'admin'){ echo 'orange'; }; ?>"><?= $fetch_users['user_type']; ?></span></p></td>
         <td><a href="admin_users.php?delete=<?= $fetch_users['id']; ?>" onclick="return confirm('Bạn muốn xóa tài khoản này?');" class="delete-btn">Xóa</a></td>
      </div>
      
      <?php
      }
      ?>
      </div>
   </tr>
   <br>
</table>

</section>
<script src="js/script.js"></script>

</body>
</html>