-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2016 at 07:47 AM
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

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `faculty_name`(username VARCHAR(50)) RETURNS varchar(50) CHARSET utf8 COLLATE utf8_unicode_ci
BEGIN
        DECLARE NAME_FOUND VARCHAR(50);
        SELECT CONCAT(fac_name," (", fac_login,")") INTO NAME_FOUND FROM cseweb.fac_list WHERE fac_login = username;
	RETURN NAME_FOUND;
	
    END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `student_name`(id VARCHAR(50)) RETURNS varchar(50) CHARSET utf8 COLLATE utf8_unicode_ci
BEGIN
        DECLARE NAME_FOUND VARCHAR(50);
        SELECT CONCAT(STUDENTNAME," (", STUDENTID,")") INTO NAME_FOUND FROM cseweb.csestudents WHERE STUDENTID = id;
	RETURN NAME_FOUND;
	
    END$$

DELIMITER ;

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
  `role` enum('Admin','Supervisor','Member','External','Student') CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `full_name`, `role`, `email`, `status`) VALUES
('0411054002', '0411054002', '0411054002', 'Student', NULL, 1),
('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Nazmul', 'Admin', NULL, 1),
('ashikurrahman', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Ashik', 'Supervisor', NULL, 0),
('kashem', 'kashem', 'Kashem Mia', 'Supervisor', NULL, 0),
('member', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Nazmul Member', 'Member', NULL, 0),
('nlnazmul@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Nazmul', 'External', NULL, 1),
('student', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Nazmul Student', 'Student', NULL, 1),
('supervisor', 'ashikurrahman', 'Nazmul Supervisor', 'Supervisor', NULL, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
