-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 03, 2023 lúc 07:22 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshopbanhoa`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `id` int(11) NOT NULL,
  `Mand` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SoSao` int(11) NOT NULL,
  `BinhLuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NgayLap` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(12, 39, 'ngoc huyen', 'nh@gmail.com', '0789624877', 'Hoa đẹp lắm, rất tươi. ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(219, 39, 'thanh', '07896247855', 'dangd0468@gmail.com', 'Thanh toán khi nhập hàng', 'nhà tui vung liem  Vĩnh Long  Việt Nam', ', Hoa khai trương - Alluring  ( 1 ), Hoa hồng - Touch my heart ( 1 )', 3550000, '09-Nov-2023', 'Đã hoàn thành'),
(220, 39, 'Chu Vĩnh Hằng ', '0789542112', 'nh@gmail.com', 'Chuyển khoản', '084 cần thơ Vĩnh Long  viet nam', ', Hoa khai trương - Tài lộc ( 1 )', 2279000, '09-Nov-2023', 'Chưa hoàn thành'),
(221, 40, 'ngochuyen', '0966625484', 'huyenit200x@gmail.com', 'Thanh toán khi nhập hàng', '0 Tiền giang tiền giang Việt Nam', ', Hoa hồng - Touch my heart ( 1 )', 1300000, '03-Dec-2023', 'pending');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `details`, `price`, `quantity`, `image`) VALUES
(465, 'Hoa hồng - Touch my heart', 'Hoatuoi', 'Tình yêu là thứ tình cảm tuyệt vời nhất, đem lại nhiều điều bất ngờ và hạnh phúc nhất cho mỗi người. Tình yêu tiếp thêm sức mạnh giúp ta yêu cuộc sống hơn, giúp chúng ta hoàn thiện bản thân và trở thành người hạnh phúc. Vì tình yêu chúng ta có thể làm những điều kỳ diệu. Vì vậy, cứ yêu đi vì cuộc đời cho phép, hãy dùng tình yêu của bạn để chạm vào một trái tim cùng nhịp đập.', 1300000, 3, 'Hoatuoi.png'),
(467, 'Hoa cưới - Giây Phút Êm Đềm', 'Hoacuoi', 'Bó hoa đơn giản với hoa hồng trắng phối hợp cùng hoa baby tạo nên sức cuốn hút đặc biệt. Màu trắng của sự tinh khôi như màu váy cô dâu trong ngày vui trọng đại của đời mình. Bó hoa khoác lên mình một vẻ đẹp sang trọng đến lạ lùng.', 85000, 1, 'Hoacuoi1.png'),
(468, 'Hoa Tươi - Điều Mong Ước', 'Hoatuoi', 'Điều mong ước lớn nhất trong anh là sự hạnh phúc của em. Anh có thể làm mọi điều chỉ mong em hạnh phúc. Dù có chuyện gì xảy đến hãy vững tin rằng vẫn còn có anh. Anh vẫn luôn bên em để bước đi cùng với nhau. Tháng ngày bên nhau đến cuôi con đường', 900000, 2, 'Hoatuoi_dieumonguoc.png'),
(469, 'Hoa khai trương - Alluring ', 'Hoakhaitruong', 'Hoa khai trương không chỉ đơn thuần là một món quà trang trọng mà còn mang ý nghĩa tôn kính và chúc mừng sự thành công trong tương lai. Điều này thể hiện lòng quan tâm và ủng hộ từ người tặng.', 2250000, 2, 'Hoakhaitruong_1.png'),
(470, 'Hoa khai trương - Tài lộc', 'Hoakhaitruong', 'Có những cánh hoa nằm êm đềm phơi nắng sáng để lại một khoảng êm đềm trong ta. Ta như người mê ngủ say giấc nồng chẳng muốn thức dậy. Có một chút sắc vàng vươn lên dữ dội không chút khiêm nhường, là em đó những cánh hồng  mạnh mẽ. Khám phá ngay ý nghĩa của hoa khai trương Tài Lộc nhé!', 2279000, 1, 'hoakhaitruong_2.png'),
(471, 'thanh thao ', 'Hoacuoi', 'ksjjjocpcojopcc', 1589244, 2, 'Hoacuoi14.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user',
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `image`) VALUES
(38, 'ngochuyen', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 'admin', 'nen.png'),
(39, 'thanhthao', 'thanhthao@gmail.com', '202cb962ac59075b964b07152d234b70', 'user', 'gau.jpg'),
(40, 'Huyen', 'huyenit200x@gmail.com', '202cb962ac59075b964b07152d234b70', 'user', 'nen.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD KEY `fk_dg_pd` (`id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=663;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `fk_dg_pd` FOREIGN KEY (`id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
