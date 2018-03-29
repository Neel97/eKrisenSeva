-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2018 at 07:13 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ekrisenseva`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_details`
--

CREATE TABLE IF NOT EXISTS `address_details` (
  `address_id` int(11) NOT NULL,
  `house_name` varchar(45) DEFAULT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `landmark` varchar(70) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` int(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calamity`
--

CREATE TABLE IF NOT EXISTS `calamity` (
`calamity_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `region` varchar(70) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `temp_resource_provider_temp_resource_provider_id` int(11) NOT NULL,
  `temp_shelter_temp_shelter_id` int(11) NOT NULL,
  `calamity_shelter_calamity_shelter_id` int(11) NOT NULL,
  `calamity_shelter_to_resource_calamity_shelter_to_resource_id` int(11) NOT NULL,
  `calamity_resource_provider_calamity_resource_provider_id` int(11) NOT NULL,
  `calamity_safe_victim_calamity_safe_victim_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calamity_resource_provider`
--

CREATE TABLE IF NOT EXISTS `calamity_resource_provider` (
  `calamity_resource_provider_id` int(11) NOT NULL,
  `calamity_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_stock` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `calamity_shelter_to_resource_calamity_shelter_to_resource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calamity_safe_victim`
--

CREATE TABLE IF NOT EXISTS `calamity_safe_victim` (
  `calamity_safe_victim_id` int(11) NOT NULL,
  `calamity_id` int(11) DEFAULT NULL,
  `victim_id` int(11) DEFAULT NULL,
  `calamity_shelter_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calamity_shelter`
--

CREATE TABLE IF NOT EXISTS `calamity_shelter` (
  `calamity_shelter_id` int(11) NOT NULL,
  `shelter_id` int(11) DEFAULT NULL,
  `shelter_occupancy` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `calamity_shelter_to_resource_calamity_shelter_to_resource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calamity_shelter_to_resource`
--

CREATE TABLE IF NOT EXISTS `calamity_shelter_to_resource` (
  `calamity_shelter_to_resource_id` int(11) NOT NULL,
  `calamity_id` int(11) DEFAULT NULL,
  `calamity_shelter_id` int(11) DEFAULT NULL,
  `calamity_resource_provider_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE IF NOT EXISTS `contact_details` (
`contact_id` int(11) NOT NULL,
  `fname` tinytext,
  `mname` tinytext,
  `lname` tinytext,
  `dob` text,
  `address` text,
  `status` tinyint(4) DEFAULT '1',
  `timestamp` varchar(45) DEFAULT NULL,
  `contact_no` text,
  `alternate_contact_no` text,
  `email_id` tinytext,
  `aadhar_no` text,
  `gender` tinytext,
  `profile_photo` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`contact_id`, `fname`, `mname`, `lname`, `dob`, `address`, `status`, `timestamp`, `contact_no`, `alternate_contact_no`, `email_id`, `aadhar_no`, `gender`, `profile_photo`) VALUES
(1, 'John', 'Maganlal', 'Doe', '2018-03-01', NULL, 1, '1521798571', '7894561230', '2135468790', 'asd@asd.com', '854796321452', 'female', ''),
(2, 'bhavika', 'viral', 'parmar', '1997-12-01', NULL, 1, '1521800704', '123456789', '7894561320', 'bhavika.tanna@sakec.ac.in', '123456586785', 'female', ''),
(3, 'qwerty', 'pouyy', 'lkiolp', '2018-03-15', NULL, 1, '1521799254', '123456789', '7894561320', 'asd@asd.com', '123456586785', 'female', ''),
(4, 'Bhagyashri', 'Pradeep', 'Chavan', '1997-11-05', NULL, 1, '1521920622', '74125896304', '9876543210', 'bhagu@eKrisenSeva.com', '789456321023', 'female', 'regional_admin/uploads/Bhagyashri_Chavan_3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE IF NOT EXISTS `employee_details` (
`employee_details_id` int(11) NOT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `date-of_joining` date DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logged_users`
--

CREATE TABLE IF NOT EXISTS `logged_users` (
`logged_users_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_time` varchar(45) NOT NULL,
  `ip_addr` varchar(18) NOT NULL,
  `login_flag` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logged_users`
--

INSERT INTO `logged_users` (`logged_users_id`, `user_id`, `login_time`, `ip_addr`, `login_flag`, `status`, `timestamp`) VALUES
(1, 1, '1521535760', '::1', 0, 1, '1521535760'),
(5, 2, '1521538694', '::1', 0, 1, '1521538694'),
(6, 2, '1521539467', '::1', 0, 1, '1521539467'),
(7, 1, '1521539586', '::1', 0, 1, '1521539586'),
(8, 2, '1521539654', '::1', 0, 1, '1521539654'),
(9, 2, '1521540300', '::1', 0, 1, '1521540300'),
(10, 2, '1521540541', '::1', 0, 1, '1521540541'),
(11, 2, '1521540872', '::1', 0, 1, '1521540872'),
(12, 2, '1521543833', '::1', 0, 1, '1521543833'),
(13, 2, '1521711654', '::1', 0, 1, '1521711654'),
(14, 2, '1521712632', '::1', 0, 0, '1521712632'),
(15, 1, '1521793945', '::1', 0, 1, '1521793945'),
(16, 1, '1521793985', '::1', 0, 1, '1521793985'),
(17, 1, '1521794258', '::1', 0, 0, '1521794258'),
(19, 1, '1521794296', '::1', 0, 1, '1521794296'),
(20, 1, '1521794731', '::1', 0, 1, '1521794731'),
(21, 2, '1521798972', '::1', 0, 1, '1521798972'),
(22, 2, '1521799221', '::1', 0, 1, '1521799221'),
(23, 3, '1521801286', '::1', 0, 1, '1521801286'),
(24, 3, '1521802146', '::1', 0, 1, '1521802146'),
(25, 1, '1521821496', '::1', 0, 1, '1521821496'),
(26, 1, '1521824488', '::1', 0, 1, '1521824488'),
(27, 1, '1521824589', '::1', 0, 1, '1521824589'),
(28, 1, '1521824737', '::1', 0, 1, '1521824737'),
(29, 3, '1521825051', '::1', 0, 1, '1521825051'),
(30, 2, '1521896776', '::1', 0, 1, '1521896776'),
(31, 2, '1521898905', '::1', 0, 1, '1521898905'),
(32, 3, '1521915118', '::1', 0, 1, '1521915118'),
(33, 1, '1521920956', '::1', 0, 1, '1521920956'),
(34, 1, '1521988480', '::1', 0, 1, '1521988480'),
(35, 1, '1521997126', '::1', 1, 1, '1521997126');

-- --------------------------------------------------------

--
-- Table structure for table `map_details`
--

CREATE TABLE IF NOT EXISTS `map_details` (
  `map_details_id` int(11) NOT NULL,
  `logitude` tinytext,
  `latitude` tinytext,
  `status` tinyint(4) DEFAULT '1',
  `timestamp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `regional_admin`
--

CREATE TABLE IF NOT EXISTS `regional_admin` (
`regional_admin_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regional_admin`
--

INSERT INTO `regional_admin` (`regional_admin_id`, `contact_id`, `emp_id`, `status`, `timestamp`, `region`) VALUES
(1, 1, NULL, 1, '1521711654', 'Mumbai'),
(2, 2, NULL, 1, '1521711654', 'Pune'),
(3, 4, NULL, 1, '1521711654', 'Kalyan');

-- --------------------------------------------------------

--
-- Table structure for table `resource_provider`
--

CREATE TABLE IF NOT EXISTS `resource_provider` (
`resource_provider_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `resource_address_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `resource_map_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `timestamp` varchar(45) NOT NULL,
  `map_details_map_details_id` int(11) NOT NULL,
  `address_details_address_id` int(11) NOT NULL,
  `shelter_to_resource_shelter_to_resource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelter_details`
--

CREATE TABLE IF NOT EXISTS `shelter_details` (
`shelter_details_id` int(11) NOT NULL,
  `map_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `accomodation_capacity` int(11) DEFAULT NULL,
  `isalive` tinyint(4) DEFAULT '1',
  `primary_resource_provider` int(11) DEFAULT NULL,
  `medication_facility` tinyint(4) DEFAULT '1',
  `status` tinyint(4) DEFAULT '1',
  `timestamp` varchar(45) DEFAULT NULL,
  `address_details_address_id` int(11) NOT NULL,
  `map_details_map_details_id` int(11) NOT NULL,
  `calamity_shelter_calamity_shelter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelter_official`
--

CREATE TABLE IF NOT EXISTS `shelter_official` (
`shelter_official_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `shelter_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `timestamp` varchar(45) DEFAULT NULL,
  `shelter_details_shelter_details_id` int(11) NOT NULL,
  `employee_details_employee_details_id` int(11) NOT NULL,
  `contact_details_contact_id` int(11) NOT NULL,
  `contact_details_address_details_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelter_to_resource`
--

CREATE TABLE IF NOT EXISTS `shelter_to_resource` (
  `shelter_to_resource_id` int(11) NOT NULL,
  `shelter_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_resource_provider`
--

CREATE TABLE IF NOT EXISTS `temp_resource_provider` (
  `temp_resource_provider_id` int(11) NOT NULL,
  `calamity_id` int(11) DEFAULT NULL,
  `resource_type` varchar(45) DEFAULT NULL,
  `store_address_id` int(11) DEFAULT NULL,
  `map_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `stock` varchar(45) DEFAULT NULL,
  `address_details_address_id` int(11) NOT NULL,
  `map_details_map_details_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_shelter`
--

CREATE TABLE IF NOT EXISTS `temp_shelter` (
  `temp_shelter_id` int(11) NOT NULL,
  `map_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `accomodation_capacity` int(11) DEFAULT NULL,
  `isalive` int(11) DEFAULT NULL,
  `suitable_gender` tinytext,
  `suitable_age_group` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `calamity_id` int(11) DEFAULT NULL,
  `map_details_map_details_id` int(11) NOT NULL,
  `address_details_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`users_id` int(11) NOT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `type` text,
  `uid` int(11) DEFAULT NULL,
  `last_login` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `timestamp` varchar(45) DEFAULT NULL,
  `sec_ques` text NOT NULL,
  `sec_ans` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `uname`, `pass`, `type`, `uid`, `last_login`, `status`, `timestamp`, `sec_ques`, `sec_ans`) VALUES
(1, 'asd@asd.com', 'zxcv', 'regional_admin', 1, '1521821496', 1, NULL, '', ''),
(2, 'reg_admin@eKrisenSeva.com', '123456', 'regional_admin\r\n', 2, '1521898905', 1, NULL, '', ''),
(3, 'bhagu@eKrisenSeva.com', 'abc123', 'regional_admin', 3, '1521915118', 1, '1521711654', 'abc123 hai kya?', 'haa');

-- --------------------------------------------------------

--
-- Table structure for table `users_type`
--

CREATE TABLE IF NOT EXISTS `users_type` (
`user_type_id` int(11) NOT NULL,
  `type` text NOT NULL,
  `status` binary(1) NOT NULL DEFAULT '',
  `timestamp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_login_logs`
--

CREATE TABLE IF NOT EXISTS `user_login_logs` (
`user_login_logs_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `login_time` varchar(45) NOT NULL,
  `logout_time` varchar(45) NOT NULL,
  `ip_addr` varchar(45) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `timestamp` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login_logs`
--

INSERT INTO `user_login_logs` (`user_login_logs_id`, `uid`, `login_time`, `logout_time`, `ip_addr`, `status`, `timestamp`) VALUES
(1, 2, '1521538694', '1521539310', '::1', 1, '1521539310'),
(2, 2, '1521539467', '1521539481', '::1', 1, '1521539481'),
(3, 1, '1521535760', '1521539588', '::1', 1, '1521539588'),
(4, 2, '1521539654', '1521539657', '::1', 1, '1521539657'),
(5, 2, '1521540300', '1521540520', '::1', 1, '1521540520'),
(6, 2, '1521540541', '1521540547', '::1', 1, '1521540547'),
(7, 2, '1521540872', '1521540884', '::1', 1, '1521540884'),
(8, 2, '1521543833', '1521543849', '::1', 1, '1521543849'),
(9, 2, '1521711654', '1521711979', '::1', 1, '1521711979'),
(10, 1, '1521793945', '1521794003', '::1', 1, '1521794003'),
(11, 1, '1521794296', '1521794703', '::1', 1, '1521794703'),
(12, 1, '1521794731', '1521798962', '::1', 1, '1521798962'),
(13, 2, '1521798972', '1521799138', '::1', 1, '1521799138'),
(14, 2, '1521799221', '1521800787', '::1', 1, '1521800787'),
(15, 3, '1521801286', '1521802140', '::1', 1, '1521802140'),
(16, 1, '1521821496', '1521824902', '::1', 1, '1521824902'),
(17, 3, '1521802146', '1521825080', '::1', 1, '1521825080'),
(18, 2, '1521896776', '1521898644', '::1', 1, '1521898644'),
(19, 2, '1521898905', '1521898921', '::1', 1, '1521898921'),
(20, 3, '1521915118', '1521920692', '::1', 1, '1521920692');

-- --------------------------------------------------------

--
-- Table structure for table `victim`
--

CREATE TABLE IF NOT EXISTS `victim` (
  `victim_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `map_id` int(11) DEFAULT NULL,
  `calamity_safe_victim_calamity_safe_victim_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_details`
--
ALTER TABLE `address_details`
 ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `calamity`
--
ALTER TABLE `calamity`
 ADD PRIMARY KEY (`calamity_id`,`temp_resource_provider_temp_resource_provider_id`,`temp_shelter_temp_shelter_id`,`calamity_shelter_calamity_shelter_id`,`calamity_shelter_to_resource_calamity_shelter_to_resource_id`,`calamity_resource_provider_calamity_resource_provider_id`,`calamity_safe_victim_calamity_safe_victim_id`);

--
-- Indexes for table `calamity_resource_provider`
--
ALTER TABLE `calamity_resource_provider`
 ADD PRIMARY KEY (`calamity_resource_provider_id`,`calamity_shelter_to_resource_calamity_shelter_to_resource_id`);

--
-- Indexes for table `calamity_safe_victim`
--
ALTER TABLE `calamity_safe_victim`
 ADD PRIMARY KEY (`calamity_safe_victim_id`);

--
-- Indexes for table `calamity_shelter`
--
ALTER TABLE `calamity_shelter`
 ADD PRIMARY KEY (`calamity_shelter_id`,`calamity_shelter_to_resource_calamity_shelter_to_resource_id`);

--
-- Indexes for table `calamity_shelter_to_resource`
--
ALTER TABLE `calamity_shelter_to_resource`
 ADD PRIMARY KEY (`calamity_shelter_to_resource_id`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
 ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
 ADD PRIMARY KEY (`employee_details_id`);

--
-- Indexes for table `logged_users`
--
ALTER TABLE `logged_users`
 ADD PRIMARY KEY (`logged_users_id`,`timestamp`);

--
-- Indexes for table `map_details`
--
ALTER TABLE `map_details`
 ADD PRIMARY KEY (`map_details_id`);

--
-- Indexes for table `regional_admin`
--
ALTER TABLE `regional_admin`
 ADD PRIMARY KEY (`regional_admin_id`);

--
-- Indexes for table `resource_provider`
--
ALTER TABLE `resource_provider`
 ADD PRIMARY KEY (`resource_provider_id`,`map_details_map_details_id`,`address_details_address_id`,`shelter_to_resource_shelter_to_resource_id`);

--
-- Indexes for table `shelter_details`
--
ALTER TABLE `shelter_details`
 ADD PRIMARY KEY (`shelter_details_id`,`address_details_address_id`,`map_details_map_details_id`,`calamity_shelter_calamity_shelter_id`);

--
-- Indexes for table `shelter_official`
--
ALTER TABLE `shelter_official`
 ADD PRIMARY KEY (`shelter_official_id`,`shelter_details_shelter_details_id`,`employee_details_employee_details_id`,`contact_details_contact_id`,`contact_details_address_details_address_id`);

--
-- Indexes for table `shelter_to_resource`
--
ALTER TABLE `shelter_to_resource`
 ADD PRIMARY KEY (`shelter_to_resource_id`);

--
-- Indexes for table `temp_resource_provider`
--
ALTER TABLE `temp_resource_provider`
 ADD PRIMARY KEY (`temp_resource_provider_id`,`address_details_address_id`,`map_details_map_details_id`);

--
-- Indexes for table `temp_shelter`
--
ALTER TABLE `temp_shelter`
 ADD PRIMARY KEY (`temp_shelter_id`,`map_details_map_details_id`,`address_details_address_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`users_id`);

--
-- Indexes for table `users_type`
--
ALTER TABLE `users_type`
 ADD PRIMARY KEY (`user_type_id`);

--
-- Indexes for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
 ADD PRIMARY KEY (`user_login_logs_id`);

--
-- Indexes for table `victim`
--
ALTER TABLE `victim`
 ADD PRIMARY KEY (`victim_id`,`calamity_safe_victim_calamity_safe_victim_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calamity`
--
ALTER TABLE `calamity`
MODIFY `calamity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
MODIFY `employee_details_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logged_users`
--
ALTER TABLE `logged_users`
MODIFY `logged_users_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `regional_admin`
--
ALTER TABLE `regional_admin`
MODIFY `regional_admin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `resource_provider`
--
ALTER TABLE `resource_provider`
MODIFY `resource_provider_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shelter_details`
--
ALTER TABLE `shelter_details`
MODIFY `shelter_details_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shelter_official`
--
ALTER TABLE `shelter_official`
MODIFY `shelter_official_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users_type`
--
ALTER TABLE `users_type`
MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
MODIFY `user_login_logs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
