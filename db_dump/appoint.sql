-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2018 at 04:31 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appoint`
--
CREATE DATABASE IF NOT EXISTS `appoint` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `appoint`;

-- --------------------------------------------------------

--
-- Table structure for table `ea_appointments`
--

DROP TABLE IF EXISTS `ea_appointments`;
CREATE TABLE `ea_appointments` (
  `id` int(11) NOT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `notes` text,
  `hash` text,
  `is_unavailable` tinyint(4) DEFAULT '0',
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_consents`
--

DROP TABLE IF EXISTS `ea_consents`;
CREATE TABLE `ea_consents` (
  `id` int(11) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_migrations`
--

DROP TABLE IF EXISTS `ea_migrations`;
CREATE TABLE `ea_migrations` (
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_migrations`
--

INSERT INTO `ea_migrations` (`version`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `ea_roles`
--

DROP TABLE IF EXISTS `ea_roles`;
CREATE TABLE `ea_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_roles`
--

INSERT INTO `ea_roles` (`id`, `name`, `slug`, `is_admin`, `appointments`, `customers`, `services`, `users`, `system_settings`, `user_settings`) VALUES
(1, 'Administrator', 'admin', 1, 15, 15, 15, 15, 15, 15),
(2, 'Teacher', 'provider', 0, 15, 15, 0, 0, 0, 15),
(3, 'Student', 'customer', 0, 0, 0, 0, 0, 0, 0),
(4, 'Secretary', 'secretary', 0, 15, 15, 0, 0, 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ea_secretaries_providers`
--

DROP TABLE IF EXISTS `ea_secretaries_providers`;
CREATE TABLE `ea_secretaries_providers` (
  `id_users_secretary` int(11) NOT NULL,
  `id_users_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_services`
--

DROP TABLE IF EXISTS `ea_services`;
CREATE TABLE `ea_services` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT '1',
  `id_service_categories` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services`
--

INSERT INTO `ea_services` (`id`, `name`, `duration`, `price`, `currency`, `description`, `availabilities_type`, `attendants_number`, `id_service_categories`) VALUES
(2, 'Advanced Operating System - Section [A]', 10, NULL, '', 'Counseling hours for AOS, section A Students', 'fixed', 1, NULL),
(3, 'Web Technologies - Section [D]', 10, NULL, '', 'Web Technologies - Section [D] Students consulting hour', 'flexible', 1, NULL),
(4, 'Web Technologies - Section [E1]', 10, NULL, NULL, 'Web Technologies - Section [E1] students consulting hour', 'flexible', 1, NULL),
(5, 'Web Technologies - Section [E2]', 5, NULL, NULL, 'Web Technologies - Section [E2] students consulting hour', 'fixed', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services_providers`
--

DROP TABLE IF EXISTS `ea_services_providers`;
CREATE TABLE `ea_services_providers` (
  `id_users` int(11) NOT NULL,
  `id_services` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services_providers`
--

INSERT INTO `ea_services_providers` (`id_users`, `id_services`) VALUES
(2, 2),
(2, 3),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_categories`
--

DROP TABLE IF EXISTS `ea_service_categories`;
CREATE TABLE `ea_service_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_settings`
--

DROP TABLE IF EXISTS `ea_settings`;
CREATE TABLE `ea_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_settings`
--

INSERT INTO `ea_settings` (`id`, `name`, `value`) VALUES
(1, 'company_working_plan', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]}}'),
(2, 'book_advance_timeout', '30'),
(3, 'google_analytics_code', ''),
(4, 'customer_notifications', '1'),
(5, 'date_format', 'DMY'),
(6, 'time_format', 'regular'),
(7, 'require_captcha', '1'),
(8, 'display_cookie_notice', '0'),
(9, 'cookie_notice_content', 'Cookie notice content.'),
(10, 'display_terms_and_conditions', '0'),
(11, 'terms_and_conditions_content', 'Terms and conditions content.'),
(12, 'display_privacy_policy', '0'),
(13, 'privacy_policy_content', 'Privacy policy content.'),
(14, 'company_name', 'Student Appointment Management System'),
(15, 'company_email', 'saef@aiub.edu'),
(16, 'company_link', 'www.aiub.edu');

-- --------------------------------------------------------

--
-- Table structure for table `ea_users`
--

DROP TABLE IF EXISTS `ea_users`;
CREATE TABLE `ea_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mobile_number` varchar(128) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip_code` varchar(64) DEFAULT NULL,
  `notes` text,
  `id_roles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_users`
--

INSERT INTO `ea_users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `phone_number`, `address`, `city`, `state`, `zip_code`, `notes`, `id_roles`) VALUES
(1, 'Mohammad Saef Ullah', 'Miah', 'saef@aiub.edu', NULL, '01723456106', NULL, NULL, NULL, NULL, NULL, 1),
(2, 'Mohammad Saef Ullah', 'Miah', 'john@doe.com', '', '0123456789', '', '', '', '', '', 2),
(3, 'test', 'test', 'test@test.com', NULL, '0211212', '', '', NULL, '', NULL, 3),
(4, 'test1', 'test 2', 'test1@test.com', NULL, '0000222', '', '', NULL, '', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_settings`
--

DROP TABLE IF EXISTS `ea_user_settings`;
CREATE TABLE `ea_user_settings` (
  `id_users` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `working_plan` text,
  `notifications` tinyint(4) DEFAULT '0',
  `google_sync` tinyint(4) DEFAULT '0',
  `google_token` text,
  `google_calendar` varchar(128) DEFAULT NULL,
  `sync_past_days` int(11) DEFAULT '5',
  `sync_future_days` int(11) DEFAULT '5',
  `calendar_view` varchar(32) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_user_settings`
--

INSERT INTO `ea_user_settings` (`id_users`, `username`, `password`, `salt`, `working_plan`, `notifications`, `google_sync`, `google_token`, `google_calendar`, `sync_past_days`, `sync_future_days`, `calendar_view`) VALUES
(1, 'saef', '696ef6af418d30905e5223a0d38f2e316475abe5d5f6d59831ea47fe022bba51', 'f33f37ed4d73ec25033151b1e2699f6319371b1243d64f9e3c78f6af242580d4', NULL, 0, 0, NULL, NULL, 5, 5, 'default'),
(2, 'johndie', 'b1dedf5f621e1bb3e58f85a3cda38e2468db3898fcbedcb0f81f8bb8a9f96ca8', '9b281debaf1056640a20bf5b8224d71b1b23b120d6ccb32843a493cead67748a', '{\"sunday\":null,\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"09:00\",\"end\":\"10:00\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"09:00\",\"end\":\"10:00\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":null}', 1, 0, NULL, NULL, 5, 5, 'default');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users_customer` (`id_users_customer`),
  ADD KEY `id_services` (`id_services`),
  ADD KEY `id_users_provider` (`id_users_provider`);

--
-- Indexes for table `ea_consents`
--
ALTER TABLE `ea_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_roles`
--
ALTER TABLE `ea_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  ADD KEY `id_users_secretary` (`id_users_secretary`),
  ADD KEY `id_users_provider` (`id_users_provider`);

--
-- Indexes for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_categories` (`id_service_categories`);

--
-- Indexes for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD PRIMARY KEY (`id_users`,`id_services`),
  ADD KEY `id_services` (`id_services`);

--
-- Indexes for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_settings`
--
ALTER TABLE `ea_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indexes for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ea_consents`
--
ALTER TABLE `ea_consents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_roles`
--
ALTER TABLE `ea_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_services`
--
ALTER TABLE `ea_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_settings`
--
ALTER TABLE `ea_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ea_users`
--
ALTER TABLE `ea_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
