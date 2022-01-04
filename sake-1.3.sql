-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022 年 01 月 04 日 10:45
-- 伺服器版本： 10.4.21-MariaDB
-- PHP 版本： 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `sake`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `admin_pass` varchar(100) NOT NULL,
  `user_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cart_gift`
--

CREATE TABLE `cart_gift` (
  `cart_gift_id` varchar(14) NOT NULL COMMENT '訂單S開頭 不勾選A_I',
  `member_id` int(11) NOT NULL,
  `cart_quantity` int(2) NOT NULL,
  `gift_id` int(11) NOT NULL,
  `box_color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cart_gift_d_d`
--

CREATE TABLE `cart_gift_d_d` (
  `cart_g_pro_id` int(11) NOT NULL,
  `cart_gift_id` varchar(14) NOT NULL,
  `pro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cart_mark`
--

CREATE TABLE `cart_mark` (
  `cart_mark_id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `cart_sake_id` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cart_sake`
--

CREATE TABLE `cart_sake` (
  `cart_sake_id` varchar(14) NOT NULL COMMENT '訂單S開頭 不勾選A_I',
  `member_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `cart_quantity` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `discount`
--

CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL,
  `discount_code` varchar(8) NOT NULL COMMENT 'ex:2022XMAS',
  `discount_info` varchar(20) NOT NULL COMMENT 'ex:2022聖誕節優惠',
  `perscent` float NOT NULL,
  `discount_time_start` datetime NOT NULL,
  `discount_time_end` datetime NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT 'true,false',
  `create_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生',
  `modified_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `event`
--

CREATE TABLE `event` (
  `event_id` int(4) NOT NULL,
  `event_cat_id` int(1) NOT NULL COMMENT 'event_cat.event_cat_id',
  `event_name` varchar(100) NOT NULL,
  `event_time_start` datetime NOT NULL,
  `event_time_end` datetime NOT NULL,
  `event_brief` varchar(255) NOT NULL,
  `event_location` varchar(255) NOT NULL,
  `event_intro` varchar(9999) NOT NULL COMMENT '活動介紹為HTML，含細節圖片',
  `event_cost` int(10) NOT NULL,
  `event_cover` varchar(255) NOT NULL COMMENT '儲存圖片檔名在資料庫',
  `event_condition` varchar(20) NOT NULL COMMENT '可報名、已截止、已報名',
  `event_due` datetime NOT NULL COMMENT '使用DATEADD()將活動開始時間減七天',
  `event_create_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生',
  `event_update_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `event_cat`
--

CREATE TABLE `event_cat` (
  `event_cat_id` int(1) NOT NULL COMMENT '1、2、3',
  `event_cat_name` varchar(20) NOT NULL COMMENT '餐酒會、品酒會、講座'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `favorite`
--

CREATE TABLE `favorite` (
  `fav_id` int(8) NOT NULL,
  `member_id` int(8) NOT NULL COMMENT 'FK：member.member_id',
  `pro_id` int(11) NOT NULL COMMENT 'FK:清酒.商品編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `guide_a`
--

CREATE TABLE `guide_a` (
  `a_no` int(8) NOT NULL,
  `q_id` int(8) NOT NULL,
  `a_item` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `guide_clia`
--

CREATE TABLE `guide_clia` (
  `cli_id` int(8) NOT NULL,
  `q_id` int(8) NOT NULL,
  `a_no` int(8) NOT NULL,
  `a_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `guide_q`
--

CREATE TABLE `guide_q` (
  `q_id` int(8) NOT NULL,
  `q_seq` int(8) NOT NULL,
  `q_des` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `mark`
--

CREATE TABLE `mark` (
  `mark_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `pics` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_name` varchar(100) NOT NULL,
  `member_bir` date NOT NULL,
  `member_mob` varchar(50) NOT NULL,
  `member_addr` varchar(100) NOT NULL,
  `member_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `menu_pictures`
--

CREATE TABLE `menu_pictures` (
  `menu_pic_id` int(11) NOT NULL,
  `menu_pic_name` varchar(50) NOT NULL,
  `res_id` int(11) NOT NULL COMMENT 'FK：restaurant.res_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(9999) NOT NULL COMMENT '存HTML?',
  `cover_pic` varchar(255) NOT NULL,
  `pics` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_event_d`
--

CREATE TABLE `order_event_d` (
  `order_d_id` varchar(14) NOT NULL COMMENT '日期＋當天編號三碼＋e＋編號 ex:20210401e00101\r\n自訂格式不勾選A_I',
  `order_id` int(11) NOT NULL COMMENT 'FK：order_m.order_id',
  `event_id` int(4) NOT NULL COMMENT 'FK：event.event_id',
  `order_name` varchar(225) NOT NULL,
  `order_mobile` varchar(20) NOT NULL,
  `order_email` varchar(225) NOT NULL,
  `order_d_price` int(10) NOT NULL COMMENT 'FK：event.event_cost',
  `order_state` varchar(10) NOT NULL COMMENT '即將到來、已結束、已取消'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_gift_d`
--

CREATE TABLE `order_gift_d` (
  `order_g_id` int(14) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_quantity` int(2) NOT NULL,
  `order_name` varchar(225) NOT NULL,
  `order_mobile` varchar(20) NOT NULL,
  `order_email` varchar(225) NOT NULL,
  `order_d_price` int(10) NOT NULL,
  `order_state` varchar(10) NOT NULL,
  `gift_id` int(11) NOT NULL,
  `box_color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_gift_d_d`
--

CREATE TABLE `order_gift_d_d` (
  `order_g_pro_id` int(14) NOT NULL,
  `order_g_id` int(14) NOT NULL,
  `pro_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_main`
--

CREATE TABLE `order_main` (
  `order_id` int(11) NOT NULL COMMENT '日期＋當天編號三碼 ex:20210401001\r\n自訂格式不勾選A_I',
  `member_id` int(11) NOT NULL COMMENT 'FK：member.member_id',
  `type` varchar(1) NOT NULL COMMENT 'S(sake), E(event), B(subscribe)',
  `used_code` varchar(10) NOT NULL COMMENT 'FK:discount.discount_code',
  `order_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_mark`
--

CREATE TABLE `order_mark` (
  `order_mark_id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `order_d_id` varchar(14) NOT NULL COMMENT '酒標價錢，前端技術處理'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_sake_d`
--

CREATE TABLE `order_sake_d` (
  `order_d_id` varchar(14) NOT NULL COMMENT '日期＋當天編號三碼＋s＋編號 ex:20210401s00101\r\n自定義名稱不勾選A_I',
  `order_id` int(11) NOT NULL COMMENT 'FK：order_m.order_id',
  `pro_id` int(11) NOT NULL COMMENT 'FK:清酒.商品編號',
  `order_quantity` int(2) NOT NULL,
  `order_name` int(225) NOT NULL,
  `order_mobile` varchar(20) NOT NULL,
  `order_email` varchar(225) NOT NULL,
  `order_d_price` int(10) NOT NULL COMMENT '撈清酒.價格*數量',
  `order_state` varchar(10) NOT NULL COMMENT '待出貨、已出貨、已取消'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `order_sub_d`
--

CREATE TABLE `order_sub_d` (
  `order_d_id` varchar(14) NOT NULL COMMENT '日期＋當天編號三碼＋b＋編號ex:20210401b00101\r\n自訂名稱不勾選A_I',
  `order_id` int(11) NOT NULL COMMENT 'FK：order_m.order_id',
  `sub_id` int(5) NOT NULL,
  `subtime_id` int(11) NOT NULL,
  `order_mobile` varchar(20) NOT NULL,
  `order_email` varchar(225) NOT NULL,
  `order_d_price` int(10) NOT NULL COMMENT '撈訂閱方案.價格 * 訂閱週期.月數*訂閱週期.折扣',
  `order_state` varchar(10) NOT NULL COMMENT '進行中、已結束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `payment_detail`
--

CREATE TABLE `payment_detail` (
  `payment_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT 'FK: order_main.order_id\r\nex:20210401001',
  `card_num` int(16) NOT NULL,
  `security_code` int(3) NOT NULL,
  `expire_date` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `product_container`
--

CREATE TABLE `product_container` (
  `container_id` int(11) NOT NULL,
  `container_img` varchar(255) NOT NULL,
  `container_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product_container`
--

INSERT INTO `product_container` (`container_id`, `container_img`, `container_name`) VALUES
(1, '4-1.jpg', '陶器酒壺'),
(2, '4-2.jpg', '陶器豬口杯'),
(3, '3.jpg', '津輕金箔玻璃清酒杯'),
(4, '1-1.png', '純錫製清酒瓶和木造清酒杯的套組'),
(5, '1-2.png', '純錫製清酒瓶'),
(6, '1-3.png', '木造清酒杯'),
(7, '1-4.png', '純錫製清酒瓶和木造清酒杯的套組'),
(8, '1-5.png', '純錫製清酒瓶和木造清酒杯的套組'),
(9, '2.png', '純錫豬口杯'),
(10, '0', '無');

-- --------------------------------------------------------

--
-- 資料表結構 `product_format`
--

CREATE TABLE `product_format` (
  `format_id` int(11) NOT NULL COMMENT 'ex:1234',
  `pro_price` int(8) NOT NULL COMMENT 'ex:2,000',
  `pro_capacity` int(8) NOT NULL COMMENT 'ex:720ml',
  `pro_loca` varchar(20) NOT NULL COMMENT '山形縣',
  `pro_level` varchar(10) NOT NULL COMMENT '純米大吟釀',
  `pro_brand` varchar(20) NOT NULL,
  `pro_essence` int(5) NOT NULL COMMENT '40%',
  `pro_alco` int(5) NOT NULL,
  `pro_marker` varchar(50) NOT NULL,
  `rice` varchar(50) NOT NULL COMMENT '雄町',
  `pro-taste` varchar(100) NOT NULL COMMENT '厚薄、酸甜、辛口',
  `pro-temp` varchar(100) NOT NULL COMMENT '冷藏',
  `pro_gift` int(5) NOT NULL,
  `pro_mark` tinyint(1) NOT NULL,
  `container_id` int(11) NOT NULL COMMENT '1+1禮盒酒器要從規格表去拿'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product_format`
--

INSERT INTO `product_format` (`format_id`, `pro_price`, `pro_capacity`, `pro_loca`, `pro_level`, `pro_brand`, `pro_essence`, `pro_alco`, `pro_marker`, `rice`, `pro-taste`, `pro-temp`, `pro_gift`, `pro_mark`, `container_id`) VALUES
(1, 980, 720, '滋賀縣', '純米酒', '喜樂長', 65, 16, '喜多酒造', '吟吹雪 山田錦', '輕盈 辛口 偏酸', '冷酒', 0, 1, 10),
(2, 1680, 720, '京都府', '純米吟醸', '白木久', 55, 16, '白杉酒造', '越光米', '輕盈 辛口 偏甜', '冷酒 常溫', 0, 1, 10),
(3, 3080, 720, '福井縣', '純米大吟釀', '鳳凰源平', 48, 17, '源平酒造', '山田錦', '適中 辛口 偏酸', '冷酒 常溫 燗酒', 0, 1, 10),
(4, 1680, 720, '長野縣', '純米大吟釀', '真澄', 40, 15, '宮坂酒造', '山田錦', '適中 辛口 偏甜', '常溫 燗酒', 0, 1, 10),
(5, 2080, 720, '兵庫縣', '純米大吟釀', '真澄', 45, 16, '宮坂酒造', '美山錦', '輕盈 甘口 偏酸', '燗酒', 0, 1, 10),
(6, 1280, 720, '長野縣', '純米大吟釀', '真澄', 45, 16, '宮坂酒造', '山田錦', '輕盈 甘口 偏甜', '冷酒', 0, 1, 10),
(7, 1680, 720, '長野縣', '純米吟醸', '真澄', 55, 15, '宮坂酒造', '美山錦 山田錦山惠錦', '適中 甘口 偏酸', '冷酒 常溫', 0, 1, 10),
(8, 2080, 720, '長野縣', '純米酒', '真澄', 70, 15, '宮坂酒造', '美山錦HITOGOKOCHI', '適中 甘口 偏甜', '冷酒 常溫 燗酒', 2, 1, 10),
(9, 1780, 720, '長野縣', '純米吟醸', '真澄', 55, 12, '宮坂酒造', '山惠錦HITOGOKOCHI', '輕盈 辛口 偏酸', '常溫 燗酒', 0, 1, 10),
(10, 780, 720, '長野縣', '本釀造', '真澄', 60, 15, '宮坂酒造', '美山錦', '輕盈 辛口 偏甜', '燗酒', 0, 1, 10),
(11, 2680, 720, '福島縣', '純米大吟釀', '會津譽', 39, 16, '會津譽酒造', '山田錦 五百萬石', '適中 辛口 偏酸', '冷酒', 0, 1, 10),
(12, 2080, 720, '群馬縣', '純米大吟釀', '水芭蕉', 50, 16, '永井酒造', '山田錦', '適中 辛口 偏甜', '冷酒 常溫', 0, 1, 10),
(13, 1280, 720, '群馬縣', '純米大吟釀', '水芭蕉', 50, 16, '永井酒造', '山田錦', '輕盈 甘口 偏酸', '冷酒 常溫 燗酒', 1, 1, 10),
(14, 1680, 720, '福島縣', '純米大吟釀', '會津譽', 40, 16, '會津譽酒造', '山田錦', '輕盈 甘口 偏甜', '常溫 燗酒', 3, 1, 1),
(15, 880, 720, '高知縣', '純米酒', '文佳人', 55, 16, '有澤酒造', '未公開', '適中 甘口 偏酸', '燗酒', 3, 1, 2),
(16, 3780, 720, '高知縣', '純米吟醸', '文佳人', 50, 17, '有澤酒造', '未公開', '適中 甘口 偏甜', '冷酒', 1, 1, 10),
(17, 380, 180, '廣島縣', '吟釀', '誠鏡/幻', 58, 16, '中尾釀造', '新千本', '輕盈 辛口 偏酸', '冷酒 常溫', 2, 1, 10),
(18, 980, 720, '新潟縣', '吟釀', '久保田', 55, 15, '朝日酒造', '五百萬石', '輕盈 辛口 偏甜', '冷酒 常溫 燗酒', 2, 1, 10),
(19, 380, 180, '廣島縣', '吟釀', '誠鏡/幻', 58, 16, '中尾釀造', '新千本', '適中 辛口 偏酸', '常溫 燗酒', 0, 1, 10),
(20, 980, 720, '新潟縣', '吟釀', '久保田', 55, 15, '朝日酒造', '五百萬石', '適中 辛口 偏甜', '燗酒', 0, 1, 10),
(21, 380, 300, '福岡縣', '本釀造', '喜多屋', 70, 14, '喜多屋', '福岡縣產米', '輕盈 甘口 偏酸', '冷酒', 3, 1, 3),
(22, 1380, 720, '福岡縣', '本釀造', '庭之鶯', 68, 15, '山口酒造', '山田錦 夢一獻', '輕盈 甘口 偏甜', '冷酒 常溫', 0, 1, 10),
(23, 1980, 720, '長野縣', '純米吟釀', '真澄', 55, 15, '宮坂酒造', '美山錦 人心地', '適中 甘口 偏酸', '冷酒 常溫 燗酒', 2, 1, 10),
(24, 1880, 720, '長野縣', '純米吟釀', '真澄', 55, 15, '宮坂酒造', '美山錦 山田錦', '適中 甘口 偏甜', '常溫 燗酒', 2, 1, 10),
(25, 1380, 720, '長野縣', '純米吟釀', '真澄', 55, 12, '宮坂酒造', '美山錦 人心地', '輕盈 辛口 偏酸', '燗酒', 2, 1, 10),
(26, 1580, 720, '宮城縣', '大吟釀', '澤乃井', 35, 17, '', '山田錦', '輕盈 辛口 偏甜', '冷酒', 1, 1, 10),
(27, 880, 720, '兵庫縣', '大吟釀', '小西酒造', 50, 16, '小西酒造', '山田錦', '適中 辛口 偏酸', '冷酒 常溫', 0, 1, 10),
(28, 1580, 720, '宮城縣', '大吟釀', '天上夢幻', 40, 16, '中勇酒造', '山田錦', '適中 辛口 偏甜', '冷酒 常溫 燗酒', 0, 1, 10),
(29, 880, 720, '兵庫縣', '大吟釀', '小西酒造', 50, 16, '小西酒造', '山田錦', '輕盈 甘口 偏酸', '常溫 燗酒', 0, 1, 10),
(30, 780, 720, '兵庫縣', '大吟釀', '白鶴', 50, 16, '白鶴酒造', '山田錦 日本晴', '輕盈 甘口 偏甜', '燗酒', 1, 1, 10),
(31, 780, 720, '兵庫縣', '大吟釀', '大關', 50, 15, '大関株式會社', '未標示', '適中 甘口 偏酸', '冷酒', 0, 1, 10),
(32, 480, 720, '愛知縣', '純米酒', '金虎', 60, 15, '金虎酒造', '一般米', '適中 甘口 偏甜', '冷酒 常溫', 0, 1, 10),
(33, 1280, 720, '愛知縣', '純米大吟釀', '金虎', 40, 15, '金虎酒造', '山田錦', '輕盈 辛口 偏酸', '冷酒 常溫 燗酒', 1, 1, 10),
(34, 12800, 720, '山形縣', '大吟釀', '十四代', 35, 16, '高木酒造', '山田錦', '輕盈 辛口 偏甜', '常溫 燗酒', 3, 1, 10),
(35, 880, 720, '奈良縣', '純米酒', '鷹長', 70, 15, '油長酒造', '奈良米', '適中 辛口 偏酸', '燗酒', 0, 1, 10),
(36, 3180, 1800, '福島縣', '本釀造', '十四代', 60, 15, '高木酒造', '美山錦', '適中 辛口 偏甜', '冷酒', 0, 1, 10),
(37, 880, 720, '奈良縣', '純米酒', '風之森', 70, 15, '油長酒造', '奈良米', '輕盈 甘口 偏酸', '冷酒 常溫', 0, 1, 10),
(38, 1280, 720, '新潟縣', '大吟釀', '越後櫻', 50, 15, '越後櫻酒造', '山田錦', '輕盈 甘口 偏甜', '冷酒 常溫 燗酒', 0, 1, 10),
(39, 880, 720, '秋田', '純米酒', 'Private Lab', 60, 13, '新政酒造', '小町', '適中 甘口 偏酸', '常溫 燗酒', 0, 1, 10),
(40, 1180, 720, '群馬縣', '吟釀', '龍神', 60, 17, '龍神酒造', '未公開', '適中 甘口 偏甜', '燗酒', 1, 1, 10),
(41, 780, 750, '三重縣', '純米酒', '作', 65, 15, '清水清三郎商店', '未標示', '輕盈 辛口 偏酸', '冷酒', 0, 1, 10),
(42, 1380, 720, '新潟縣', '吟釀', '青木酒造', 60, 16, '青木酒造', '越淡麗', '輕盈 辛口 偏甜', '冷酒 常溫', 3, 1, 9),
(43, 780, 750, '三重縣', '純米酒', '作', 65, 15, '清水清三郎商店', '未標示', '適中 辛口 偏酸', '冷酒 常溫 燗酒', 0, 1, 10),
(44, 1180, 720, '佐賀縣', '純米大吟釀', '鍋島', 45, 16, '富久千代酒造', '山田錦', '適中 辛口 偏甜', '常溫 燗酒', 0, 1, 10),
(45, 1380, 720, '德島縣', '吟釀', '本家松浦酒造', 58, 19, '本家松浦酒造', '山田錦', '輕盈 甘口 偏酸', '燗酒', 0, 1, 10),
(46, 780, 720, '山形縣', '純米吟釀', '花邑', 50, 15, 'くどき上手', '山田錦 美山錦', '輕盈 甘口 偏甜', '冷酒', 0, 1, 10),
(47, 680, 300, '新潟縣', '吟釀', '加茂錦酒造', 60, 15, '加茂錦酒造', '山田錦', '適中 甘口 偏酸', '冷酒 常溫', 0, 1, 10),
(48, 580, 720, '富山縣', '純米吟釀', '滿壽泉', 58, 15, '桝田酒造店', '山田錦', '適中 甘口 偏甜', '冷酒 常溫 燗酒', 0, 1, 10),
(49, 2180, 720, '群馬縣', '純米大吟釀', '龍神', 39, 16, '未公開', '山田錦', '輕盈 辛口 偏酸', '常溫 燗酒', 0, 1, 10),
(50, 1380, 720, '長野縣', '吟釀', '大雪溪酒造', 55, 15, '大雪溪酒造', '美山錦', '輕盈 辛口 偏甜', '燗酒', 0, 1, 10),
(51, 1380, 720, '岐阜下呂', '吟釀', '奧飛驒酒造', 60, 14, '奧飛驒酒造', 'ひだほまれ', '適中 辛口 偏酸', '冷酒', 0, 1, 10),
(52, 780, 720, '青森縣', '純米吟釀', '陸奥八仙', 55, 16, '八戸酒造', '青森縣産米', '適中 辛口 偏甜', '冷酒 常溫', 0, 1, 10),
(53, 1980, 1800, '宮城縣', '本釀造', '墨迺江', 60, 15, '墨廼江酒造', '五百萬石', '輕盈 甘口 偏酸', '冷酒 常溫 燗酒', 0, 1, 10),
(54, 880, 720, '山梨縣', '本釀造', '七賢', 70, 16, '七賢酒造', '人心地、朝日の夢', '輕盈 甘口 偏甜', '常溫 燗酒', 0, 1, 10),
(55, 980, 720, '新潟縣', '本釀造', '八海山', 60, 16, '八海山酒造', '五百萬石', '適中 甘口 偏酸', '燗酒', 3, 1, 9),
(56, 1280, 720, '廣島縣', '本釀造', '賀茂鶴', 60, 15, '賀茂鶴酒造', '八反錦', '適中 甘口 偏甜', '冷酒', 0, 1, 10),
(57, 1280, 1800, '秋田縣', '本釀造', '天壽', 70, 15, '天壽酒造', '秋田縣產米', '輕盈 辛口 偏酸', '冷酒 常溫', 0, 1, 10),
(58, 14800, 1800, '山形縣', '本釀造', '十四代', 60, 15, '高木酒造', '五百萬石', '輕盈 辛口 偏甜', '冷酒 常溫 燗酒', 0, 1, 10);

-- --------------------------------------------------------

--
-- 資料表結構 `product_gift`
--

CREATE TABLE `product_gift` (
  `gift_id` int(11) NOT NULL,
  `pro_gift` int(5) NOT NULL COMMENT '無、1入、2入、1+1',
  `gift_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product_gift`
--

INSERT INTO `product_gift` (`gift_id`, `pro_gift`, `gift_name`) VALUES
(1, 0, '無'),
(2, 1, '1入'),
(3, 2, '2入'),
(4, 3, '1+1');

-- --------------------------------------------------------

--
-- 資料表結構 `product_gift_d`
--

CREATE TABLE `product_gift_d` (
  `gift_d_id` int(11) NOT NULL,
  `gift_id` int(11) NOT NULL COMMENT '1,1,2,2,3,3,',
  `gift_img` varchar(255) NOT NULL,
  `box_color` varchar(10) NOT NULL COMMENT '黑,紅,白'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `product_sake`
--

CREATE TABLE `product_sake` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(50) NOT NULL COMMENT '純米大吟釀　夢殿',
  `pro_stock` int(11) NOT NULL,
  `pro_selling` int(11) NOT NULL COMMENT '篩選用，用++的方式',
  `pro_intro` varchar(700) NOT NULL,
  `pro_condition` varchar(10) NOT NULL COMMENT '補貨中',
  `format_id` int(11) NOT NULL,
  `pro_img` varchar(255) NOT NULL,
  `pro_creat_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生',
  `pro_unsell_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product_sake`
--

INSERT INTO `product_sake` (`pro_id`, `pro_name`, `pro_stock`, `pro_selling`, `pro_intro`, `pro_condition`, `format_id`, `pro_img`, `pro_creat_time`, `pro_unsell_time`) VALUES
(1, '篠峯 雄町純米大吟醸', 10, 0, '回購率極高！千代酒造頂級酒款，雄町愛好者不可錯過的一品使用岡山縣赤磐產的雄町，明利酵母與九號酵母雙酵母，研磨至50%取其中段的精華，截取香味最穩定的中取，以生酒的姿態装瓶的纯米大吟釀。開瓶可以感受到甜甜的果香，入口的溫柔酒感帶出迷人的香味，滑入喉嚨後留下甜美溫柔高雅的餘韻，整體輕快又圓潤，由明利酵母與九號酵母釀製而成，混合雄町特有的香氣。清澈輕盈的風味還可以感受到微硬水的微微碳酸感，回購率極高好喝的一品！', '供應中', 1, 'M0001.png', '2022-01-03 18:12:01', '2022-01-03 18:12:01'),
(2, '榮光富士 純米大吟醸 黒狐', 10, 0, '超人氣黑狐入荷 自古以來黑狐與白狐是獲得日月精華與多年修行之後幻化成的妖狐，雖然長得有一點點可怕，其實是帶來吉兆的『瑞獸』，特別是黑狐，被認為是北斗七星的化身也是和平的象徵，太平盛世才會出現的黑狐，在大家喜慶的宴席時陪伴，一起度過和平的一年。採用長野縣產的美山錦，激發出美山錦的魅力，溫柔的口感與美味再進化，充滿果實感與多汁的優雅美味，美山錦的鮮甜美味與廣泛的搭餐性都令人印象深刻。', '供應中', 2, 'M0002.png', '2022-01-03 18:12:02', '2022-01-03 18:12:02'),
(3, '★喜樂長FIGHT！台湾！純米 應援酒', 10, 0, '如同夏季吹過琵琶湖面涼爽的風、表現爽快又舒服的一款酒。微微柑橘類與香草系的香氣撲鼻、飲入口中，輕巧地滲透心脾，能品嘗到些許的甜味與輕快的酸味滑過舌面，尾韻帶有爽快dry感。顺滑清澈的美味隨之而來是，水嫩的酸味伴隨著清涼感，冰飲的消暑伴隨清澈香氣和溫柔的甜味在口中滿溢。', '供應中', 3, 'M0003.png', '2022-01-03 18:12:03', '2022-01-03 18:12:03'),
(4, '白木久BLACK LABEL Brilliant 純米吟醸', 10, 0, 'BLACK LABEL系列採用黑麴釀造!優雅美麗的甜味和酸味，直覺會以為黑麴釀製出的酒會特別酸，但其實BLACK LABEL系列所強調的風格比起酸度更強調酒米的旨味與香氣的力度，甜味較vibrant更加清爽入口彷彿吃下現摘草莓般的味道，散發出多汁的甜味和酸味，細膩的微發泡感，更讓整體喝起來甜而不膩，非常清爽好入口。', '供應中', 4, 'M0004.png', '2022-01-03 18:12:04', '2022-01-03 18:12:04'),
(5, '鳳凰源平 純米大吟醸', 10, 0, '如浴火鳳凰的蛻變重生，將酒的形象與酒造的精神反映在酒標上，深紫色與金箔細膩的交織而成誕生美麗的鳳凰，感受得到精細的設計工藝。使用全量山田錦精米至48%。香氣為華麗的吟釀香。熟成蘋果般的香氣。收尾俐落，輕快且飽滿的口感的純米大吟釀酒款。推薦的飲用方法是冰溫或是略冰。華麗的香氣組成，在甜味與酸味當中取得平衡的味道。可以確實感受到米的旨味的酒款。香氣與味道會隨著溫度而變化是其旨趣，漂亮且水潤感滿溢的味道使人愛不釋口。選用日本百水「御清水」，口感柔軟滑順是其特點。With Original Phoenix Carton Box', '供應中', 5, 'M0005.png', '2022-01-03 18:12:05', '2022-01-03 18:12:05'),
(6, '真澄 夢殿純米大吟醸', 10, 0, '真澄純米酒釀造的最高峰作品。每年代表富士見藏參加全國清酒品評會的評選。\n口味極具層次，有優雅而清新的果香。', '供應中', 6, 'M0006.png', '2022-01-03 18:12:06', '2022-01-03 18:12:06'),
(7, '真澄 七號純米大吟醸', 10, 0, '用發源於真澄酒藏的七號酵母和長野縣產美山錦米，採用傳統技法山廢釀法釀造而成。是長野縣與真澄酒藏極具代表性的清酒。口感穩重中帶酸，有淡淡的果香，酒體優雅而具層次感。海外人氣度極高。於2015年International Wine Challenge中獲得銀獎。', '供應中', 7, 'M0007.png', '2022-01-03 18:12:07', '2022-01-03 18:12:07'),
(8, '真澄 山花純米大吟醸', 10, 0, '酒名取自李白的詩「兩人對酌山花開，一杯一杯又一杯」。口味淡雅清麗，有果實般的芳香，令人聯想起初春山峰上盛開的鮮花。海外人氣極高。於2015年International Wine Challenge中獲得銀牌。', '供應中', 8, 'M0008.png', '2022-01-03 18:12:08', '2022-01-03 18:12:08'),
(9, '真澄 辛口生一本 純米吟醸', 10, 0, '「生一本」意為全釀造工序於單一酒藏中完成。真澄極具代表性的支柱產品之一，有青蘋果的芳香，酒體透明，口感微辛、清爽，入口無痕，兼具辛口與柔和口感的絕妙平衡。極具特色的黑色酒標已成為真澄的識別色，自發賣以來廣受人們喜愛。於2015年International Wine Challenge中獲得銀牌。', '供應中', 9, 'M0009.png', '2022-01-03 18:12:09', '2022-01-03 18:12:09'),
(10, '真澄 奧傳寒造 純米酒', 10, 0, '採用發源於真澄的七號酵母釀造而成。口感溫和，甘辛適中，帶米香。適合常溫或熱飲。於2012年International Wine Challenge中獲得銅獎。', '供應中', 10, 'M0010.png', '2022-01-03 18:12:10', '2022-01-03 18:12:10'),
(11, 'YAWARAKA TYPE-1 純米吟醸', 10, 0, '2015年8月發賣的新產品。革命性的將酒精度降低到了12度的同時，不失整體的平衡。口感輕柔，有淡淡的果實清香。會讓人在不知不覺中一杯一杯的喝下去。非常適合作為午餐佐酒。', '供應中', 11, 'M0011.png', '2022-01-03 18:12:11', '2022-01-03 18:12:11'),
(12, '真澄本醸造特撰 本醸造', 10, 0, '普通酒類別中性價比最高。2014年通過改進技術，降低精米步合，大幅提高了酒的品質，使之香味更多，口感更輕快，冷飲熱飲皆可。在2015年的International Wine Challenge品評會中獲得銀牌。', '供應中', 12, 'M0012.png', '2022-01-03 18:12:12', '2022-01-03 18:12:12'),
(13, '會津譽 播州山田錦 純米大吟釀', 10, 0, '此款酒為會津譽酒造最為高級的酒種，將播州山田錦削去表層60%，僅留下最精華的40%心白部分進行釀製；柑桔以及蘋果的香氣明顯，酒體本身濃醇。此款在IWC2013年獲得金牌，更於2015年得到冠軍酒的殊榮，2016年世界領袖高峰會為安倍首相贈各國首相禮。\n\n\n強烈濃郁的水果香氣，入喉後在口中可感受芒果、菠蘿蜜、熱帶水果、黑醋栗等餘韻；酒體渾厚飽滿，尾韻綿延十分悠長。\n\n\n因其香氣與口味較重，推薦給喝習慣紅白葡萄酒想嘗試日本酒的同好。', '供應中', 13, 'M0013.png', '2022-01-03 18:12:13', '2022-01-03 18:12:13'),
(14, '水芭蕉 鼠年限定 純米大吟釀', 10, 0, '『世界米其 餐廳指定品牌』  \n\n\n搭配2020東京奧運，生肖排列成奧運環狀、雷射雕刻瓶身，極具收藏價值!\n\n\n\n\n\n\n『柔軟淡麗的細緻清香』\n\n\n白桃洋梨香氣飽滿，淡雅清新的米香陪襯其中，清澈水質帶來的自然輕甜，在口中緩緩綻放香氣綿延持久，喝起來柔順優雅。', '供應中', 14, 'M0014.png', '2022-01-03 18:12:14', '2022-01-03 18:12:14'),
(15, '水芭蕉 牛年限定 純米大吟釀', 10, 0, '2021丑年來臨，酒造推出一年一度的新年限定酒。\n\n\n使用兵庫縣三木市契約栽培的山田錦釀造，開瓶洋溢優雅果香，口感水潤飽滿，細緻米旨味綿延不絕。雷雕瓶身設計精美，猛牛氣勢如虹，期望為新的一年招福迎春！', '供應中', 15, 'M0015.png', '2022-01-03 18:12:15', '2022-01-03 18:12:15'),
(16, '會津譽 鳳凰標大吟釀', 10, 0, '這瓶大吟釀本身帶有青蘋果、水梨、花香以及成熟核果香氣，入喉後略微辛口清爽，後韻帶有旨味；於2014、2017年IWC競賽中獲得金獎，並由日本國家釀酒研究所頒與金獎14次，2016年亦獲得年度新酒金賞。\n\n\n乾淨成熟的香氣，良好的深度。入口後可以感受到菠蘿、蘋果以及芒果的味道，後段會帶有圓滑的苦味及旨味餘韻。', '供應中', 16, 'M0016.png', '2022-01-03 18:12:16', '2022-01-03 18:12:16'),
(17, '文佳人 Liseur 特別純米', 10, 0, '在2017年由法國舉辦的清酒比賽Kura Master獲得純米部門金賞。\r\n\r\n一次火入新鮮且優雅的香氣，口感柔順容易飲用，建議可以稍等回溫後風味更加，是可以和紅白酒相比擬的完美食中酒。\r\n\r\nLiseur在法文意指有氣質、飽讀詩書的女性的名詞，也就是品牌名稱「文佳人」。', '供應中', 17, 'M0017.png', '2022-01-03 18:12:17', '2022-01-03 18:12:17'),
(18, '文佳人 Liseur 純米吟釀', 10, 0, '為了避免酒標上面的資訊帶給品飲的消費者主觀意識，身為酒造藏人的自信心，文佳人的「リズール」系列作對於「酒米」、「日本酒度」以及「酸度」完全不公開，希望帶給消費者最直接的感受。\n\n\n新鮮、一次火入所帶有的些微氣泡感十分引人入勝。\n\n\n溫和且優雅的香氣，令人耳目一新的酸度所帶來的清新感，是一支十分完美的“食中酒”，搭配生魚片料理更是十分合適。', '供應中', 18, 'M0018.png', '2022-01-03 18:12:18', '2022-01-03 18:12:18'),
(19, '中尾 誠鏡青瓶 吟釀', 10, 0, '使用廣島縣產米-「新千本」釀造，一款具有柔軟清新的香氣，口感稍帶辛口的吟釀酒。引人注目的清澄透明藍色酒瓶還附上與瓶身同樣材質的玻璃酒杯，相當受人喜愛。', '供應中', 19, 'M0019.png', '2022-01-03 18:12:19', '2022-01-03 18:12:19'),
(20, '久保田 千壽吟釀', 10, 0, '1985年創立久保田品牌起販售至今。嚴選產米聖地－新潟縣的酒造好適米「五百萬石」，精米至55%的吟釀酒款。2008年春為使酒質更上一層樓，更將麴米的精米度提升到日本國稅局規定的大吟釀標準（50%）。香味高雅、口感順暢，具有馥郁辛辣的個性，多喝幾杯都不會膩口的淡麗辛口代表性酒款之一。', '供應中', 20, 'M0020.png', '2022-01-03 18:12:20', '2022-01-03 18:12:20'),
(21, '喜多屋 九州生冷用 本釀造', 10, 0, '將鮮榨的生酒，放置於零下環境仔細貯藏，僅在裝瓶時火入一次，保有生酒的新鮮風味和涼爽口感。', '供應中', 21, 'M0021.png', '2022-01-03 18:12:21', '2022-01-03 18:12:21'),
(22, '庭之鶯 鶯辛本釀造', 10, 0, '米的旨味沉穩豐潤，尾韻能夠感受到辛口帶來的輕柔餘韻。冷熱皆宜，可以與任何溫度的料理做搭配。特別推薦喜愛辛口酒的朋友，以熱燗方式飲用，更能品嘗出酒的辛口感。', '供應中', 22, 'M0022.png', '2022-01-03 18:12:22', '2022-01-03 18:12:22'),
(23, '真澄 真朱AKA 山廢純米吟釀', 10, 0, '具有奶酪與芝士一樣的迷人香氣和深沈內斂的韻味。\n「真朱」的名字源起於古人使用的天然印泥的朱紅顏色。正如這鮮艷的朱紅色一般，「真朱」使人聯想到奶酪與芝士所散發出的優雅但迷人的香氣，飽滿而又沈穩的旨味。搭配有濃郁風味的食材，酒與料理相互襯托，更提升了料理的美味。', '供應中', 23, 'M0023.png', '2022-01-03 18:12:23', '2022-01-03 18:12:23'),
(24, '真澄 漆黒KURO 純米吟釀', 10, 0, '注重各種口感的平衡，酒體兼具透明感與飽滿度。\n「漆黑」的酒名取自傳統漆器上塗的漆黑而又有光澤的顏色。在釀造上注重各種口感的平衡，酒體乾淨、透明，酒中豐富的旨味又使得酒體更加飽滿、立體。搭配的料理從日常三餐到豪華宴席均可，是真澄旗艦系列中最具可塑性的酒款。', '供應中', 24, 'M0024.png', '2022-01-03 18:12:24', '2022-01-03 18:12:24'),
(25, '真澄 白妙SHIRO 純米吟釀', 10, 0, '用樹皮的纖維所編織出來的白色的織布就是白妙，這款酒如同織布一般的輕柔淡雅口感，酒精感非常低，帶有旨在釀造適合日常輕鬆飲用的酒，低酒精度更易入口。', '供應中', 25, 'M0025.png', '2022-01-03 18:12:25', '2022-01-03 18:12:25'),
(26, '澤乃井 凰大吟釀', 10, 0, '★2019-2020年連續2年榮獲 東京國稅局酒類評鑑會 清酒吟釀部門 優等賞\n\n\n使用酒米之王、特A地區的山田錦，精磨至35%。全程手工以耗時費力的箱麴製麴，透過杜氏、藏人最高技術誕生而成、為該酒造最高等級的大吟釀。華麗奔放的高雅香氣，細緻悠長的尾韻，搭配典雅的紙盒裝箱，送禮自用兩相宜。', '供應中', 26, 'M0026.png', '2022-01-03 18:12:26', '2022-01-03 18:12:26'),
(27, '久保田 大吟釀 原酒', 10, 0, '每年限定1月、7月岀荷限定商品。\n隨著海外限定版「 久保田 吟釀原酒」停售，所調整再出發的新款！受到疫情影響，一直推遲上市時間。\n\n\n優雅華麗的香氣，雖是原酒，但仍可感受到酒質中微甜甘味，道與繊細滑潤的酒質。與前菜搭配外，亦可搭配較為濃郁的主食輕鬆化解油膩感。建議冷飲！與奶油類可搭配，如奶油起士、鮭魚卵醬油醃漬、乾燒蝦仁等。', '供應中', 27, 'M0027.png', '2022-01-03 18:12:27', '2022-01-03 18:12:27'),
(28, '天上夢幻 大吟釀 山田錦', 10, 0, '★榮獲2021年IWC (International Wine Challenge)大吟釀部門銀賞\n★2020-21年連續兩年榮獲 最適合葡萄酒杯品飲大賽(WGO)premium大吟釀部門金賞\n★榮獲2019年 日本SAKE COMPETITION吟釀部門第一名\n★榮獲2019年 全美日本酒歡評會 大吟釀A部門 金賞 «\n\n\n華麗的吟釀香氣加上有如水果般豐潤香氣。優雅高雅的柔和口感，乾淨俐落、完成度相當高的逸品。建議仔細冰鎮後，使用葡萄酒杯，可品味到更為細緻香氣的樂趣。', '供應中', 28, 'M0028.png', '2022-01-03 18:12:28', '2022-01-03 18:12:28'),
(29, '小西 冷榨大吟釀 金', 10, 0, '★榮獲2021年IWC (International Wine Challenge)大吟釀部門入賞\n★榮獲2021年日本最適合葡萄酒杯品飲大賽(WGO)主要部門最高金賞\n\n\n中度酒體, 口感圓潤飽滿, 果香豐富, 搭餐單飲皆宜, 建議冷藏後以白酒杯飲用。\n最適合搭配帶有醬料調味的魚肉類料理。', '供應中', 29, 'M0029.png', '2022-01-03 18:12:29', '2022-01-03 18:12:29'),
(30, '白鶴 大吟釀', 10, 0, '★榮獲2021年IWC (International Wine Challenge)大吟釀部門入賞\n★榮獲2021年日本最適合葡萄酒杯品飲大賽(WGO)主要部門金賞\n★2011-2018連續8年Monde Selection金賞受賞\n★榮獲2015年日本最適合葡萄酒杯品飲大賽(WGO)大吟釀酒部門最高金賞\n\n特別使用綠色磨砂霧瓶，更凸顯其低調內斂的特質。沉穩香氣、淡麗適中的風味，適合搭配各式料理，是佐餐的精緻清酒首選。', '供應中', 30, 'M0030.png', '2022-01-03 18:12:30', '2022-01-03 18:12:30'),
(31, '大關 長兵衛 大吟釀清酒', 10, 0, '以酒藏（釀酒工廠）的創業者名為商品名的大關代表性大吟釀酒。新鮮的果香及濃郁口感為本品的特徵。', '供應中', 31, 'M0031.png', '2022-01-03 18:12:31', '2022-01-03 18:12:31'),
(32, '金虎 純米', 10, 0, '以蓬鬆的口感加上酥脆的飲後口感產生出溫柔平靜的氣味', '供應中', 32, 'M0032.png', '2022-01-03 18:12:32', '2022-01-03 18:12:32'),
(33, '金虎純米大吟釀', 10, 0, 'Yamada Nishiki純米大吟釀的華麗優雅的味道與Kintora Brewery美麗而舒適的口感相結合。', '供應中', 33, 'M0033.png', '2022-01-03 18:12:33', '2022-01-03 18:12:33'),
(34, '十四代 播州山田錦 中取大吟釀', 10, 0, '使用兵庫縣特A地區的山田錦經米至35%，以傳統蓋麴法、長期低溫發酵，造就出極度華麗豐潤吟釀香氣的限定大吟釀酒。', '供應中', 34, 'M0034.png', '2022-01-03 18:12:34', '2022-01-03 18:12:34'),
(35, '鷹長 純米 菩提酛', 10, 0, '菩提酛製法，是室町時代(1400年代)時於奈良菩提山正暦寺被研發岀來的方法。\n於釀酒過程中使用生的米為它的特徵。\n使用正暦寺・寺領的米和水，以及「正暦寺乳酸菌」和「正暦寺酵母」造成的酒母，融合了近代釀造法的奈良縣獨有地域特性的濃厚旨口的純米酒。\n另外，這個菩提酛的製法在正暦寺，亦是被後人世代相傳的文化精神。', '供應中', 35, 'M0035.png', '2022-01-03 18:12:35', '2022-01-03 18:12:35'),
(36, '朝日鷹 特撰本釀造', 10, 0, '知名品牌「十四代」藏元-高木酒造的特撰本釀造。 \n芳醇的香氣和俐落新鮮的風味，雖然是本釀造同時飄逸著吟釀香氣，相較十四代的「本丸」，品質幾乎沒有差別！ \n是山形縣內限定的「真正地酒」，每年6月和11月限定出品的本釀造低溫貯藏酒。', '供應中', 36, 'M0036.png', '2022-01-03 18:12:36', '2022-01-03 18:12:36'),
(37, 'ALPHA 風の森 TYPE7 2020', 10, 0, 'TYPE7的樂趣之一就是追求當時能感受到的露葉味道', '供應中', 37, 'M0037.png', '2022-01-03 18:12:37', '2022-01-03 18:12:37'),
(38, '越後櫻 醉樂無極 大吟釀', 10, 0, '使用山田錦50%，扁平精米技術，造出新潟淡麗辛口風格，入口清爽舒服，口腔溫度暖化後白氣呈現，酒感悠長，口感豐富。', '供應中', 38, 'M0038.png', '2022-01-03 18:12:38', '2022-01-03 18:12:38'),
(39, '亜麻猫 第12世代', 10, 0, '它使用具有強烈酸度的燒酒九曲（白酒麯）釀造，是您可以享受有別於一般清酒酸度的作品。', '供應中', 39, 'M0039.png', '2022-01-03 18:12:39', '2022-01-03 18:12:39'),
(40, '龍神 吟釀生詰原酒 隱藏酒', 10, 0, '猶如白桃般的柔和香甜的香氣，甜美多汁、略帶果酸的口感、沉穩的酒體悠長的餘韻，十分容易品飲。', '供應中', 40, 'M0040.png', '2022-01-03 18:12:40', '2022-01-03 18:12:40'),
(41, '作 玄乃智', 10, 0, '清新的香氣，如青蘋果和強烈的酸度。它是一種純米酒，味道濃郁，與食物相得益彰。無論是冷的還是熱的，都可以盡情享用。', '供應中', 41, 'M0041.png', '2022-01-03 18:12:41', '2022-01-03 18:12:41'),
(42, '鶴齢 吟醸生酒', 10, 0, '剛開栓時氣泡感較明顯，入口先感受到活潑飽滿的米香，中段開始出現杏桃和西洋梨的果香，後段部分因為氣泡感的關係非常乾淨舒服，這款清酒的風格有點類似生啤酒的調性。', '供應中', 42, 'M0042.png', '2022-01-03 18:12:42', '2022-01-03 18:12:42'),
(43, '作 恵乃智', 10, 0, '類似於梨的豐滿、甜美和華麗的香味。口感堅實，帶有柔滑的甜味和鮮味。', '供應中', 43, 'M0043.png', '2022-01-03 18:12:43', '2022-01-03 18:12:43'),
(44, '鍋島', 10, 0, '以吉川 A 級山田錦打造而成\n新鮮出荷，在日本是極限量的逸品！\n華麗的水梨白花香氣！', '供應中', 44, 'M0044.png', '2022-01-03 18:12:44', '2022-01-03 18:12:44'),
(45, '鳴門鯛 吟釀生原酒', 10, 0, '『鳴門鯛 吟釀鮮釀生原酒』是日本酒中極罕見的鋁罐包裝， \n而且在電影『銀翼殺手Blade Runner 2049』中登場過喔！', '供應中', 45, 'M0045.png', '2022-01-03 18:12:45', '2022-01-03 18:12:45'),
(46, '花邑 美郷錦 生酒', 10, 0, '花村是日本清酒王國秋田的熱門品牌，作為繼承第十四代基因的清酒，已成為全國清酒愛好者的焦點。', '供應中', 46, 'M0046.png', '2022-01-03 18:12:46', '2022-01-03 18:12:46'),
(47, '加茂錦 微濾過吟釀生酒', 10, 0, '此款微濾過吟釀為加茂錦酒造最新作品。透過微濾過技術，口感滑順，香氣濃郁。 \n打破一般生酒既定印象，帶有微微碳酸口感的直率口感，專利技術「珪藻土過濾」造就澄清口感。 \n感受到一絲甘口中後段以辛口收尾，口感澄清喉韻帶著茶葉氣息。', '供應中', 47, 'M0047.png', '2022-01-03 18:12:47', '2022-01-03 18:12:47'),
(48, '満寿泉 生純米吟醸', 10, 0, '最後留著優雅的果香，含在口中時，溫和宜人的香味蔓延開來，膨脹口感的山錦田米，柔和優雅的鮮味，清爽的酸度。餘味均衡。', '供應中', 48, 'M0048.png', '2022-01-03 18:12:48', '2022-01-03 18:12:48'),
(49, '龍神 尾瀨雪融 純米大吟釀 新年御用酒', 10, 0, '為了慶祝新年所釀製的祝賀酒。歡欣的迎接新的一年，對於即將過去的這年表示感謝之意，因此精米至39%，代表了\"Thank You\"的意思。入口後純潔清淨質感、如花蜜般清爽滑順的香甜口感，猶如白色花系的吟釀香氣。', '供應中', 49, 'M0049.png', '2022-01-03 18:12:49', '2022-01-03 18:12:49'),
(50, '大雪溪 阿爾卑斯吟釀 生貯藏酒', 10, 0, '採用長野縣特有阿爾卑斯酵母，奔放的花香系香氣為最大特點之一。口感清爽俐落、層次豐富，是款非常適合搭配海鮮料理的吟釀酒。', '供應中', 50, 'M0050.png', '2022-01-03 18:12:50', '2022-01-03 18:12:50'),
(51, '奧飛驒 吟釀 生囲', 10, 0, '清新爽口，辛甘均衡口感，尾韻切口乾淨短。 \n喝不膩酒款。 \n加冰飲用更感清爽～', '供應中', 51, 'M0051.png', '2022-01-03 18:12:51', '2022-01-03 18:12:51'),
(52, '陸奥八仙 黒ラベル', 10, 0, '鮮味和酸味相得益彰，可以感受到其中的複雜性。它具有柔軟的口感，即使在口中也能散發出香氣。易於搭配較油的菜餚。', '供應中', 52, 'M0052.png', '2022-01-03 18:12:52', '2022-01-03 18:12:52'),
(53, '墨迺江 特別本釀造 本辛', 10, 0, '辛口調性中完美融合米旨醇香及清爽口感， \n雖是一款平易近人的本釀造，卻相當拘泥品質，絕不馬虎。 \n香氣沉穩雅致，收尾乾淨俐落，適飲溫度從冰飲到燗酒皆宜， \n與海鮮料理搭配相得益彰。', '供應中', 53, 'M0053.png', '2022-01-03 18:12:53', '2022-01-03 18:12:53'),
(54, '七賢 甘酸辛苦澀 本釀造', 10, 0, '為一款白州甲斐駒ヶ岳伏流水釀造的一品本釀造，深受山梨當地人長年的喜愛，製酒時特別低溫熟使其味道更有新鮮感，不管是冷飲、常溫或是溫飲搭配任何料理都非常的適合。', '供應中', 54, 'M0054.png', '2022-01-03 18:12:54', '2022-01-03 18:12:54'),
(55, '八海山 特別本釀造', 10, 0, '以高度精白的新潟縣產米作為原料，整個製造工程堅持應用傳統製造吟釀的方式製作。為八海釀造的看板商品之一，含在嘴裡散發出來的香氣不輸給吟釀酒，能充分享受到高雅的口感與淡麗的味道。', '供應中', 55, 'M0055.png', '2022-01-03 18:12:55', '2022-01-03 18:12:55'),
(56, '賀茂鶴 超特撰 特等酒', 10, 0, '榮獲2011年溫酒大賽的「最高位大賞受賞」，酒質圓潤順口，似無角度般的尾韻更是魅力所在。', '供應中', 56, 'M0056.png', '2022-01-03 18:12:56', '2022-01-03 18:12:56'),
(57, '天壽 清澄辛鳥海山 本釀造', 10, 0, '嚴選100%天壽酒米研究會的酒造好適米-「美山錦」，擁有極為細膩、豐潤的口感。溫熱後飄逸脫俗的酒香，在口中能隱隱感受其純淨的喉韻。', '供應中', 57, 'M0057.png', '2022-01-03 18:12:57', '2022-01-03 18:12:57'),
(58, '十四代 本丸 特別本釀造', 10, 0, '秘傳的釀造酒精是使用自家酒粕蒸餾而成，此添加技術造就這款代表作品。\n有如吟釀等級酒款的輕柔果香，含入口中無雜味、高雅的甘甜擴散開來，清爽順口、甘辛口完美平衡為最大特色。', '供應中', 58, 'M0058.png', '2022-01-03 18:12:58', '2022-01-03 18:12:58');

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant`
--

CREATE TABLE `restaurant` (
  `res_id` int(11) NOT NULL,
  `res_type` varchar(20) NOT NULL COMMENT 'Fine Dining / 居酒屋 / Sake Bar',
  `res_area` varchar(2) NOT NULL COMMENT '北部 / 中部 / 南部',
  `res_name` varchar(50) NOT NULL COMMENT '陣列儲存營業時間資料\r\n"[""12:00–15:00 18:00–22:00"", \r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00"",\r\n""12:00–15:00 18:00–22:00""]"',
  `res_intro` varchar(255) NOT NULL,
  `res_address` varchar(255) NOT NULL,
  `res_ser_hours` varchar(255) NOT NULL,
  `res_t_number` varchar(20) NOT NULL,
  `web_link` varchar(255) DEFAULT NULL COMMENT '可為空值',
  `fb_link` varchar(255) DEFAULT NULL COMMENT '可為空值',
  `ig_link` varchar(255) DEFAULT NULL COMMENT '可為空值',
  `booking_link` varchar(255) DEFAULT NULL COMMENT '可為空值',
  `res_create_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生',
  `res_update_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_pictures`
--

CREATE TABLE `restaurant_pictures` (
  `res_pic_id` int(11) NOT NULL,
  `res_pic_name` varchar(50) NOT NULL,
  `res_id` int(11) NOT NULL COMMENT 'FK：restaurant.res_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `shipment_detail`
--

CREATE TABLE `shipment_detail` (
  `shipment_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `tracking_num` int(12) NOT NULL,
  `shipment_method` varchar(20) NOT NULL COMMENT '宅配、自取',
  `store_id` int(11) NOT NULL,
  `shipment_address` varchar(100) NOT NULL COMMENT '門市地址、自填地址',
  `shipment_note` varchar(50) NOT NULL COMMENT '訂單備註'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `special_menu`
--

CREATE TABLE `special_menu` (
  `sp_menu_id` int(11) NOT NULL,
  `sp_menu_pic_name` varchar(50) NOT NULL COMMENT '訂單備註',
  `sp_menu_name` varchar(50) NOT NULL COMMENT '酒的名稱 搭配 一道菜的名稱',
  `res_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `store_address` varchar(50) NOT NULL,
  `store_ser_hours` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `sub_plan`
--

CREATE TABLE `sub_plan` (
  `sub_id` int(5) NOT NULL,
  `sub_plan` varchar(225) NOT NULL COMMENT '精米步合去分',
  `sub_products` varchar(20) NOT NULL COMMENT '直接寫死商品名稱',
  `sub_price` int(5) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生',
  `modified_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `sub_time`
--

CREATE TABLE `sub_time` (
  `subtime_id` int(11) NOT NULL,
  `sub_time` varchar(225) NOT NULL COMMENT '一個月、六個月、一年',
  `sub_discount` float NOT NULL COMMENT '0.95,0.85,0.8',
  `create_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生',
  `modified_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '自然產生',
  `sub_time_month` int(2) NOT NULL COMMENT '1,6,12'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_account` varchar(20) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_time` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 資料表索引 `cart_gift`
--
ALTER TABLE `cart_gift`
  ADD PRIMARY KEY (`cart_gift_id`),
  ADD UNIQUE KEY `cart_gift_id` (`cart_gift_id`),
  ADD KEY `box_color` (`box_color`),
  ADD KEY `gift_id` (`gift_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `cart_gift_d_d`
--
ALTER TABLE `cart_gift_d_d`
  ADD PRIMARY KEY (`cart_g_pro_id`),
  ADD KEY `cart_gift_id` (`cart_gift_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- 資料表索引 `cart_mark`
--
ALTER TABLE `cart_mark`
  ADD PRIMARY KEY (`cart_mark_id`),
  ADD KEY `cart_sake_id` (`cart_sake_id`),
  ADD KEY `mark_id` (`mark_id`);

--
-- 資料表索引 `cart_sake`
--
ALTER TABLE `cart_sake`
  ADD PRIMARY KEY (`cart_sake_id`),
  ADD UNIQUE KEY `cart_sake_id` (`cart_sake_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- 資料表索引 `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_cat_id` (`event_cat_id`);

--
-- 資料表索引 `event_cat`
--
ALTER TABLE `event_cat`
  ADD PRIMARY KEY (`event_cat_id`);

--
-- 資料表索引 `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`fav_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- 資料表索引 `guide_a`
--
ALTER TABLE `guide_a`
  ADD PRIMARY KEY (`a_no`),
  ADD KEY `q_id` (`q_id`);

--
-- 資料表索引 `guide_clia`
--
ALTER TABLE `guide_clia`
  ADD PRIMARY KEY (`cli_id`),
  ADD KEY `a_no` (`a_no`),
  ADD KEY `q_id` (`q_id`);

--
-- 資料表索引 `guide_q`
--
ALTER TABLE `guide_q`
  ADD PRIMARY KEY (`q_id`);

--
-- 資料表索引 `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`mark_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `menu_pictures`
--
ALTER TABLE `menu_pictures`
  ADD PRIMARY KEY (`menu_pic_id`),
  ADD UNIQUE KEY `menu_pic_name` (`menu_pic_name`),
  ADD KEY `res_id` (`res_id`);

--
-- 資料表索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- 資料表索引 `order_event_d`
--
ALTER TABLE `order_event_d`
  ADD PRIMARY KEY (`order_d_id`),
  ADD UNIQUE KEY `order_d_id` (`order_d_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `order_gift_d`
--
ALTER TABLE `order_gift_d`
  ADD PRIMARY KEY (`order_g_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `box_color` (`box_color`),
  ADD KEY `gift_id` (`gift_id`);

--
-- 資料表索引 `order_gift_d_d`
--
ALTER TABLE `order_gift_d_d`
  ADD PRIMARY KEY (`order_g_pro_id`),
  ADD KEY `order_g_id` (`order_g_id`);

--
-- 資料表索引 `order_main`
--
ALTER TABLE `order_main`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `member_id` (`member_id`);

--
-- 資料表索引 `order_mark`
--
ALTER TABLE `order_mark`
  ADD PRIMARY KEY (`order_mark_id`),
  ADD KEY `mark_id` (`mark_id`),
  ADD KEY `order_d_id` (`order_d_id`);

--
-- 資料表索引 `order_sake_d`
--
ALTER TABLE `order_sake_d`
  ADD PRIMARY KEY (`order_d_id`),
  ADD UNIQUE KEY `order_d_id` (`order_d_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `order_sub_d`
--
ALTER TABLE `order_sub_d`
  ADD PRIMARY KEY (`order_d_id`),
  ADD UNIQUE KEY `order_d_id` (`order_d_id`),
  ADD KEY `sub_id` (`sub_id`),
  ADD KEY `subtime_id` (`subtime_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`payment_detail_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `product_container`
--
ALTER TABLE `product_container`
  ADD PRIMARY KEY (`container_id`);

--
-- 資料表索引 `product_format`
--
ALTER TABLE `product_format`
  ADD PRIMARY KEY (`format_id`),
  ADD KEY `pro_gift` (`pro_gift`),
  ADD KEY `container_id` (`container_id`);

--
-- 資料表索引 `product_gift`
--
ALTER TABLE `product_gift`
  ADD PRIMARY KEY (`gift_id`),
  ADD UNIQUE KEY `pro_gift` (`pro_gift`);

--
-- 資料表索引 `product_gift_d`
--
ALTER TABLE `product_gift_d`
  ADD PRIMARY KEY (`gift_d_id`),
  ADD UNIQUE KEY `box_color` (`box_color`),
  ADD KEY `gift_id` (`gift_id`);

--
-- 資料表索引 `product_sake`
--
ALTER TABLE `product_sake`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `format_id` (`format_id`);

--
-- 資料表索引 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`res_id`);

--
-- 資料表索引 `restaurant_pictures`
--
ALTER TABLE `restaurant_pictures`
  ADD PRIMARY KEY (`res_pic_id`),
  ADD UNIQUE KEY `res_pic_name` (`res_pic_name`),
  ADD KEY `res_id` (`res_id`);

--
-- 資料表索引 `shipment_detail`
--
ALTER TABLE `shipment_detail`
  ADD PRIMARY KEY (`shipment_detail_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `special_menu`
--
ALTER TABLE `special_menu`
  ADD PRIMARY KEY (`sp_menu_id`),
  ADD UNIQUE KEY `sp_menu_pic_name` (`sp_menu_pic_name`),
  ADD KEY `res_id` (`res_id`);

--
-- 資料表索引 `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- 資料表索引 `sub_plan`
--
ALTER TABLE `sub_plan`
  ADD PRIMARY KEY (`sub_id`);

--
-- 資料表索引 `sub_time`
--
ALTER TABLE `sub_time`
  ADD PRIMARY KEY (`subtime_id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_account` (`user_account`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_gift_d_d`
--
ALTER TABLE `cart_gift_d_d`
  MODIFY `cart_g_pro_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart_mark`
--
ALTER TABLE `cart_mark`
  MODIFY `cart_mark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `event_cat`
--
ALTER TABLE `event_cat`
  MODIFY `event_cat_id` int(1) NOT NULL AUTO_INCREMENT COMMENT '1、2、3';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `favorite`
--
ALTER TABLE `favorite`
  MODIFY `fav_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `guide_a`
--
ALTER TABLE `guide_a`
  MODIFY `a_no` int(8) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `guide_clia`
--
ALTER TABLE `guide_clia`
  MODIFY `cli_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `guide_q`
--
ALTER TABLE `guide_q`
  MODIFY `q_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `mark`
--
ALTER TABLE `mark`
  MODIFY `mark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menu_pictures`
--
ALTER TABLE `menu_pictures`
  MODIFY `menu_pic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_gift_d`
--
ALTER TABLE `order_gift_d`
  MODIFY `order_g_id` int(14) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_gift_d_d`
--
ALTER TABLE `order_gift_d_d`
  MODIFY `order_g_pro_id` int(14) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_mark`
--
ALTER TABLE `order_mark`
  MODIFY `order_mark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `payment_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_container`
--
ALTER TABLE `product_container`
  MODIFY `container_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_format`
--
ALTER TABLE `product_format`
  MODIFY `format_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ex:1234', AUTO_INCREMENT=59;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_gift`
--
ALTER TABLE `product_gift`
  MODIFY `gift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_gift_d`
--
ALTER TABLE `product_gift_d`
  MODIFY `gift_d_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_sake`
--
ALTER TABLE `product_sake`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `restaurant_pictures`
--
ALTER TABLE `restaurant_pictures`
  MODIFY `res_pic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `shipment_detail`
--
ALTER TABLE `shipment_detail`
  MODIFY `shipment_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `special_menu`
--
ALTER TABLE `special_menu`
  MODIFY `sp_menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `sub_plan`
--
ALTER TABLE `sub_plan`
  MODIFY `sub_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `sub_time`
--
ALTER TABLE `sub_time`
  MODIFY `subtime_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `cart_gift`
--
ALTER TABLE `cart_gift`
  ADD CONSTRAINT `cart_gift_ibfk_1` FOREIGN KEY (`box_color`) REFERENCES `product_gift_d` (`box_color`),
  ADD CONSTRAINT `cart_gift_ibfk_2` FOREIGN KEY (`gift_id`) REFERENCES `product_gift` (`gift_id`),
  ADD CONSTRAINT `cart_gift_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `cart_gift_d_d`
--
ALTER TABLE `cart_gift_d_d`
  ADD CONSTRAINT `cart_gift_d_d_ibfk_1` FOREIGN KEY (`cart_gift_id`) REFERENCES `cart_gift` (`cart_gift_id`),
  ADD CONSTRAINT `cart_gift_d_d_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`);

--
-- 資料表的限制式 `cart_mark`
--
ALTER TABLE `cart_mark`
  ADD CONSTRAINT `cart_mark_ibfk_1` FOREIGN KEY (`cart_sake_id`) REFERENCES `cart_sake` (`cart_sake_id`),
  ADD CONSTRAINT `cart_mark_ibfk_2` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`mark_id`);

--
-- 資料表的限制式 `cart_sake`
--
ALTER TABLE `cart_sake`
  ADD CONSTRAINT `cart_sake_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`),
  ADD CONSTRAINT `cart_sake_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_cat_id`) REFERENCES `event_cat` (`event_cat_id`);

--
-- 資料表的限制式 `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`);

--
-- 資料表的限制式 `guide_a`
--
ALTER TABLE `guide_a`
  ADD CONSTRAINT `guide_a_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `guide_q` (`q_id`);

--
-- 資料表的限制式 `guide_clia`
--
ALTER TABLE `guide_clia`
  ADD CONSTRAINT `guide_clia_ibfk_1` FOREIGN KEY (`a_no`) REFERENCES `guide_a` (`a_no`),
  ADD CONSTRAINT `guide_clia_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `guide_q` (`q_id`);

--
-- 資料表的限制式 `mark`
--
ALTER TABLE `mark`
  ADD CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- 資料表的限制式 `menu_pictures`
--
ALTER TABLE `menu_pictures`
  ADD CONSTRAINT `menu_pictures_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`);

--
-- 資料表的限制式 `order_event_d`
--
ALTER TABLE `order_event_d`
  ADD CONSTRAINT `order_event_d_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  ADD CONSTRAINT `order_event_d_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `order_gift_d`
--
ALTER TABLE `order_gift_d`
  ADD CONSTRAINT `order_gift_d_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`),
  ADD CONSTRAINT `order_gift_d_ibfk_2` FOREIGN KEY (`box_color`) REFERENCES `product_gift_d` (`box_color`),
  ADD CONSTRAINT `order_gift_d_ibfk_3` FOREIGN KEY (`gift_id`) REFERENCES `product_gift` (`gift_id`);

--
-- 資料表的限制式 `order_gift_d_d`
--
ALTER TABLE `order_gift_d_d`
  ADD CONSTRAINT `order_gift_d_d_ibfk_1` FOREIGN KEY (`order_g_id`) REFERENCES `order_gift_d` (`order_g_id`);

--
-- 資料表的限制式 `order_main`
--
ALTER TABLE `order_main`
  ADD CONSTRAINT `order_main_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 資料表的限制式 `order_mark`
--
ALTER TABLE `order_mark`
  ADD CONSTRAINT `order_mark_ibfk_1` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`mark_id`),
  ADD CONSTRAINT `order_mark_ibfk_2` FOREIGN KEY (`order_d_id`) REFERENCES `order_sake_d` (`order_d_id`);

--
-- 資料表的限制式 `order_sake_d`
--
ALTER TABLE `order_sake_d`
  ADD CONSTRAINT `order_sake_d_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product_sake` (`pro_id`),
  ADD CONSTRAINT `order_sake_d_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `order_sub_d`
--
ALTER TABLE `order_sub_d`
  ADD CONSTRAINT `order_sub_d_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `sub_plan` (`sub_id`),
  ADD CONSTRAINT `order_sub_d_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`),
  ADD CONSTRAINT `order_sub_d_ibfk_4` FOREIGN KEY (`subtime_id`) REFERENCES `sub_time` (`subtime_id`);

--
-- 資料表的限制式 `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD CONSTRAINT `payment_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `product_format`
--
ALTER TABLE `product_format`
  ADD CONSTRAINT `product_format_ibfk_1` FOREIGN KEY (`pro_gift`) REFERENCES `product_gift` (`pro_gift`),
  ADD CONSTRAINT `product_format_ibfk_2` FOREIGN KEY (`container_id`) REFERENCES `product_container` (`container_id`);

--
-- 資料表的限制式 `product_gift_d`
--
ALTER TABLE `product_gift_d`
  ADD CONSTRAINT `product_gift_d_ibfk_1` FOREIGN KEY (`gift_id`) REFERENCES `product_gift` (`gift_id`);

--
-- 資料表的限制式 `product_sake`
--
ALTER TABLE `product_sake`
  ADD CONSTRAINT `product_sake_ibfk_1` FOREIGN KEY (`format_id`) REFERENCES `product_format` (`format_id`);

--
-- 資料表的限制式 `restaurant_pictures`
--
ALTER TABLE `restaurant_pictures`
  ADD CONSTRAINT `restaurant_pictures_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`);

--
-- 資料表的限制式 `shipment_detail`
--
ALTER TABLE `shipment_detail`
  ADD CONSTRAINT `shipment_detail_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  ADD CONSTRAINT `shipment_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`);

--
-- 資料表的限制式 `special_menu`
--
ALTER TABLE `special_menu`
  ADD CONSTRAINT `special_menu_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
