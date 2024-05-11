<?php
//quản lý tài khoản người dùng admin
@include 'config.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if(!isset($admin_id)){
   header('location:login.php');
};
//Xóa tài khoản admin:
if(isset($_GET['delete'])){
   
   $delete_id = $_GET['delete'];
   $delete_users = $conn->prepare("DELETE FROM `users` WHERE id = ?");
   $delete_users->execute([$delete_id]);
   header('location:admin_users.php');

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin_SumAdmin</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/admin_style.css">
   <link rel="stylesheet" href="css/quangcao.css">

</head>
<body>
   
<?php include 'admin_header.php'; ?>

<section class="user-accounts">

   <h1 class="title">Tổng tài khoản ADMIM</h1>

   <div class="box-container">

      <?php
      //Hiển thị danh sách tài khoản admin
         $select_users = $conn->prepare("SELECT * FROM `users` WHERE `user_type`= 'admin'");
         $select_users->execute();
         while($fetch_users = $select_users->fetch(PDO::FETCH_ASSOC)){
      ?>
      <!--Hiển thị thông tin tài khoản admin và tùy chọn xóa-->
      <div class="box" style="<?php if($fetch_users['id'] == $admin_id){ echo 'display:none'; }; ?>">
         <img src="uploaded_img/<?= $fetch_users['image']; ?>" alt="">
         <p> user id : <span><?= $fetch_users['id']; ?></span></p>
         <p> Tên : <span><?= $fetch_users['name']; ?></span></p>
         <p> Email : <span><?= $fetch_users['email']; ?></span></p>
         <p> Loại tài khoản : <span style=" color:<?php if($fetch_users['user_type'] == 'admin'){ echo 'orange'; }; ?>"><?= $fetch_users['user_type']; ?></span></p>
         <a href="admin_users.php?delete=<?= $fetch_users['id']; ?>" onclick="return confirm('Xóa tài khoản người dùng không?');" class="delete-btn">Xóa</a>
      </div>
      <?php
      }
      ?>
   </div>

</section>
<script src="js/script.js"></script>

</body>
</html>