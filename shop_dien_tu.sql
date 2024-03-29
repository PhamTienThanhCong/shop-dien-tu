-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 06, 2022 lúc 07:51 PM
-- Phiên bản máy phục vụ: 5.7.33
-- Phiên bản PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_dien_tu`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` mediumtext,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `image`, `created_at`) VALUES
(18, 'Tai Nghe Bluetooth ', 'tai-nghe-bluetooth--39', 'Tai nghe bluetooth là dòng sản phẩm tai nghe không dây mang cho mình công nghệ bluetooth có khả năng kết nối được với máy tính hoặc thiết bị di động được sử dụng rộng rãi trên thị trường hiện nay', 0, '1655223571.png', '2022-06-14 16:19:31'),
(19, 'Tai nghe chụp tai', 'tai-nghe-chup-tai', 'Tai nghe chụp tai hay tai nghe trùm đầu là một loại tai nghe có cấu tạo khá phức tạp và kích thước lớn, dùng để bao toàn bộ tai của người dùng. Loại tai nghe này ra đời nhằm mục đích mang lại cho người dùng cảm giác thoải mái, dễ chịu nhất khi sử dụng. Ưu điểm: Thiết kế đẹp, nhiều kiểu dáng để bạn lựa chọn', 0, '1655223651.png', '2022-06-14 16:20:51'),
(20, 'Tai nghe có dây', 'tai-nghe-co-day-11', 'Tai nghe có dây vẫn còn được được tin dùng vì chất lượng âm thanh mà nó mang lại và hạn chế bị mất chất lượng', 0, '1655223689.png', '2022-06-14 16:21:29'),
(21, 'Loa Bluetooth', 'loa-bluetooth-24', 'Loa bluetooth là loại thiết bị khuếch đại âm thanh với khả năng kết nối với nhiều thiết bị điện tử khác nhau như điện thoại thông minh, tablet, laptop nhờ áp dụng công nghệ bluetooth. Loa sẽ được kết nối với các thiết bị khác giúp bạn tận hưởng âm nhạc một cách tiện lợi ở bất kì đâu', 0, '1655223709.png', '2022-06-14 16:21:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `created_at`) VALUES
(8, 40, 4, '2022-06-16 17:50:24'),
(9, 40, 4, '2022-06-17 14:43:39'),
(10, 46, 3, '2022-06-19 10:02:26'),
(11, 47, 4, '2022-06-19 10:04:32'),
(12, 45, 2, '2022-06-19 10:09:18'),
(13, 44, 2, '2022-06-19 10:13:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `selling_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `rate` tinyint(4) DEFAULT NULL,
  `comment` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `user_id`, `product_id`, `order_id`, `selling_price`, `quantity`, `status`, `rate`, `comment`, `created_at`) VALUES
(27, 40, 40, 8, 175, 1, 4, 3, 'cho 3 sao vì thái độ giao hàng của shipper', '2022-06-16 17:49:41'),
(29, 40, 40, 9, 175, 1, 4, 5, 'giao hàng hơi chậm, nhưng chất lượng khá ok', '2022-06-16 19:04:26'),
(30, 40, 39, 9, 154, 1, 4, 5, 'Sản phẩm tốt, rất đang mua nhé mọi người', '2022-06-17 14:41:03'),
(31, 40, 39, NULL, 154, 1, 1, NULL, NULL, '2022-06-17 15:49:09'),
(32, 46, 40, 10, 175, 1, 3, NULL, NULL, '2022-06-19 10:02:10'),
(33, 46, 36, 10, 245, 1, 3, NULL, NULL, '2022-06-19 10:02:15'),
(34, 46, 34, 10, 98, 1, 3, NULL, NULL, '2022-06-19 10:02:22'),
(35, 47, 34, 11, 98, 2, 4, 5, 'Tai nghe rất tốt nhé mọi người', '2022-06-19 10:04:25'),
(36, 47, 33, 11, 105, 1, 4, 5, 'Tai nghe tốt, đáng mua nhé mọi người', '2022-06-19 10:04:27'),
(37, 45, 28, 12, 280, 2, 2, NULL, NULL, '2022-06-19 10:09:02'),
(38, 45, 25, 12, 210, 1, 2, NULL, NULL, '2022-06-19 10:09:03'),
(39, 45, 34, 12, 98, 1, 2, NULL, NULL, '2022-06-19 10:09:07'),
(40, 45, 23, 12, 84, 2, 2, NULL, NULL, '2022-06-19 10:09:10'),
(41, 44, 34, 13, 98, 1, 2, NULL, NULL, '2022-06-19 10:13:24'),
(42, 44, 38, 13, 140, 1, 2, NULL, NULL, '2022-06-19 10:13:27'),
(43, 44, 29, 13, 42, 1, 2, NULL, NULL, '2022-06-19 10:13:29'),
(44, 44, 30, 13, 77, 2, 2, NULL, NULL, '2022-06-19 10:13:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `small_description` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `created_at`) VALUES
(22, 18, 'Tai nghe Bluetooth Apple AirPods Pro 2021 Magsafe', 'tai-nghe-bluetooth-apple-airpods-pro-2021-magsafe-96-74-27', '* Hỗ trợ tính năng chống ồn chủ động ANC\r\n* Tính năng xuyên âm giúp người dùng nghe được âm thanh của môi trường xung quanh\r\n* Thời gian sử dụng 4.5 giờ khi bật chế độ chống ồn,19 giờ khi đi kèm với hộp sạc\r\n* Trang bị cổng sạc Lightning,5 phút sạc cho 1 giờ sử dụng\r\n* Kích hoạt trợ lý ảo Siri bằng cách gọi \"\"\"\"Hey Siri\"\"\"\"\r\n* Chống nước chuẩn IPX4 cho phép thoải mái luyện tập mà không lo thấm mồ hôi\r\n* Có khả năng định vị tai nghe bị thất lạc', 'Tai nghe AirPods Pro Magsafe 2021 - Trải nghiệm âm thanh đầy mê hoặc\r\nThiết kế cải tiến tăng độ êm nhẹ khi đeo\r\nAirPods Pro 2021 được Apple tái thiết kế nhằm mang đến trải nghiệm nghe nhạc êm ái, không gây đau tai cho bạn. Mỗi bên củ tai AirPods Pro 2021 có thiết kế nhét trong, với ba kích thước đệm tai silicone khác nhau cho bạn tự chọn kích thước vừa nhất. Phần đệm tai cũng được Apple thiết kế để ngăn tạp âm lọt vào trong, cho bạn một trải nghiệm nghe nhạc trọn vẹn.\r\n\r\nAirPods Pro Magsafe còn đạt chuẩn chống nước và chống thấm mồ hôi cho các hoạt động tập luyện cường độ nặng. Tai nghe còn tích hợp cổng microphone mở rộng giúp tăng cường chất lượng nghe gọi trong môi trường có gió mạnh.\r\nÂm thanh đẳng cấp, cách âm ưu việt\r\nAirPods Pro 2021 mang đến chất lượng âm thanh đặc sắc và đẳng cấp. Bên trong tai nghe cũng trang bị các phần cứng giúp tăng cường độ mạnh âm bass, cân bằng các dải âm thấp và trung, cũng như lọc tiếng ồn khi thu âm giọng nói cho chất lượng cuộc gọi tốt hơn.\r\nSạc pin tiện lợi qua cổng USB-C, dùng không ngừng nghỉ\r\nTai nghe AirPods Pro 2021 Magsafe được lưu giữ trong hộp đựng màu trắng sang trọng - và cũng là hộp sạc không dây MagSafe. Hộp sạc được Apple chế tạo giúp tương thích với không chỉ sạc MagSafe, mà còn với nhiều loại đế sạc không dây khác. Và mỗi khi AirPods Pro 2021 đạt trạng thái pin thấp, tai nghe sẽ tự động gửi thông báo đến iPhone cho việc sạc pin kịp thời.', 170, 119, '1655224993.png', 10, 0, '2022-06-14 16:34:29'),
(23, 18, 'Tai nghe không dây JBL Live Pro+', 'tai-nghe-khong-day-jbl-live-pro-73', '* Tính năng chống ồn chủ động,xuyên âm tối ưu hoá trải nghiệm âm nhạc\r\n* 6 Micro đàm thoại,triệt tiêu tiếng ồn xung quanh\r\n* Kết nối ngay khi mở hộp,có thể sử dụng độc lập 1 bên tai\r\n* Điều khiển tiện lợi bằng giọng nói\r\n* Thiết kế kháng nước,mồ hôi cùng cảm giác đeo thoải mái', 'Tai nghe JBL Live Pro+ – Âm thanh chất lượng\r\nJBL là một thương hiệu âm thanh nổi tiếng và được nhiều người biết đến trên thế giới. mới đây hãng vừa cho ra mắt sản phẩm tai nghe không dây mang tên JBL Live Pro Plus. Mẫu tai nghe với âm thanh chất lượng cùng dung lượng pin lớn.\r\nThiết kế nhỏ gọn, hỗ trợ chống nước IPX4\r\nLive Pro Plus sở hữu một thiết kế vô cùng nhỏ gọn với trọng lượng chỉ 10g. Đặc biệt với bộ 5 nút silicone kèm theo giúp tai nghe dễ dàng sử dụng cho nhiều kích thước tai khác nhau.\r\nJBL Live Pro Plus với dung lượng pin lớn với 28 giờ sử dụng\r\nTai nghe không dây JBL Live Pro Plus được trang bị dung lượng pin lớn cho 7 giờ sử dụng mỗi lần sạc cùng 21 giờ trọng hộp, tổng lại người dùng có tới 28 giờ. Đặc biệt còn hỗ trợ tính năng sạc không dây Qi.', 120, 84, '1655225136.png', 10, 0, '2022-06-14 16:45:36'),
(24, 20, 'Tai nghe có dây Nokia WB-101', 'tai-nghe-co-day-nokia-wb-101-37', 'Tai nghe có dây Nokia WB-101 hiện nay cũng đang được sử dụng khá rộng rãi với mọi người.\r\nTai nghe với thiết kế siêu nhẹ cùng mic đàm thoại chất lượng mang lại trải nghiệm âm thanh chân thực.', 'Thiết kế nhỏ gọn, chất lượng âm thanh tuyệt vời\r\nTai nghe Nokia WB-101 được thiết kế với phong cách đơn giản tối thiểu, kết hợp với các gam màu phổ biến dễ sử dụng. Với mút nhét tai làm bằng chất liệu Silicon mềm dẻo tạo nên cảm giác thoải mái khi đeo chứ không bị đau nhức tai khi nghe quá lâu. \r\nTai nghe được thiết kế nhỏ gọn có thể dễ dàng bỏ trong túi hay balo mang theo bất cứ đâu. Lớp vỏ bên ngoài được làm bằng nguyên liệu hợp kim nhôm, được bao phủ 1 lớp nhựa bên ngoài để bảo vệ, chống bị xước trầy.\r\nPhím tăng giảm âm lượng và nghe cuộc gọi được để ở chính giữa dây tai nghe.\r\nĐiều khiển tai nghe thích hợp để mang lại âm nhạc êm ái, dễ chịu\r\nTai nghe có dây Nokia WB-101 phát ra chất lượng âm thanh tông trầm và tông trung vừa phải. Tai nghe này sử dụng một màng kép graphene để giúp giữ lại các chất âm chi tiết nhỏ. Graphene được nhiều nhà sản xuất tin dùng vì vật liệu mỏng và thân thiện với môi trường, giúp cho tạo ra âm thanh phong phú và rõ ràng hơn.', 30, 21, '1655225259.jpg', 10, 0, '2022-06-14 16:47:39'),
(25, 21, 'Loa Bluetooth Soundpeats Halo', 'loa-bluetooth-soundpeats-halo-82', '* Âm thanh sống động 360 độ\r\n* Bền bỉ cả ngày dài với thời lượng pin 8 giờ liên tục\r\n* Kết nối nhanh chóng - ổn định với chuẩn bluetooth 50\r\n* Tận hưởng âm thanh stereo với khả năng ghép nối 2 loa\r\n* Đèn led RGB sống động', 'Loa Soundpeats Halo – Drive lớn, âm thanh chất lượng\r\nÂm thanh đóng vai trò quan trọng trong giải trí. Trong đó, loa bluetooth Soundpeats Halo với âm thanh nổi 360 độ hứa hẹn mang lại trải nghiệm ấn tượng cho người dùng.\r\nThiết kế nhỏ gọn sang trọng, sắc đen trang nhã\r\nSoundpeats Halo với thiết kế nhỏ gọn, nằm gọn trong lòng bàn tay người dùng. Thiết kế nhỏ gọn này giúp người dùng dễ dàng mang theo thiết bị mọi lúc, mọi nơi. Loa còn được trang bị dây treo tiện lợi.\r\nÂm thanh nổi 360 độ, âm trầm phong phú\r\nSoundpeats Halo mang lại trải nghiệm âm thanh chất lượng với drive kích thước 40mm, dải tần 100Hz-8KHz cùng âm thanh nổi 360 độ. Loa Soundpeats Halo với hiệu ứng âm thanh vòm giúp người dùng có thể tận hưởng, đắm chìm trong những phút giây âm nhạc.', 300, 210, '1655225379.jpg', 10, 0, '2022-06-14 16:49:39'),
(26, 19, 'Tai nghe chụp tai Sony WH-1000XM4', 'tai-nghe-chup-tai-sony-wh-1000xm4-39', '* Bộ xử lý chống ồn QN1 loại bỏ tạp âm của môi trường xung quanh.\r\n* Màng loa 40mm mang đến chất lượng âm thanh đỉnh cao.\r\n* Pin khoẻ dùng đến 30 giờ liên tục.\r\n* Tự động bật tắt nhạc khi người dùng đeo/tháo thiết bị.\r\n* Thực hiện cuộc gọi rảnh tay với micro tích hợp trên tai nghe.\r\n* Tăng giảm âm lượng hay nhận cuộc gọi chỉ với 1 thao tác chạm.', 'Sony WH-1000XM4 – Bản nâng cấp nhẹ của WH-1000XM3.\r\nBa thế hệ trước đó trong dòng tai nghe WH-1000XM đều sở hữu thiết kế tương tự nhau. Vậy nên không quá lại khi tai nghe Sony WH-1000XM4 lại có vẻ bề ngoài giống tai nghe trước đó của mình đến vậy. Tai nghe với thiết kế phần đầu dày một chút, vị trí nút bấm được bố trí không có gì thay đổi.\r\nChức năng khử tiếng ồn chủ động, hỗ trợ “Speak to Chat”\r\nSony WH-1000XM4 được trang bị khả năng phân tích và điều khiển thời gian thực. Nhờ đó giúp tai nghe chụp tai WH-1000MX4 luôn phân tích các tiếng ồn xung quanh và điều chỉnh mức độ chống ồn nhằm mang lại cho người dùng âm thanh chất lượng tốt nhất.\r\nĐiểm ấn tượng trên Sony WH-1000XM4 là được cải thiện thêm tính năng “Speak to chat”. Tính năng này đương tự như trợ lý ảo Siri hay Google Assistant, chức năng này cho phép chuyển đổi để điều khiển bằng giọng nói thay vì sử dụng nút bấm chuyên dụng.', 200, 140, '1655225530.png', 10, 0, '2022-06-14 16:52:10'),
(27, 18, 'Tai nghe Bluetooth Apple AirPods 2 VN/A', 'tai-nghe-bluetooth-apple-airpods-2-vna-51', '* Chip H1 mới nhất cho thời gian phản hồi nhanh cùng thời lượng pin lên đến 5 giờ.\r\n* Tích hợp 2 Micro giúp khử tiếng ồn của môi trường cho chất lượng âm thanh rõ ràng khi đàm thoại.\r\n* Kích hoạt trợ lý ảo Siri bằng cách gọi \"\"Hey Siri\"\".\r\n* Nhận hoặc dừng cuộc gọi bằng 1 cú chạm với tính năng điều khiển cảm ứng.\r\n* Hỗ trợ sạc nhanh: 15 phút sạc pin cho thời gian sử dụng lên đến 3 giờ.', 'Tai nghe Apple AirPods 2 – Thiết kế tối giản, chất lượng âm thanh tuyệt vời.\r\nĐầu tiên, AirPods 2 chính hãng VN/A là hàng chính hãng do Apple sản xuất theo tiêu chuẩn của thị trường Việt Nam. Thiết bị được phân phối chính hãng thông qua các đại lý ủy quyền của Apple. Vậy tai nghe bluetooth Apple AirPods 2 chính hãng VN/A có gì khác những mẫu tai nghe cũ, tai nghe xách tay?\r\nAirPods 2 chính hãng VN/A là hàng mới nên chất lượng hoàn toàn được đảm bảo. Bảo hành 1 năm tại các trung tâm bảo hành ủy quyền của Apple tại Việt Nam. Khi mua máy khách hàng cũng được cung cấp đầy đủ hóa đơn chứng minh nguồn gốc cũng như phụ kiện kèm theo.\r\nDung lượng pin lớn, sử dụng bền bỉ. AirPods 2 chính hãng VN/A có dung lượng pin khá ấn tượng. Tai nghe cho 5 giờ chơi nhạc và 3 giờ đàm thoại. Ngoài ra, hộp sạc cũng sở hữu tính năng tính pin, cho thêm 24 giờ sử dụng.\r\nAirPods 2 có 2 phiên bản: sạc không dây và sạc có dây (sạc thường). Phiên bản chúng ta đang nói đến là phiên bản sạc thường. Tuy nhiên, tai nghe AirPods 2 sạc có dây ngoài cách thức sạc pin, tai nghe không có quá nhiều khác biệt so với phiên bản sạc không dây.\r\nTính năng chống ồn vượt trội\r\nMột trong những tính năng được Apple nâng cấp trên Airpods 2 chính là khả năng chống ồn. Theo báo cáo từ công ty phân tích Barclays, tai nghe AirPods có khả năng chống ồn, xử lý âm thanh bên ngoài tốt hơn so với tai nghe AirPods đời đầu với khả năng chống ồn còn hạn chế. Bên cạnh đó, tai nghe AirPods 2 có thể sẽ được Apple sử dụng công nghệ chống ồn vật lý, khác với chống ồn điện từ như những tai nghe headphone. Với khả năng chống ồn tốt hơn này, tai nghe AirPods hứa hẹn sẽ cho ra chất âm tuyệt vời và cải thiện khoảng cách kết nối giữa các thiết bị.', 100, 70, '1655225687.png', 10, 0, '2022-06-14 16:54:47'),
(28, 21, 'Loa Bluetooth JBL CLIP 4', 'loa-bluetooth-jbl-clip-4-15', '* Kích thước nhỏ gọn,trọng lượng chỉ 86,3gr\r\n* Kháng nước và bụi chuẩn IP67 mang đến sự yên tâm khi sử dụng ngoài trời\r\n* Công nghệ JBL Original Pro Sound cho trải nghiệm âm thanh sống độn,âm bass mạnh mẽ\r\n* Thời lượng sử dụng lên đến 10 giờ\r\n* Kết nối Bluetooth 5.0 tương thích với nhiều thiết bị\r\n* Thiết kế có móc treo,tiện lợi treo trên balo', 'JBL CLIP 4 - Tiện lợi cho nhiều nhu cầu sử dụng\r\nĐa số người hay nghe nhạc đều lựa chọn cho mình những chiếc loa có kích thước nhỏ gọn nhưng chất âm lại rất tốt khi nghe. Biết được điều này JBL đã trang bị cho loa Bluetooth JBL CLIP 4 rất nhiều tính năng hiện đại với khả năng phát ra âm thanh rất tốt tiện lợi và chất lượng nhất cho bạn.\r\nKích thước nhỏ gọn, móc đeo tiện lợi, nhiều màu sắc\r\nĐã có một sự nâng cấp thay đổi thiết kế khá ấn tượng so với phiên bản cũ loa JBL CLIP 4 mang đến một kích thước khá nhỏ gọn và bo tròn các góc tinh tế bắt mắt với chất liệu nhựa cao cấp.\r\nĐiểm ấn tượng trên chiếc loa CLIP 4 đó là được hãng trang bị móc khóa đeo rất tiện lợi. Bạn có thể dễ dàng móc loa vào chìa khóa xe hay treo lên bất kỳ chỗ nào một cách dễ dàng vô cùng tiện lợi khi sử dụng.\r\nPin sạc nhanh qua cổng USB - C phát liên tục 10 giờ, chống nước IP67\r\nĐể đổi mới cũng như chạy theo kịp công nghệ JBL đã trang bị cho loa Bluetooth JBL CLIP 4 cổng sạc USB Type C cho khả năng sạc đầy pin trên loa rất nhanh chóng so với các phiên bản trước.\r\nVới dung lượng pin khủng người dùng có thể dễ dàng sử dụng JBL CLIP 4 lên đến hơn 10 giờ mà không lo bị hết pin trong quá trình sử dụng. Đưa người dùng hòa mình vào âm nhạc xuyên suốt', 400, 280, '1655225767.png', 10, 0, '2022-06-14 16:56:07'),
(29, 18, 'Tai nghe không dây LG Tone Free FP8', 'tai-nghe-khong-day-lg-tone-free-fp8-92', '* Dùng cả ngày - 10 giờ sử dụng với tai nghe,24 giờ khi đi kèm hộp sạc\r\n* Chế độ thì thầm thu rõ giọng nói của bạn ngay cả nơi đông người\r\n* Đèn UV tiêu diệt 99.9% vi khuẩn,tự động kích hoạt khi sạc pin\r\n* Hỗ trợ sạc không dây chuẩn Qi,sạc nhanh 5 phút sạc cho 1 giờ sử dụng\r\n* Bộ EQ được tuỳ chỉnh từ Meridian thông qua ứng dụng LG Tone\r\n* Tập thể dục thoải mái với chuẩn kháng nước IPX4', 'Tai nghe LG Tone Free FP8 - Chống ồn chủ động, khử khuẩn UVnano\r\nTiếp tục kết hợp với nhà sản xuất âm thanh MERIDIAN để ra mắt mẫu tai nghe true wireless mới nhất với tên gọi LG Tone Free FP8. Thiết bị được tích hợp tính năng chống ồn chủ động, công nghệ khử khuẩn UVnano nhằm đảm bảo sức khỏe của người sử dụng.\r\nĐèn UVnano diệt 99% vi khuẩn, gel đạt chuẩn y tế\r\nQuan tâm đến sức khỏe người dùng, LG trang bị cho Tone Free FP8 hộp sạc LG Free FP8 với khả năng kháng khuẩn lên đến 99.9%.\r\n\r\nVới đèn UVnano được trang bị trong bộ case, khi bạn cất giữ chiếc tai nghe vào bộ case này thì đèn UVnano sẽ được kích hoạt. Theo nhà sản xuất chỉ trong 5 giây, tai nghe LG Free FP8 sẽ loại bỏ đến 99,9% vi khuẩn.\r\nBảo vệ quyền riêng tư trong đàm thoại\r\nLG Tone Free FP8 có đến 3 micro được đặt ở các vị trí khác nhau, được thiết kế để làm giảm tiếng ồn xung quanh. Đồng thời, hỗ trợ thu âm rõ ràng và chuẩn xác hơn. Cuộc đàm thoại cũng tự nhiên ơn và người khác sẽ nghe thấy bạn nói to và rõ hơn.\r\nQua đó, người dùng có thể thoải mái chuyển đổi qua lại giữa ba chế độ khác nhau như: Noise canceling (chống ồn chủ động) - Ambien mode - Chat mode.\r\nThời lượng sử dụng trong nhiều giờ, sạc nhanh trong 5 phút\r\nLG Free FP8 sở hữu thời lượng pin rất tốt, trong 10 giờ sử dụng liên tục. Nếu kết hợp với bộ sạc thì thời lượng sử dụng sẽ lên đến 24 giờ. Một con số khá lớn, khó để tìm thấy sản phẩm nào trong cùng phân khúc.\r\nĐi kèm là tính năng sạc nhanh không dây Qi. Theo nhà sản xuất công bố, chỉ trong 5 phút sạc bạn có ngay 1 giờ để sử dụng.', 60, 42, '1655225827.png', 10, 0, '2022-06-14 16:57:07'),
(30, 19, 'Tai nghe Chụp Tai JBL Tune 500', 'tai-nghe-chup-tai-jbl-tune-500-24', '* Thiết kế trẻ trung năng động,có thể gập gọn để bỏ vừa balo\r\n* Công nghệ JBL Pure Bass cho âm trầm mạnh mẽ,trung thực\r\n* Điều khiển nhạc,nhận cuộc gọi với 1 nút tích hợp trên tai nghe\r\n* Dây cáp chống rối,không lo rối dây trong quá trình di chuyển', 'JBL Tune 500 - Thiết kế chụp tai truyền thống, nhiều màu sắc phù hợp cá tính người dùng\r\nVới cấu trúc là một chiếc tai nghe trùm tai, JBL Tune 500 có kích thước khá nhỏ so với các loại tai nghe on-ear khác. Với trọng lượng chỉ 154g, người dùng dễ dàng mang nó theo bên mình, để trong balo, túi xách đều không chiếm quá nhiều diện tích. Tai nghe vẫn sẽ có hai earcup hai bên được nối với nhau bằng phần headband chắc chắn ở chính giữa. Với earcup được thiết kế khá nhỏ nhưng JBL Tune 500 vẫn đem lại điểm nhấn và sự hấp dẫn riêng, sự vuông vức, góc cạnh kết hợp với những đường cong nổi nhẹ, tạo hiệu ứng 3D một cách nhẹ nhàng, không quá mạnh mẽ và cũng không quá điệu đà.\r\nCảm giác đeo êm ái bởi phần đệm earpad và headband\r\nJBL Tune 500 có phần đệm earpad và headband phối hợp với nhau tạo nên cấu trúc nâng đỡ hoàn hảo cho chiếc tai nghe, đem lại sự nhẹ nhàng và êm ái khi đeo cũng như sự thân thiện. Các chi tiết của JBL Tune 500 đều được hoàn thiện từ nhựa, đem lại sự nhẹ nhàng cũng như việc bạn không cảm thấy nhức mỏi khi sử dụng thiết bị trong thời gian dài. Đồng thời phần headband có thể tự do nới rộng và thu nhỏ nên tương thích với tất cả kích cỡ đầu của người dùng, bạn không phải lo tai nghe quá chật hay quá rộng so với đầu của bạn.\r\nDriver 32mm, cho tần số phản hồi đạt đến 20Hz - 20kHz cho âm thanh mạnh mẽ, khả năng kết nối Siri và Google Now\r\nJBL Tune 500 sử dụng bộ driver 32mm, cho tần số phản hồi đạt đến 20Hz - 20kHz cho âm thanh chân thực, sống động, mạnh mẽ, đặc biệt là dải bass. Qua trải nghiệm, dải bass rất uy lực, tự nhiên, mang lại cho những bản nhạc một sức sống và sự bùng nổ thực sự. Đem lại cho người nghe trải nghiệm được đủ màu sắc của giai điệu, mang đến không gian âm nhạc chất lượng nhất cho người nghe.', 110, 77, '1655225885.png', 10, 0, '2022-06-14 16:58:05'),
(31, 20, 'Tai nghe nhét tai Devia Smart Earpods có Mic', 'tai-nghe-nhet-tai-devia-smart-earpods-co-mic-93', '* Trang bị mic đàm thoại trên tai nghe,nút tăng giảm âm lượng trên dây\r\n* Dể dàng sử dụng với các thiết bị trang bị cổng kết nối 3.5mm\r\n* Dây dài 1.2m cho phép vừa nghe nhạc vừa sử dụng máy', 'Tai nghe nhét tai Devia Smart Earpods có Mic – Vẻ ngoài quen thuộc, chất âm tốt\r\nMặc dù tai nghe không dây hiện đang phổ biến trên thị trường hiện nay nhưng vẫn đâu đó có nhiều người vẫn trung thành với tai nghe có dây nhét tai chính hãng. Trong số đó, nổi bật và ấn tượng với sản phẩm tai nghe nhét tai Devia Smart Earpods có Mic, vốn được sản xuất dành cho iPhone.\r\nThiết kế quen thuộc, hoàn thiện từ nhựa bóng kết hợp với cao su\r\nTai nghe nhét tai Devia Smart Earpods có Mic có vẻ ngoài quen thuộc, và không đâu khác giống với Earpods chính hãng của Apple. Sau khi ra đời iPhone 7 cùng với việc loại bỏ jack cắm 3.5mm thì Apple cũng ngưng việc sản xuất Earpods và hướng mọi người đến sản phẩm tai nghe không dây.\r\nVề chất liệu của tai nghe nhét tai Devia Smart Earpods thì có thể được chia làm hai phần: phần housing và phần dây. Housing được làm chủ yếu từ nhựa cứng với thiết kế bóng cho cảm giác sang trọng và cứng cáp, phần dây được bao bọc bởi cao su nhằm bảo vệ dây tránh khỏi tác động gãy, dập, uốn.\r\nChiều dài tai nghe đến 1.2m, jack cắm 3.5mm quen thuộc\r\nTai nghe nhét tai Devia Smart Earpods có chiều dài theo tiêu chuẩn là 1.2m. Với độ dài này người dùng hoàn toàn không cần cầm kè kè điện thoại bên mình, có thể bỏ vào trong túi quần để vừa nghe nhạc vừa có thể tập luyện thể thao nhẹ.\r\nChất âm khá cân bằng, nhỉnh về âm bass\r\nTai nghe nhét tai Devia Smart Earpods được trang bị đến hai màng loa đem đến chất âm khá cân bằng, tuy nhiên âm bass có phần nhỉnh hơn so với những dải âm còn lại, qua đó, thích hợp để bạn nghe những bản R&B hay EDM thì cực kỳ hiệu quả.', 50, 35, '1655225937.png', 10, 0, '2022-06-14 16:58:57'),
(32, 21, 'Loa Bluetooth Sony SRS-XB13', 'loa-bluetooth-sony-srs-xb13-75', '* 16 giờ sử dụng liên tục,tự động thông báo khi cần sạc lại\r\n* Âm thanh chất với công nghệ Extra Bass tăng cường âm trầm\r\n* Thiết kế nhỏ gọn vừa lòng bàn tay,có thể treo trên balo\r\n* Yên tâm khi sử dụng loa ngoài trời với chuẩn kháng nước bụi IP67', 'Loa bluetooth Sony SRS-XB13 – Nâng cao trải nghiệm âm thanh\r\nSở hữu loa Sony SRS-XB13, bạn đừng để bị lừa bởi kích thước nhỏ của nó. Bởi chiếc loa nhỏ này, điểm nhấn chính là âm thanh mở rộng nhờ vào sự khuếch đại của bộ xử lý âm thanh.\r\nÂm thanh phá vỡ giới hạn trong chiếc loa mini\r\nLoa sở hữu cho mình bộ âm thanh vòm chỉnh với bộ xử lý khuếch tán âm thanh mở rộng với Extra Bass ™. Công nghệ DSP giúp cho âm thanh được được phóng đại hơn gấp nhiều lần.\r\nVỏ ngoài bền bỉ\r\nSony Srs-Xb13 Extra Bass được thiết kế với vỏ ngoài bền bỉ, sẵn sàng cho mọi hoạt động. Thời lượng pin của loa có thể lên đến 16 giờ, một thời gian mà không ai nghỉ chỉ một chiếc loa nhỏ bé có thể có được. Trong suốt quá trình hoạt động, máy sẽ báo chỉ số pin trực tiếp về thiết bị điện thoại của bạn, bạn sẽ dễ dàng theo dõi thời lượng pin hơn bao giờ hết.\r\nKết nối chỉ qua một lần chạm\r\nSony SRS-XB13 cho phép bạn kết nối Bluetooth dễ dàng và nhanh chóng hơn trên thiết bị thông minh chỉ bằng một lần nhấn. Micro tích hợp giúp bạn thực hiện cuộc gọi rảnh tay dù đang ở nhà hay ra ngoài.', 290, 203, '1655226050.png', 10, 0, '2022-06-14 17:00:50'),
(33, 18, 'Tai nghe Bluetooth Apple AirPods 3', 'tai-nghe-bluetooth-apple-airpods-3-10', '* 6 giờ nghe nhạc với tai nghe, 1 ngày khi đi kèm hộp sạc\r\n* Trải nghiệm sống động với âm thanh vòm Spatial audio\r\n* Chuẩn Bluetooth 5.0 cho phạm vi kết nối 10m\r\n* Yên tâm khi luyện tập thể thao với chuẩn kháng nước IPX4', 'Tai nghe AirPods 3 - Âm thanh mới mang lại trải nghiệm ấn tượng.\r\nĐược dự đoán Apple sẽ ra mắt Apple AirPods 3 vào cuối năm 2021 và sẽ gây ra tiếng vang không hề nhỏ như hai người đàn anh của nó. Cùng với đó là những nâng cấp về mặt công nghệ mới để đem lại chất lượng tốt hơn cho người dùng so với các thế hệ tai nghe bluetooth AirPods trước đây.\r\nThiết kế sang trọng, nhiều thay đổi so với thế hệ trước.\r\nTai nghe AirPods 3 sở hữu nhiều thiết kế tương tự với thế hệ AirPods Pro tuy nhiên không có phần nút tai. Thiết kế này mang lại cảm giá thoải mái khi sử dụng cho người dùng, phù hợp với đa số kích thước tai. Đặc biệt, thiết kế này thích hợp với người dùng thường xuyên đổ mồ hôi mà không hề gây khó chịu. Phần thân tai cũng được làm ngắn hơn, gọn nhẹ hơn.\r\nDung lượng pin được cải thiện\r\nVề dung lượng pin, AirPods 3 được trang bị viên pin dung lượng dài hơn đến 1 tiếng so với thế hệ trước đó. Cụ thể, người dùng có thể mang lại thời gian nghe nhạc lên đến 6 tiếng và 4 giờ đàm thoại. Ngoài ra, khi sử dụng với hộp sạc, thiết bị cho thời gian tổng cộng lên đến 30 giờ.\r\nLưới âm giảm tiếng ồn gió\r\nViệc loại bỏ đệm cao su nhét tai khiên AirPods 3 sẽ không được trang bị tính năng chủ động. Tuy nhiên thay vào đó, AirPods 3 được trang bị một lưới âm giúp giảm tiếng ồn gió hiệu quả. Nhờ thiết kế ngày, cuộc đàm thoại của người dùng diễn ra to và rõ ràng hơn.\r\nDriver được nâng cấp, âm thanh 360 độ\r\nLà thế hệ tai nghe không dây mới nhất do đó AirPods 3 cũng được trang binh những tính năng mới nhất. Cụ thể, AirPods 3 được nâng cấp về driver. Cùng với đó là công nghệ định dạng AAC-ELD mang lại chất lượng âm thanh rõ ràng và chân thật. Ngoài ta, tai nghe chính hãng Apple này cũng được tích hợp công nghệ âm thanh vòm Apple Spatial Audio kết hợp Dolby Atmos mang lại trải nghiệm âm thanh ấn tượng. ', 150, 105, '1655226144.png', 10, 0, '2022-06-14 17:02:24'),
(34, 18, 'Tai nghe Bluetooth Samsung Galaxy Buds Pro', 'tai-nghe-bluetooth-samsung-galaxy-buds-pro-18', '* Chống ồn chủ động ANC lọc mọi tạp âm của môi trường\r\n* Chế độ xuyên âm cho phép nghe thấy giọng nói của người xung quanh\r\n* Âm thanh 3D với loa 2 chiều (loa trầm 11mm,loa bổng 6.5mm)\r\n* 3 micro khử ồn hiệu quả\r\n* Thiết kế hạt đậu ôm khít tai,không rơi khi vận động\r\n* Kháng nước IPX7,không lo vào nước khi tập luyện\r\n* Pin 5 giờ và 13 giờ khi dùng cùng hộp sạc', 'Tai nghe Samsung Galaxy Buds Pro - Thiết kế tinh tế cùng chất âm đột phá\r\nTai nghe True Wireless Samsung Galaxy Buds Pro là dòng sản phẩm tai nghe không dây thế hệ mới nhất từ Samsung. Với phiên bản lần này được lột xác hoàn toàn về thiết kế cũng như chất âm xứng đáng là lựa chọn hàng đầu cho người dùng đang mong muốn tìm cho mình một chiếc tai nghe không dây cao cấp để đồng hành cùng mình trong công việc và giải trí.\r\nThiết kế công thái học cho trải nghiệm đeo thoải mái và hoàn hảo\r\nTai nghe không dây bluetooth Samsung Galaxy Buds Pro sở hữu một thiết kế bầu dục, khác với thiết kế bo tròn trên thế hệ tiền nhiệm. Được phủ thêm một lớp sơn bóng giúp làm nổi bật thiết kế của tai nghe thêm phần bắt mắt, nổi bật dưới mọi góc nhìn.\r\nChống ồn chủ động ANC, làm chủ âm thanh mà bạn mong muốn\r\nSamsung tích hợp cho tai nghe Bluetooth Samsung Galaxy Buds Pro công nghệ chống ồn chủ động ANC tiên tiến. Giúp lọc tạp âm hiệu quả để bạn có thể thưởng thức âm thanh, nhận thông báo tin nhắn và gọi thoại với chất lượng tốt nhất.\r\nMàng loa 12nm mang đến chất âm sống động, tinh chỉnh bởi AKG\r\nTận hưởng chất âm lôi cuốn, sôi động trên tai nghe không dây Samsung Galaxy Buds Pro nhờ sự kết hợp hoàn hảo giữa màng loa 12nm được tinh chỉnh bởi AKG. Chất âm cho ra luôn sáng rõ và chân thực nhất.', 140, 98, '1655226203.png', 10, 0, '2022-06-14 17:03:23'),
(35, 19, 'Tai nghe chụp tai Soundpeats G1', 'tai-nghe-chup-tai-soundpeats-g1-91', '* Âm thanh 3D ấn tượng nhờ driver lớn lên đến 40mm\r\n* Micro đàm thoại tốt có thể điều chỉnh xoay để thu giọng rõ ràng hơn\r\n* Kết nối đa thiết bị với cổng 3.5mm và USB\r\n* Đệm tai làm bằng chất liệu da thoải mái sử dụng cả ngày', 'Tai nghe Soundpeats G1 âm thanh chất lượng vượt trội\r\nÂm thanh đóng vai trò quan trong trong các trận chiến game. Nếu bạn đang tìm kiếm phụ kiện gaming chuyên nghiệp, hãy tham khảo ngay tai nghe SoundPEATS G1, chắc chắn bạn sẽ bị chinh phục bởi loại tai nghe này.\r\nThiết kế chắc chắn, đệm tai êm ái cùng đèn RGB độc đáo\r\nTai nghe Gaming SoundPEATS G1 sở hữu một thiết kế chắc chắn với trọng lượng nhẹ. Với thiết kế băng đô có thể điều chỉnh, nhờ đó có thể phù hợp với nhiều kích thước đầu. Tai nghe dễ dàng tháo – lắp cùng hệ thống treo không gây áp lực cho vùng đầu.\r\nKết nối Microphone tiện lợi, tương tác dễ dàng\r\nTai nghe SoundPEATS G1 được trang bị Microphone tích hợp với tính năng ngắt âm chuyên nghiệp giúp người dùng giao tiếp dễ dàng. Người dùng cũng có thể dễ dàng điều chỉnh giúp giọng nói thu rõ ràng hơn, ngay cả trong môi trường độ ồn cao như phòng hội nghị, nơi công cộng. Người dùng có thể điều khiển trực tiếp bật – tắt một cách dễ dàng.', 180, 126, '1655226267.png', 10, 0, '2022-06-14 17:04:27'),
(36, 21, 'Loa Bluetooth JBL Charge 4', 'loa-bluetooth-jbl-charge-4-72', '* Công suất 30W cùng hai bộ tản âm cho dải âm trầm và bass mạnh mẽ\r\n* Kết nối cùng lúc hơn 100 loa với ứng dụng JBL Connect +\r\n* Pin 7500mAh sử dụng lên đến 20 giờ,sạc đầy trong 4 giờ\r\n* Chuẩn chống nước IPX7,thoải mái sử dụng ngoài trời mà không lo vào nước\r\n* Hỗ trợ cổng 3.5mm và Bluetooth 5.1', 'Loa JBL Charge 4 – Chống nước IPX7, âm thanh sống động\r\nLoa JBL Charge 4 là chiếc loa bluetooth thế hệ thứ tư thuộc dòng JBL Charge. Bạn sẽ có một bữa tiệc BBQ ngoài trời, hồ bơi hay bãi biển, ngập tràn âm thanh sống động, thỏa sức chơi đùa cùng với bạn bè.\r\nJBL Charge 4 - Thiết kế loa Charge 4 JBL nhỏ gọn, tiện lợi\r\nCác sản phẩm loa của JBL đều có thiết kế dựng đứng được hoặc nằm ngang cực kỳ tiện dụng. Ở bất kỳ nơi nào, loa Charge 4 đều có thể đứng vững. Bên cạnh đó, với thiết kế hình trụ, người dùng dễ dàng cầm loa thẳng đứng. Hai đầu của loa cũng được bọc vải dệt đóng vai trò làm nơi tiếp xúc với nền để loa có thể đứng được và cũng bảo vệ được các phím điều khiển. Giống với phiên bản thứ ba, phiên bản lần này cũng tạo ra nhiều phiên bản màu sắc đa dạng như: xanh, đen, đỏ, xám…\r\nLoa bluetooth JBL Charge 4 kết nối nhanh, âm thanh sống động\r\nLoa bluetooth JBL Charge 4 được trang bị kết nối chuẩn Bluetooth 4.2, cho tốc độ kết nối nhanh hơn và ổn định hơn so với các sản phẩm loa thông thường khác. Bên cạnh đó, loa còn hỗ trợ kết nối Bluetooth hai thiết bị cùng lúc lần lượt phát âm thanh Stereo ấn tượng, cho khả năng kết nối linh hoạt hơn trong việc sử dụng rất nhiều.\r\nJBL Charge 4 còn được trang bị lõi pin Lithium-ion polymer với dung lượng cao lên đến 7.500 mAh, giúp người dùng thoải mái cùng bạn bè chơi đùa lên tới 20 tiếng và chỉ cần 5,5 tiếng sạc là đầy pin. Ngoài ra, người dùng cũng dễ dàng theo dõi dung lượng pin còn lại để kiểm soát không bị hết pin giữa chừng thông qua một đèn LED thông minh.', 350, 245, '1655226320.png', 10, 0, '2022-06-14 17:05:20'),
(37, 18, 'Tai nghe Bluetooth Samsung Galaxy Buds Live', 'tai-nghe-bluetooth-samsung-galaxy-buds-live-20', '* Chống ồn chủ động ANC khử tiếng ồn nhưng không lấn át các âm thanh quan trọng\r\n* Màn loa 12mm tinh chỉnh bởi AKG cho chất âm sáng rõ\r\n* 3 mic lọc tiếng ồn cho chất lượng đàm thoại trong trẻo\r\n* Tích hợp Softify,chạm và giữ trong một giây tất cả danh sách nhạc sẽ được đồng bộ\r\n* 6 tiếng nghe nhạc,đi kèm hộp sạc cho thời gian sử dụng lên đến 21 tiếng\r\n* Hỗ trợ sạc không dây,có thể sử dụng điện thoại để sạc cho tai nghe', 'Samsung Galaxy Buds Live thiết kế hạt đậu vừa tai cùng khả năng khử tiếng ồn\r\nThiết kế hình hạt đậu không nhô khỏi tai và có nhiều màu sắc khác nhau\r\nGalaxy Buds Live có là dạng tai nghe nhét tai với thiết kế hình hạt đậu lạ mắt khi sử dụng không bị nhô ra khỏi tai mà nằm gọn, vừa vặn trên tai của bạn mang đến cảm giác thoải mái khi đeo. Dù bạn sử dụng suốt cả ngày thì tai nghe cũng không khiến bạn cảm thấy khó chịu hay nặng tai.\r\nTích hợp micro đàm thoại cùng khả năng khử tiếng ồn ANC hiệu quả\r\nSamsung Buds Live được trang bị micro giúp người dùng có thể trả lời những cuộc gọi dễ dàng, dù là tai nghe nhét tai nhưng micro hút âm thanh cực tốt giúp bạn thoải mái trò chuyện nhưng vẫn đảm bảo âm thanh không bị ảnh hưởng bởi tạp âm.\r\nĐiều kiển qua ứng dụng và hỗ trợ Bixby \r\nĐối với Galaxy Buds Live không chỉ có thể sử dụng trên điện thoại Samsung, mà bạn có thể sử dụng được với nhiều loại smartphone khác nhau sử dụng hệ điều hành Android, dựa trên ứng dụng Galaxy Wea Wear. Nếu bạn không sử dụng điện thoại Samsung nhưng muốn sở hữu Buds Live thì vẫn có thể cài đặt ứng dụng và sử dụng mà không vấn đề gì.\r\nPin dung lượng lớn cho 29 giờ sử dụng\r\nKhông chỉ thế, tai nghe bluetooth này còn cho người dùng thời gian sử dụng khủng, lên đến 8 giờ nghe liên tục và 29 giờ cả hộp sạc. Đây là con số rất ấn tượng, đảm bảo nhu cầu sử dụng liên tục cả một ngày. Bên cạnh đó là tính năng sạc nhanh, Galaxy Buds Live sẽ có thêm 1 giờ sử dụng sau 5 phút sạc.', 70, 49, '1655226377.png', 10, 0, '2022-06-14 17:06:17'),
(38, 21, 'Loa Bluetooth Tribit Xsound Go', 'loa-bluetooth-tribit-xsound-go-62', '* 2 loa công suất 8W cho trải nghiệm âm thanh sôi động\r\n* Chuẩn kháng nước IPX7 cho phép hoạt động trong trời mưa hay ở bãi biển\r\n* Bluetooth 5.0 kết nối ổn định và phạm vi hoạt động đến 10m\r\n* Pin khoẻ mang đến 24 giờ nghe nhạc (tuỳ mức âm lượng)', 'Loa bluetooth Tribit XSound Go – thiết kế nhỏ gọn, âm thanh chất lượng\r\nBạn là người đam mê âm nhạc thì không thể bỏ qua những phụ kiện âm thanh như loa. Đặc biệt là Tribit XSound Go – mẫu loa không dây nhỏ gọn với âm thanh chất lượng.\r\nThiết kế dạng con nhộng nhỏ gọn\r\nTribit XSound Go sở hữu một thiết kế khá độc đáo với dạng con nhộng khá nhỏ gọn cùng trọng lượng cực nhẹ, chỉ khoảng hơn 500g. Với kích thước này, bạn có thể dễ dàng cho loa vào túi xách mang theo mà không gặp bất kỳ khó khăn gì.\r\nDung lượng pin lớn cùng khả năng chống nước vượt trội\r\nLoa bluetooth giá rẻ Tribit XSound Go được trang bị công nghệ chống nước và bụi bẩn IPX7. Nhờ đó, bạn hoàn toàn có thể giải trí, mở party với bạn bè bên hồ bơi mà không cần lo lắng loa sẽ bị hư hỏng do vào nước.\r\nÂm thanh chất lượng với loa công suất 12W\r\nTribit XSound Go mang đến một trải nghiệm giải trí tuyệt vời với loa công suất 12W. Với Tribit XSound Go, bạn có thể chơi mọi thể loại nhạc mang đến phút giây giải trí tuyệt vời.', 200, 140, '1655226483.png', 10, 0, '2022-06-14 17:08:03'),
(39, 19, 'Tai nghe chụp tai Devia Kintone', 'tai-nghe-chup-tai-devia-kintone-96', '* Thiết kế công thái học ôm trọn tai người đeo\r\n* Thời lượng pin lớn cho phép sử dụng liên tục trong 18 giờ chỉ với 1 lần sạc\r\n* Kết nối không dây với công nghệ bluetooth 5.0\r\n* Thực hiện cuộc gọi vời mic đàm thoại được tích hợp', 'Tai nghe chụp tai Devia Kintone - Thiết kế vừa vặn, chất lượng cao\r\nBạn đang tìm một tai nghe chụp tai có thiết kế ôm sát tai nhưng không gây đau với chất lượng âm thanh HIFI đỉnh cao? Tai nghe chụp tai Devia Kintone sẽ là sự lựa chọn lý tưởng dành cho bạn với thiết kế công thái học vừa vặn, kiểu dáng hợp xu hướng, âm thanh chất lượng cao cùng nhiều tính năng cải tiến khác.\r\nThiết kế công thái học vừa vặn - Thoải mái đeo và nghe nhạc cả ngày dài\r\nTai nghe chụp tai có trọng lượng khá nhẹ, thời trang và đặc biệt là có thiết kế công thái học mang lại độ vừa vặn với khuôn tai, cho bạn cảm giác chắc chắn, thoải mái và dễ chịu khi đeo trong khi tập gym, chạy bộ,... hoặc nghe nhạc, podcast,... trong khoảng thời gian dài.\r\nChất lượng âm thanh HIFI - Tái tạo âm thanh nguyên bản\r\nDevia Kintone tích hợp phiên bản Bluetooth 5.0 tiên tiến đảm bảo tiết kiệm pin và cung cấp đường truyền ổn định để âm thanh đạt chất lượng cao.\r\nĐược áp dụng thế hệ mới của cuộn dây chuyển động lớn 40mm giúp cân bằng ba tần số, mang đến chất lượng âm thanh đầy đủ, mạnh mẽ và chân thực vô cùng. Mỗi tai nghe trang bị một nút bấm dễ thao tác. Bạn có thể thuận tiện trả lời cuộc gọi hoặc chuyển sang bài hát tiếp theo mà không cần dùng đến điện thoại.', 220, 154, '1655226545.png', 10, 0, '2022-06-14 17:09:05'),
(40, 18, 'Tai nghe Bluetooth Apple AirPods Pro VN/A', 'tai-nghe-bluetooth-apple-airpods-pro-vna-63', '* Hỗ trợ tính năng chống ồn chủ động ANC\r\n* Tính năng xuyên âm giúp người dùng nghe được âm thanh của môi trường xung quanh\r\n* Thời gian sử dụng 4.5 giờ khi bật chế độ chống ồn,19 giờ khi đi kèm với hộp sạc\r\n* Sạc không dây chuẩn Qi,5 phút sạc cho 1 giờ sử dụng\r\n* Kích hoạt trợ lý ảo Siri bằng cách gọi \"\"\"\"Hey Siri\"\"\"\"\r\n* Chống nước chuẩn IPX4 cho phép thoải mái luyện tập mà không lo thấm mồ hôi\r\n* Có khả năng định vị tai nghe bị thất lạc', 'Airpods Pro – Tai nghe bluetooth với chất âm rõ cùng khả năng chống nước IPX4\r\nNhững thiết kế của Apple ngày càng hướng đến người dùng hơn khi chiếc tai nghe Airpods Pro mới nhất khá nhỏ gọn, trọng lượng chỉ 5.4g và 45,6 gram cả hộp. Sự nâng cấp đầu tiên phải kể đến đó là Airpods Pro được thiết kế như một tai nghe in-ear thay vì earbud toàn khung nhựa 100% như ở các phiên bản cũ. Cùng với 3 mút silicon mềm giúp Airpods Pro không chỉ giúp tai nghe trở nên sang trọng hơn và còn giúp tai nghe bám chắc vào tai, khả năng cách âm tốt cũng như phù hợp với nhiều kích thước tai khác nhau.\r\nÂm thanh trên Apple Airpods Pro rõ nét với công nghệ khử tiếng ồn chủ động\r\nTai nghe AirPods Pro sở hữu nhiều công nghệ âm thanh mang đến chất lượng nghe - gọi tốt. Đầu tiên trong đó phải kể đến công nghệ chống ồn chủ động. Với thiết kế một micro hướng ra ngoài giúp phát hiện âm thanh. Sau khi phát hiện âm thanh, Airpods Pro ngay lập tức sẽ loại bỏ âm thanh bên ngoài đó trước khi bạn nghe thấy nó. Một micro hướng vào bên trong giúp lắng nghe những âm thanh bên trong tai bạn. Tương tự với micro hướng ra bên ngoài, micro bên trong cũng kiểm tra những âm thanh không mong muốn và loại bỏ chúng. Tính năng khử tiếng ồn được điểu chỉnh liên tục với tần suất 200 lần mỗi giây. Nhờ vậy âm thanh cuối cùng bạn nghe được sẽ là những âm thanh trong trẻo, chất lượng nhất.\r\nCông nghệ Adaptive EQ cùng chip H1 giúp tùy chỉnh âm thanh\r\nBên cạnh tính năng chống ồn chủ động, Airpods Pro còn công nghệ Adaptive EQ cho khả năng tận hưởng âm nhạc tốt hơn. Công nghệ Adaptive EQ giúp điều chỉnh âm nhạc theo hình dạng tai nghe của từng người. Tai nghe cho âm trầm mạnh, cùng với đó là trình điều khiển loa cho phép tùy chỉnh độ méo cao và thấp khác nhau.\r\nDung lượng pin lớn lên đến 5 giờ sử dụng\r\nVới Airpods Pro với dung lượng pin cho thời gian sử dụng khá ấn tượng. Cụ thể với 1 lần sạc, tai nghe không dây Airpods Pro cho 4,5 giờ nghe nhạc, 3.5 tiếng đàm thoại. Ngoài ra, hộp sạc không dây giúp lưu trữ điện năng bổ sung năng lượng cho 24 giờ nghe nhạc, 18 giờ đàm thoại.', 250, 175, '1655226612.png', 10, 0, '2022-06-14 17:10:12'),
(41, 19, 'Tai nghe chụp tai Mpow Air SE Gaming BH439A', 'tai-nghe-chup-tai-mpow-air-se-gaming-bh439a-76', 'Tai nghe chụp tai Mpow BH439A – Tai nghe gaming giá rẻ\r\nĐể làm nên một chiếc tai nghe gaming chất lượng thì cần đáp ứng được nhiều tiêu chí như thiết kế, chất lượng âm thanh. Và ở tai nghe Mpow Air SE BH439A, một chiếc tai nghe giá rẻ nhưng vẫn đáp ứng được các yêu cầu cần có của tai nghe gaming.', 'Thiết kế đơn giản, thoải mái khi đeo\r\nTai nghe Mpow BH439A sở hữu vẻ ngoài với tông đỏ - đen sang trọng nhưng không kém phần mạnh mẽ. Mpow Air SE BH439A với thiết kế củ tai to mang đến cảm giác thoải mái khi sử dụng. Đặc biệt với 6 nấc tai giúp tai nghe cho phép nơi rộng hoặc thu hẹp nhờ đó tai nghe có thể đeo vừa với mọi kích thước đầu.\r\nTuy là sản phẩm giá rẻ nhưng gọng tai được hoàn thiện từ kim loại, mang lại sự cứng cáp và chắn. Khung kim loại này có thể chịu lực tác động lên tới 10kg và bền bỉ, chống ăn mòn tốt trong điều kiện thời tiết tại Việt Nam.\r\nPhần đệm đầu Mpow BH439A được bọc da cùng logo Mpow với điểm nhấn là các đường chỉ đỏ. Về kích thước đệm tai, đệm tai trên Mpow Air SE BH439A có kích thước lớn và dày giúp chống ồn hiệu quả và cải thiện chất âm. Chụp tai có độ đàn hồi cao cũng như thoáng khí, hạn chế tình trạng mỏi – bí khi sử dụng trong thời gian dài.\r\nÂm thanh vòm với hướng âm chuẩn xác\r\nÂm thanh là một yếu tố quan trọng của dòng tai nghe gaming. Với Mpow Air SE BH439A, tai nghe sẽ được tích hợp công nghệ âm thanh vòm Spatial surround sound. Nhờ đó mà các âm thanh như tiếng súng, lựu đạn nổ hay tiếng bước chân đều được tái hiện lại một cách chân thực.', 90, 63, '1655226656.PNG', 0, 0, '2022-06-14 17:10:56'),
(42, 19, 'Tai nghe bịp tai JBL Tune 750BTNC', 'tai-nghe-bip-tai-jbl-tune-750btnc-88', 'Dễ dàng điều khiển âm thanh, quản lý cuộc gọi và chuyển đổi trợ lý giọng nói từ tai nghe bằng các nút trên chụp tai. JBL đã tạo ra âm thanh chính xác, ấn tượng được tìm thấy ở các địa điểm lớn trên thế giới. Tai nghe này tái tạo âm thanh JBL tương tự, tạo ra âm trầm vừa sâu vừa mạnh mẽ.', 'Tai nghe không dây JBL TUNE 750BTNC có Âm thanh JBL Pure Bass mạnh mẽ và tính năng chống ồn chủ động cho âm trầm mạnh mẽ và trải nghiệm âm thanh đắm chìm. Thiết kế over-ear nhẹ mang lại sự thoải mái và chất lượng âm thanh tối đa trong khi sẵn sàng di chuyển khắp mọi nơi với khả năng có thể gập lại nhỏ gọn của nó. Thời lượng pin lên đến 15 giờ mà chỉ sạc lại trong 2 giờ cho phép phát lại không dây, không gây tiếng ồn. \r\nCho phép kết nối đồng thời với hai thiết bị Bluetooth®, kết nối đa điểm đảm bảo bạn sẽ không bỏ lỡ cuộc gọi trên điện thoại khi phát video trên máy tính bảng. Giữ cho âm nhạc của bạn phát không ngừng với cáp âm thanh có thể tháo rời đi kèm, giúp mở rộng khả năng khử tiếng ồn lên đến 30 giờ. JBL TUNE 750BTNC có nhiều màu sắc khác nhau phù hợp với phong cách cá nhân của bạn.\r\n', 300, 260, '1655634719.png', 11, 0, '2022-06-19 10:31:59'),
(43, 20, 'Tai nghe nhét tai JBL Endurance SPRINT', 'tai-nghe-nhet-tai-jbl-endurance-sprint-66', 'Công nghệ kết nối Bluetooth không dây cho phép người nghe phát những bài nhạc với chất lượng âm thanh đỉnh cao trong vòng liên tục 8 giờ đồng hồ mà không cần phải lo ngại về việc dây tai nghe sẽ bị rối trong lúc vận động thể thao hay thực hiện những động tác mạnh. Ngoài ra, với công nghệ sạc nhanh thì chỉ cần 10 phút sạc là người nghe đã có thể sử dụng tai nghe trong gần 1 giờ đồng hồ.', 'Không có gì ngăn cản việc tập luyện của bạn. Với thiết kế không dây và IPX7 không thấm nước, tai nghe JBL Endurance SPRINT luôn hoạt động và với Speed ​​Charge, bạn có thể có một giờ nghe sau khi sạc pin chỉ trong 10 phút. Công nghệ nút tai FlexSoft ™ và công nghệ TwistLock ™ tạo sự thoải mái khi sử dụng, đảm bảo tai nghe được giữ cố định trong quá trình tập luyện của bạn. Phần điều khiển cảm ứng cho phép bạn dễ dàng quản lý âm nhạc và MagHook ™ cho phép bạn bảo vệ chúng một cách thuận tiện khi bạn không sử dụng tai nghe\r\nKhông gây đau đớn. Không bao giờ rơi khỏi tai bạn. Nhờ được tích hợp công nghệ TwistLock™ và FlexSoft™ mà những dòng tai nghe này không chỉ sở hữu thiết kế và kiểu dáng nhỏ gọn mà còn có thể cố định êm ái trên tai xuyên suốt những bài tập khắc nghiệt nhất.', 250, 215, '1655634898.webp', 15, 0, '2022-06-19 10:34:58'),
(44, 18, 'Tai nghe không dây JBL Tune 220TWS', 'tai-nghe-khong-day-jbl-tune-220tws-83', 'Trải nghiệm âm nhạc sôi động cùng âm bass mạnh mẽ với công nghệ JBL Pure Bass Sound\r\n1 lần sạc cho 4 giờ sử dụng,12 giờ đi kèm với hộp sạc\r\nTai phải có khả năng hoạt động độc lập\r\nChuẩn bluetooth 5.0 cho khả năng kết nối ổn định trong 10m\r\n', 'Thiết kế sành điệu, nút tai gọn nhẹ giúp thoải mái khi đeo trên tai\r\nNằm trong phân khúc phổ thông, nhưng JBL Tune 220TWS sở hữu thiết kế sành điệu và bắt mắt không kém gì các mẫu tai nghe cao cấp hiện nay. JBL Tune 220TWS được thiết kế với chất liệu cao cấp và có lớp phủ kim loại bên ngoài sang trọng. Phần nút tai của JBL Tune 220TWS có kích cỡ gọn nhẹ và vừa vặn với tai, tạo cảm giác thoải mái lâu dài trên tai người đeo. Ngoài ra, JBL Tune 220TWS cũng là dạng tai nghe không dây hoàn toàn (true wireless), góp phần không hề gây vướng víu khi đeo trong lúc vận động hoặc di chuyển bên ngoài.\r\nÂm thanh mạnh mẽ với công nghệ JBL Pure Bass Sound\r\nHãng JBL luôn nổi tiếng với việc chú trọng xây dựng âm thanh chất lượng nhất trên từng sản phẩm. Và JBL Tune 220TWS mới đây cũng được hãng tập trung vào tính năng ấy. Sử dụng driver 12.5mm, cặp tai nghe không dây này có thể mang đến mức âm trầm & bổng cân bằng, mang lại trải nghiệm nghe nhạc tốt nhất. Công nghệ JBL Pure Bass Sound được tích hợp vào giúp tăng âm bass lên, tạo nên âm thanh mạnh mẽ và sống động trên từng giai điệu.\r\nĐặc biệt, cặp tai nghe JBL Tune 220TWS hoàn toàn tương thích với hệ điều hành Android và iOS nên bất kỳ người dùng iPhone hay các dòng smartphone Android đều có thể sử dụng. Với tính năng nhận cuộc gọi rảnh tay, người dùng sẽ không bao giờ bỏ lỡ cuộc gọi quan trọng nào khi đeo cặp tai nghe không dây này.\r\n\r\nSử dụng 3 giờ liền, cộng thêm 16 giờ sạc bên trong hộp case tiện lợi\r\nKhông chỉ mang lại chất âm ấn tượng, JBL Tune 220TWS còn có thời lượng sử dụng dài lâu khiến cho cặp tai nghe không dây này rất được ưa chuộng. Thời lượng sử dụng trung bình của mỗi củ tai là 3 giờ, cùng với 16 giờ sạc thêm trong hộp case đi kèm sẽ giúp kéo dài thời gian sử dụng của tai nghe lên đến 19 giờ. Qua đó JBL Tune 220TWS sẽ tạo cho người dùng cảm giác an tâm hơn khi sử dụng mà không phải lo lắng về vấn đề sạc pin trong những chuyến đi đường dài.', 562, 312, '1655635023.png', 15, 0, '2022-06-19 10:37:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT '0',
  `creat_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `password`, `role_as`, `creat_at`) VALUES
(40, 'Trần Kha', 'admin@gmail.com', '0988269496', 'Số 57 ngõ 22 khuyến lương, Trần Phú, Hoàng Mai, Hà Nội', '$2y$10$ZWaligOqB9mG53OkhI8DQuD51XthSvF2U5evISY8WncFMEAufOhuy', 1, '2022-06-15 17:56:45'),
(41, 'Văn Thao1', 'vanthao@gmail.com', '0985625454', 'Số 334 Vĩnh Hưng, Hà Nội', '$2y$10$ZWaligOqB9mG53OkhI8DQuD51XthSvF2U5evISY8WncFMEAufOhuy', 0, '2022-06-15 18:14:28'),
(42, 'kha', 'tranthekha25062000@gmail.com', '0988269496', '500 nguyễn khoái', '$2y$10$ZWaligOqB9mG53OkhI8DQuD51XthSvF2U5evISY8WncFMEAufOhuy', 0, '2022-06-15 18:29:06'),
(44, 'Văn Hoàng', 'test@gmail.com', '0325696542', '10 Ngh. 76/8 Dịch Vọng Hậu, Cầu Giấy, Hà Nội', '$2y$10$ZWaligOqB9mG53OkhI8DQuD51XthSvF2U5evISY8WncFMEAufOhuy', 0, '2022-06-19 09:58:30'),
(45, 'Quang Huy', 'quanghuy@gmail.com', '0325684752', '440 Đ. Khương ĐìnhHạ Đình, Thanh Xuân, Hà Nội', '$2y$10$b4bPTCBAdcgn6SqbieUvG.BnI7m.rKEqRQGnnVDZ1oAkJZhfbwVEi', 0, '2022-06-19 09:59:05'),
(46, 'Thùy Dung', 'thuydung@gmail.com', '0325847569', '334 P. Vĩnh HưngVĩnh Hưng, Hoàng Mai, Hà Nội', '$2y$10$9mc5zDtHX7rTnbbflvvXCed1l6fhXUF63CpmM4J8N5mIvtE7oIn7u', 0, '2022-06-19 09:59:27'),
(47, 'Nguyễn Hồng', 'nguyenhong@gmail.com', '0986325478', '500 Nguyễn Khoái, Thanh Long, Hai Bà Trưng, Hà Nội', '$2y$10$M.OvNd.hOq.zbctjD3KYrufpycs46LVp73Q57.Xwj/vMxT4KFbxmC', 0, '2022-06-19 10:04:11');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
