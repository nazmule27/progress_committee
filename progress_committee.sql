-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2016 at 07:06 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `progress_committee`
--


-- --------------------------------------------------------

--
-- Table structure for table `committee`
--

CREATE TABLE IF NOT EXISTS `committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `for_student` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supervisor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_supervisor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ex_officio` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `members` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `committee`
--

INSERT INTO `committee` (`id`, `for_student`, `supervisor`, `co_supervisor`, `ex_officio`, `members`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '0411054002', 'ashikurrahman', 'atif', 'headcse', NULL, 'admin', '2016-07-26 07:32:37', NULL),
(2, '0412052109', 'kaykobad', 'mostofa', 'headcse', NULL, 'admin', '2016-07-26 07:36:22', NULL),
(3, '0411052034', 'kashem', 'anindyaiqbal', 'headcse', NULL, 'admin', '2016-07-27 04:31:12', NULL),
(4, '040805039', 'ashikurrahman', 'asmlatifulhoque', 'headcse', NULL, 'admin', '2016-08-01 08:57:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `committee_member`
--

CREATE TABLE IF NOT EXISTS `committee_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `member` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `committee_member`
--

INSERT INTO `committee_member` (`id`, `cid`, `member`) VALUES
(1, 1, 'atif'),
(2, 1, 'kaykobad'),
(3, 2, 'asmlatifulhoque'),
(4, 2, 'anindyaiqbal'),
(5, 2, 'kashem'),
(6, 2, 'saidurrahman'),
(7, 3, 'ashikurrahman'),
(8, 3, 'atif'),
(9, 3, 'mahmudanaznin'),
(10, 4, 'mmislam');

-- --------------------------------------------------------

--
-- Table structure for table `external`
--

CREATE TABLE IF NOT EXISTS `external` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('Local','Foreign') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `external`
--

INSERT INTO `external` (`id`, `username`, `full_name`, `designation`, `email`, `phone`, `type`) VALUES
(1, 'sriram', 'Sriram Chellappan', 'Professor', NULL, NULL, 'Foreign');

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE IF NOT EXISTS `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meeting_date_time` timestamp NULL DEFAULT NULL,
  `called_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`id`, `cid`, `title`, `type`, `external`, `meeting_date_time`, `called_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test Title', 'progress', NULL, '2016-07-27 21:30:00', 'ashikurrahman', '2016-07-27 10:54:49', NULL),
(2, 1, 'dummy test', 'comprehensive', NULL, '2016-07-28 21:45:00', 'ashikurrahman', '2016-07-27 10:55:15', NULL),
(3, 1, 'Test Title', 'defense', NULL, '2016-08-01 10:30:00', 'ashikurrahman', '2016-07-30 09:52:41', NULL),
(4, 1, 'dummy test', 'comprehensive', NULL, '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 10:01:20', NULL),
(5, 3, 'Test Title', 'progress', NULL, '2016-08-04 21:15:00', 'kashem', '2016-07-30 10:09:10', NULL),
(6, 1, 'Test Title', 'comprehensive', NULL, '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 11:27:37', NULL),
(7, 1, 'Test nazmul', 'defense', 'sriram', '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 11:32:47', NULL),
(8, 1, 'Test nazmul2', 'progress', '', '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 11:33:53', NULL),
(9, 1, 'Test nazmul2', 'comprehensive', '', '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 11:35:54', NULL),
(10, 1, 'Test Title', 'comprehensive', '', '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 11:36:22', NULL),
(11, 1, 'Test bu Nazmul', 'comprehensive', '', '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 11:38:35', NULL),
(12, 1, 'Test nazmul2', 'comprehensive', '', '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 11:39:07', NULL),
(13, 1, 'Test nazmul3', 'defense', 'sriram', '2016-07-29 20:30:00', 'ashikurrahman', '2016-07-30 11:39:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_document`
--

CREATE TABLE IF NOT EXISTS `meeting_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meeting_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_can_see` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uploaded_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `meeting_document`
--

INSERT INTO `meeting_document` (`id`, `mid`, `comment`, `file_name`, `document_type`, `meeting_type`, `student_can_see`, `created_at`, `uploaded_by`) VALUES
(1, 2, NULL, '12ashikurrahman.jpg', 'pre_meeting_document', 'comprehensive', 0, '2016-07-27 10:55:15', NULL),
(2, 2, NULL, '12ashikurrahman1.jpg', 'pre_meeting_document', 'comprehensive', 0, '2016-07-30 09:24:56', 'ashikurrahman'),
(3, 2, NULL, '12ashikurrahman2.jpg', 'pre_meeting_document', 'comprehensive', 0, '2016-07-30 09:26:11', 'ashikurrahman'),
(4, 1, NULL, '11ashikurrahman3.jpg', 'pre_meeting_document', 'progress', 0, '2016-07-30 09:26:59', 'ashikurrahman'),
(5, 2, NULL, '12ashikurrahman.jpg', 'pre_meeting_document', 'comprehensive', 0, '2016-07-30 09:51:21', 'ashikurrahman'),
(6, 3, NULL, '13ashikurrahman1.jpg', 'pre_meeting_document', 'defense', 0, '2016-07-30 09:52:41', 'ashikurrahman'),
(7, 4, NULL, '1ashikurrahman.jpg', 'pre_meeting_document', 'comprehensive', 0, '2016-07-30 10:01:20', 'ashikurrahman'),
(8, 4, NULL, '1ashikurrahman.docx', 'pre_meeting_document', 'comprehensive', 0, '2016-07-30 10:02:35', 'ashikurrahman'),
(9, 5, NULL, '3kashem.jpg', 'pre_meeting_document', 'progress', 0, '2016-07-30 10:09:10', 'kashem'),
(10, 5, NULL, '3ashikurrahman.jpg', 'post_meeting_document', 'progress', 0, '2016-07-30 10:10:06', 'ashikurrahman'),
(11, 5, NULL, '3ashikurrahman.docx', 'pre_meeting_document', 'progress', 0, '2016-07-30 10:10:14', 'ashikurrahman'),
(12, 7, NULL, '1ashikurrahman1.jpg', 'pre_meeting_document', 'defense', 0, '2016-07-30 11:32:47', 'ashikurrahman'),
(13, 13, NULL, '1ashikurrahman2.jpg', 'pre_meeting_document', 'defense', 0, '2016-07-30 11:39:25', 'ashikurrahman'),
(14, 4, 'Test comment', '1ashikurrahman3.jpg', 'pre_meeting_document', 'comprehensive', 0, '2016-07-31 08:53:51', 'ashikurrahman'),
(15, 4, 'Test2', '1ashikurrahman4.jpg', 'pre_meeting_document', 'comprehensive', NULL, '2016-07-31 08:56:49', 'ashikurrahman'),
(16, 4, 'student can see', '1ashikurrahman5.jpg', 'pre_meeting_document', 'comprehensive', 1, '2016-07-31 08:57:25', 'ashikurrahman'),
(18, 4, 'Test without documents', NULL, 'pre_meeting_document', 'comprehensive', NULL, '2016-07-31 09:42:32', 'ashikurrahman'),
(19, 4, 'Saved with file', '1ashikurrahman6.jpg', 'pre_meeting_document', 'comprehensive', NULL, '2016-07-31 09:43:19', 'ashikurrahman'),
(20, 4, '', '1ashikurrahman7.jpg', 'pre_meeting_document', 'comprehensive', NULL, '2016-07-31 09:43:39', 'ashikurrahman'),
(21, 4, '', '1ashikurrahman8.jpg', 'pre_meeting_document', 'comprehensive', NULL, '2016-07-31 09:45:36', 'ashikurrahman');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_type`
--

CREATE TABLE IF NOT EXISTS `meeting_type` (
  `id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `meeting_type`
--

INSERT INTO `meeting_type` (`id`, `title`) VALUES
('progress', 'Progress Meeting'),
('comprehensive', 'Comprehensive Exam'),
('defense', 'Defense');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `full_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` enum('Admin','Supervisor','Member','External','Student') CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `full_name`, `designation`, `role`, `email`, `status`) VALUES
('aashik', '21c4bc6806f1ae740f4b994bc08fb6e0', 'Md. Aashikur Rahman Azim', 'Lecturer', 'Supervisor', 'aashikazim@gmail.com', 1),
('adnan', 'd1a0a9e9391af09e978c4c3d11711e75', 'Dr. Muhammad Abdullah Adnan', 'Assistant Professor', 'Supervisor', 'abdullah.adnan@gmail.com', 1),
('ahmedkhurshid', '1894fca52996f089bc916c4813d26362', 'Ahmed Khurshid', 'Assistant Professor', 'Supervisor', 'ahmedkhurshid80@yahoo.com', 1),
('ali_nayeem', '50d7bb1e119052bdfd0a7ae2e78eba1e', 'Muhammad Ali Nayeem', 'Lecturer', 'Supervisor', 'ali_nayeem@cse.buet.ac.bd', 1),
('anindyaiqbal', '245456820536e2d1568a607f862d6300', 'Dr. Anindya Iqbal', 'Assistant Professor', 'Supervisor', 'anindya_iqbal@yahoo.com', 1),
('anupam', 'd19c70167e04aedfcd9b4ec440489ba6', 'Anupam Das', 'Assistant Professor', 'Supervisor', 'anupamdas@cse.buet.ac.bd', 1),
('arup', '65f84c80177190a32f4c13b38931aed6', 'Arup Raton Roy', 'Lecturer', 'Supervisor', 'roy.arup@gmail.com', 1),
('ashikurrahman', 'aa9f54e6edd3236d37d3f3ac3348fc1f', 'Dr. A.K.M. Ashikur Rahman', 'Professor', 'Supervisor', 'ashikur@cse.buet.ac.bd', 1),
('ashraful', '7d04559ddb86598ab0e369f4a5e82eab', 'Md. Ashraful Alam', 'Assistant Professor', 'Supervisor', 'shovon21@yahoo.com', 1),
('asmlatifulhoque', '6589b0c057fe2def4822562ec28c7547', 'Dr. Abu Sayed Md. Latiful Hoque', 'Professor', 'Supervisor', 'asmlatifulhoque@cse.buet.ac.bd', 1),
('atif', '182b68b5c4ddcdd81b3d54335c82027a', 'Dr. Atif Hasan Rahman', 'Assistant Professor', 'Supervisor', 'atif.bd@gmail.com', 1),
('ayonsn', 'af774a48162b38ff1a20bd947b3abc37', 'Ayon Sen', 'Lecturer', 'Supervisor', 'ayonsn@gmail.com', 1),
('azadsalam', '2832315844309cb7c5fdabb0b974e767', 'Abdus Salam Azad', 'Lecturer', 'Supervisor', 'azadsalam@cse.buet.ac.bd', 1),
('bayzid', 'ff975eb19c7bfff6e749a798a58f2959', 'Md. Shamsuzzoha Bayzid', 'Assistant Professor', 'Supervisor', 'shams.bayzid@gmail.com', 1),
('ehtesam', 'a079cf25a97ac0300ac83b90aedabb9a', 'Md. Ehtesamul Haque', 'Lecturer', 'Supervisor', 'ehtesam@cse.buet.ac.bd', 1),
('eunus', '96986317f6d07850f55916121e2b5997', 'Dr. Mohammed Eunus Ali', 'Professor', 'Supervisor', 'eunus@cse.buet.ac.bd', 1),
('faiz', '9d4d4ab0dfdb72a54b895d78b90b09c7', 'Md. Faizul Bari', 'Assistant Professor', 'Supervisor', 'faizulbari@cse.buet.ac.bd', 1),
('fatema', 'e98222275fed1ee02bf908216586c63d', 'Fatema Tuz Zohora', 'Assistant Professor', 'Supervisor', 'anne.06.cse@gmail.com', 1),
('hasanmm', 'fd1eaf0ead824f6dfd7c354cedcac57f', 'Mohammad Masud Hasan', 'Assistant Professor', 'Supervisor', 'masud209@yahoo.com', 1),
('headcse', 'headcse', 'Head of the CSE DEPT', 'professor', 'Admin', 'head@cse.buet.ac.bd', 1),
('hemayet', '9c46a59867acd3c8503d8b1076426ced', 'Hemayet Hossain', 'Lecturer', 'Supervisor', 'hossain@cs.rochester.edu', 1),
('himeldev', '957a3af5c805c23ef05a8d3b19b6b85f', 'Himel Dev', 'Lecturer', 'Supervisor', 'himeldev@gmail.com', 1),
('ierabban', 'd349dab7444fa23d94ab0a53576dd442', 'Md. Ishat - E - Rabban', 'Lecturer', 'Supervisor', 'ieranikg@gmail.com', 1),
('ishtiyaque', '33ebc2d041164f333159097327f4ada9', 'Ishtiyaque Ahmad', 'Lecturer', 'Supervisor', 'ishtiyaque.2197@yahoo.com', 1),
('johramoosa', '560aacd128d7f411204ef6ac5498aa66', 'Johra Muhammad Moosa', 'Assistant Professor', 'Supervisor', 'johra.moosa@gmail.com', 1),
('kantishubhra', '683951725c47cc00df8c9ba9c2d4dd93', 'Shubhra Kanti Karmaker Santu', 'Lecturer', 'Supervisor', 'kantishubhra@cse.buet.ac.bd', 1),
('kashem', '617eb9cdc5dee39804ff0b7ea0047a4a', 'Dr. Md. Abul Kashem Mia', 'Professor', 'Supervisor', 'kashem@cse.buet.ac.bd', 1),
('kaykobad', '85763a959d076b164341184b6a5678c3', 'Dr. M. Kaykobad', 'Professor', 'Supervisor', 'kaykobad@cse.buet.ac.bd', 1),
('kaysar', '8ed56e3f78275e9450a0bb9c7df0205b', 'Mohammed Kaysar Abdullah', 'Lecturer', 'Supervisor', 'kaysar@cse.buet.ac.bd', 1),
('khaledshahriar', '565d88cd0de5f5d8b6c997442525ab4c', 'Khaled Mahmud Shahriar', 'Assistant Professor', 'Supervisor', 'k.m.shahriar@gmail.com', 1),
('madhusudan', '9d253b2f2edc4a4c8c002caace66f80d', 'Madhusudan Basak', 'Lecturer', 'Supervisor', 'madhusudan.buet@gmail.com', 1),
('mahbubul', 'd7886e9f69c68c5452afb12aabd24e2b', 'Md. Mahbubul Hasan', 'Lecturer', 'Supervisor', 'shanto86@gmail.com', 1),
('mahfuz', 'e31dd3474905d4269cd24fbd23195c64', 'Dr. Mohammad Mahfuzul Islam', 'Professor', 'Supervisor', 'mahfuz@cse.buet.ac.bd', 1),
('mahfuza', '830c194cf4d993dd2280943ab550bd42', 'Mahfuza Sharmin', 'Lecturer', 'Supervisor', 'sharmin@cse.buet.ac.bd', 1),
('mahmudanaznin', 'ba6f9791857efbaf23f36eb9afc90ef6', 'Dr. Mahmuda Naznin', 'Professor', 'Supervisor', 'mahmudanaznin@cse.buet.ac.bd', 1),
('masattar', '71a8511fa797dfb6c13d269a7387c56f', 'Md. Abdus Sattar', 'Associate Professor', 'Supervisor', 'masattar@cse.buet.ac.bd', 1),
('masruba', 'ed74fd49f32a0489e3ff8647c8253f5f', 'Masruba Tasnim', 'Lecturer', 'Supervisor', 'masruba@gmail.com', 1),
('masudhasan', 'fe9996f4cc78a8e3608634e61cccfb00', 'Dr. Masud Hasan', 'Professor', 'Supervisor', 'masudhasan@cse.buet.ac.bd', 1),
('mdabedul', '2ef1a4da685f487ff6b12c360901a6ef', 'Md. Abedul Haque', 'Assistant Professor', 'Supervisor', 'mdabedul@cse.buet.ac.bd', 1),
('mdmonirulislam', 'e7320977395cc4e43289390764ecb851', 'Dr. Md. Monirul Islam', 'Professor', 'Supervisor', 'mdmonirulislam@cse.buet.ac.bd', 1),
('mdmuhibur', 'cc649cb883188e09c38ee207c014a54b', 'Md. Muhibur Rasheed', 'Lecturer', 'Supervisor', 'm3r2buet@yahoo.com', 1),
('mehnaztabassum', 'c8d0a614a8e63a0451459212ed2acb0e', 'Mehnaz Tabassum Mahin', 'Lecturer', 'Supervisor', 'mehnaztabassummahin@gmail.com', 1),
('mhkabir', '9324b739f9cd431caa02e49a2cbefaa4', 'Dr. Md. Humayun Kabir', 'Professor', 'Supervisor', 'mhkabir@cse.buet.ac.bd', 1),
('mmasroorali', '79d7300b64a603dec0517a13ebd36ee5', 'Dr. Muhammad Masroor Ali', 'Professor', 'Supervisor', 'mmasroorali@cse.buet.ac.bd', 1),
('mmislam', '8aa2f18dbad685474729dc4ec473035c', 'Dr. Md. Monirul Islam', 'Associate Professor', 'Supervisor', 'mmislam@cse.buet.ac.bd', 1),
('mmrahman', '386bc32c0736dc187b7d5d217103e4e7', 'Md. Mustafizur Rahman', 'Assistant Professor', 'Supervisor', 'mustafiz_rahman@cse.buet.ac.bd', 1),
('mostofa', 'a8869cde8df751595b21b5dfc4bd1228', 'Dr. Md. Mostofa Akbar', 'Professor', 'Supervisor', 'mostofa@cse.buet.ac.bd', 1),
('mostofapatwary', 'd0f3224efb76e4513539af69cc232b44', 'Md. Mostofa Ali Patwary', 'Assistant Professor', 'Supervisor', 'mostofapatwary@cse.buet.ac.bd', 1),
('mrahman', '8c90029cfdde5ff8440a8bd713800254', 'Mohammad Saifur Rahman', 'Assistant Professor', 'Supervisor', 'srautonu@yahoo.com', 1),
('mshohrabhossain', 'b7d933acdc1b787cdb8bbd2f5a808c7f', 'Dr. Md. Shohrab Hossain', 'Associate Professor', 'Supervisor', 'mshohrabhossain@cse.buet.ac.bd', 1),
('msrahman', '65b3a43e2808f2cc1e2a9de8d5223cba', 'Dr. M. Sohel Rahman', 'Professor', 'Supervisor', 'msrahman@cse.buet.ac.bd', 1),
('mtirfan', 'e129c01867d50c0c4280117d2815ac04', 'Mohammad Tanvir Irfan', 'Assistant Professor', 'Supervisor', 'mtirfan@cse.buet.ac.bd', 1),
('nazmul', 'nazmul', 'Nazmul Haque', 'Assistant Programmer', 'Admin', 'nlnazmul@gmail.com', 1),
('nazmus', '37ec1c96169cc2b57cfe3bcd827cdf16', 'Nazmus Saquib', 'Lecturer', 'Supervisor', 'saquib2527@gmail.com', 1),
('nshahriar', '2b93846e9c7f4303510620aa698e42d0', 'Nashid Shahriar', 'Assistant Professor', 'Supervisor', 'nshahriar@cse.buet.ac.bd', 1),
('papon', '50d9590f89961bdf9f36b2d18d02dfb9', 'Md. Tarikul Islam Papon', 'Lecturer', 'Supervisor', 'tarikulpapon@gmail.com', 1),
('radireza', 'fa2a29354b8fc2b25df1d93685ca2fcb', 'Radi Muhammad Reza', 'Lecturer', 'Supervisor', 'radireza@gmail.com', 1),
('rajkumar', 'c223199626bf0875cbc4e5859c93040c', 'Rajkumar Das', 'Assistant Professor', 'Supervisor', 'rajkumardash05@yahoo.com', 1),
('rakinhaider', 'f36a39a80b06a7ad32fe0640d30a6b0f', 'Ch. Md. Rakin Haider', 'Lecturer', 'Supervisor', 'rakinhaider@gmail.com', 1),
('razi', 'd6e0303b490c89f6590d410a55cd1eae', 'Dr. A. B. M. Alim Al Islam', 'Assistant Professor', 'Supervisor', 'alim_razi@cse.buet.ac.bd', 1),
('reazahmedXXX', '54bdedd81bf1c587bb6c1ac78494a241', 'Dr. Reaz Ahmed', 'Associate Professor', 'Supervisor', 'reaz@cse.buet.ac.bd', 1),
('rezwana', 'bc69c09f24254311194dd59db27b0761', 'Rezwana Reaz Rimpi', 'Lecturer', 'Supervisor', 'rimpi0505042@gmail.com', 1),
('rifat', '35c0c28414ac08bb8b6729631f69ee01', 'Dr. Rifat Shahriyar', 'Assistant Professor', 'Supervisor', 'rifat@cse.buet.ac.bd', 1),
('roots', 'c5f6f584b79463f58c223f18fef206ef', 'webadmin', 'webadmin', 'Supervisor', 'enggiqbal@gmail.com', 1),
('sabbirahmad', 'c26b31ea9b0260477a54c31aaf981273', 'Sabbir Ahmad', 'Lecturer', 'Supervisor', 'ahmadsabbir@cse.buet.ac .bd', 1),
('sadia', '91b5cd208feabcc9b01cd14b7e4e83ad', 'Dr. Sadia Sharmin', 'Assistant Professor', 'Supervisor', 'sadiasharmin@cse.buet.ac.bd', 1),
('saidurrahman', '68a316f2ab93d5d56d1198141b275cec', 'Dr. Md. Saidur Rahman', 'Professor', 'Supervisor', 'saidurrahman@cse.buet.ac.bd', 1),
('sakib', '28e9ae3ae3f544edf077eae414725fa2', 'Md. Iftekharul Islam Sakib', 'Lecturer', 'Supervisor', 'miisakib@gmail.com', 1),
('sarah_masud', '19468effd814f9e27ba15d7cb0a757ef', 'Sarah Masud Preum', 'Lecturer', 'Supervisor', 'sarahmasud.sm@gmail.com', 1),
('sayeedhyder', 'a6e36dbb34804cdb0728f0c45cf643ad', 'Chowdhury Sayeed Hyder', 'Lecturer', 'Supervisor', 'deeyas017@yahoo.com', 1),
('sayeedmondol', 'a66f05c2d38fc33a2d7a12e26b98e9fb', 'Md. Abu Sayeed Mondol', 'Assistant Professor', 'Supervisor', 'abusayeedbd@gmail.com', 1),
('shagufta_mehnaz', 'c0ef145960823338233298c021c7c1ac', 'Shagufta Mehnaz', 'Lecturer', 'Supervisor', 'shagufta.me@gmail.com', 1),
('shahrear', 'e0cff155bfeed8ea9c3fd6cb06a700b1', 'Md. Shahrear Iqbal', 'Assistant Professor', 'Supervisor', 'shahreariqbal@cse.buet.ac.bd', 1),
('shaifur', 'b2eac3cf2fb9742950290e1a0b63638f', 'Md. Shaifur Rahman', 'Assistant Professor', 'Supervisor', 'shaifur@cse.buet.ac.bd', 1),
('shampa', '40783719ac051c03a39ac0fa3aa7f554', 'Shampa Shahriyar', 'Lecturer', 'Supervisor', 'shampa077@gmail.com', 1),
('shamsul', 'b21f0689425fa2932096b0a812439e2b', 'Dr. Md. Shamsul Alam', 'Professor', 'Supervisor', 'shamsul@cse.buet.ac.bd', 1),
('shareeftamal', 'dee645d6c1c5651ad37e500af302ef28', 'Shareef Ahmed', 'Lecturer', 'Supervisor', 'shareef.tamal@gmail.com', 1),
('sharif', '585a097e7ec1f2ba93c7d066d6f7fc5e', 'Md. Shariful Islam Bhuyan', 'Assistant Professor', 'Supervisor', 'sharifulislam@cse.buet.ac.bd', 1),
('shihab', '256bcc24b08cca0e54de7e6ab70e12a3', 'Shihabur Rahman Chowdhury', 'Lecturer', 'Supervisor', 'shihab@cse.buet.ac.bd', 1),
('siddhartha', '2b651f73856219b06e9659b2867524d5', 'Siddhartha Shankar Das', 'Lecturer', 'Supervisor', 'siddhartha047@gmail.com', 1),
('smfarhad', 'e9b56a9dd1e8b9759f3ed959c92b2fa4', 'Dr. S. M. Farhad', 'Associate Professor', 'Supervisor', 'smfarhad@cse.buet.ac.bd', 1),
('snazeen', '865c1afbde7cf95d30406aef6dff5016', 'Sumaiya Nazeen', 'Lecturer', 'Supervisor', 'nazeen@webmail.buet.ac.bd', 1),
('sohansayed', '8265608cd6df6f26023366019d3aa736', 'A.S.M. Sohidull Islam', 'Lecturer', 'Supervisor', 'sohansayed at gmail dot com', 1),
('sukarnabarua', 'd68614fe68a853dd6ed0d286487395ca', 'Sukarna Barua', 'Assistant Professor', 'Supervisor', 'sukarna.barua@gmail.com', 1),
('sumaiya', '928ab7a29ae22e4a609e8a1bb869b96e', 'Sumaiya Iqbal', 'Assistant Professor', 'Supervisor', 'anni.are@gmail.com', 1),
('sunnysajjad', '8929c5f5b8db096a8f0baa701d798ae7', 'Sajjadur Rahman', 'Lecturer', 'Supervisor', 'rahmansunny071@gmail.com', 1),
('tahsin', '86b0aaef2b969ea4bc380e378fb2b952', 'Md. Anindya Tahsin Prodhan', 'Assistant Professor', 'Supervisor', 'anindya.tahsin@gmail.com', 1),
('takhan', '29e85900868804838267f23322d3f8de', 'Tanvir Ahmed Khan', 'Lecturer', 'Supervisor', 'takhandipu@gmail.com', 1),
('tanmoycse', '45b0a9e12960381ab94a108ab12f37b3', 'Tanmoy Sen', 'Lecturer', 'Supervisor', 'sen.buet@gmail.com', 1),
('tanveerawal', '89005223c3674cf678ea49a70b2def2a', 'Tanveer Awal', 'Assistant Professor', 'Supervisor', 'tanveerawal@cse.buet.ac.bd', 1),
('tanzimahashem', '7ac2a94b77d927300c21e173f5cb1bbe', 'Dr. Tanzima Hashem', 'Associate Professor', 'Supervisor', 'tanzimahashem@cse.buet.ac.bd', 1),
('toufique', '583dbd5cc711f0b734400c8d2babbbd6', 'Toufique Ahmed', 'Lecturer', 'Supervisor', 'toufique90@gmail.com', 1),
('utpalkumar', '09fff65f50ca6a472831da307b4a2c70', 'Utpal Kumar Paul', 'Lecturer', 'Supervisor', 'utpalkumar@cse.buet.ac.bd', 1),
('wasif', 'ac9c3b9aafeb3165e642a29e5be59032', 'Abu Wasif', 'Assistant Professor', 'Supervisor', 'wasif@cse.buet.ac.bd', 1),
('webtonmoy', 'bd5cc3f98bd63fafff5fb59d6eabc537', 'Hasan Shahid Ferdous', 'Assistant Professor', 'Supervisor', 'hsferdous@cse.buet.ac.bd', 1),
('yusufsarwar', '11053928f43e5a82aed113e79bf800d2', 'Dr. Md. Yusuf Sarwar Uddin', 'Associate Professor', 'Supervisor', 'yusufsarwar@cse.buet.ac.bd', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
