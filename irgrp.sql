-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 10.1.128.159:3306
-- Время создания: Июл 02 2020 г., 14:04
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `irgrp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_block_db`
--

CREATE TABLE `auth_block_db` (
  `id` int(4) NOT NULL,
  `SHEMA_NAME` varchar(64) NOT NULL,
  `SHEMA_LOGIN_PASS` tinyint(1) NOT NULL,
  `SHEMA_CONNECT_ERR` tinyint(1) NOT NULL,
  `SHEMA_CREATED` varchar(64) DEFAULT NULL COMMENT 'создано',
  `SHEMA_HOST_PORT` varchar(256) DEFAULT NULL,
  `SHEMA_PLATFORM_NAME` varchar(64) DEFAULT NULL COMMENT 'ПЛАТФОРМА',
  `SHEMA_SERVICE` varchar(64) DEFAULT NULL COMMENT 'СЛУЖБА',
  `SHEMA_HOST` varchar(64) DEFAULT NULL COMMENT 'ХОСТ',
  `SHEMA_OSUSER` varchar(64) DEFAULT NULL COMMENT 'ПОЛЬЗОВАТЕЛЕЙ',
  `SHEMA_SID` varchar(64) DEFAULT NULL COMMENT 'СЕССИЙ',
  `SHEMA_ORACLE_TIME` varchar(8) DEFAULT NULL COMMENT 'Oracle Wait Time',
  `SHEMA_CPU_TIME` varchar(8) DEFAULT NULL COMMENT 'Oracle CPU Time',
  `SHEMA_DB_LINK` varchar(512) DEFAULT NULL,
  `SHEMA_DB_L_DATE_CRT` varchar(64) DEFAULT NULL,
  `SHEMA_DB_LINK_TRANSLATE` varchar(512) DEFAULT NULL,
  `SHEMA_DB_LINK_TNS` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_block_db`
--

INSERT INTO `auth_block_db` (`id`, `SHEMA_NAME`, `SHEMA_LOGIN_PASS`, `SHEMA_CONNECT_ERR`, `SHEMA_CREATED`, `SHEMA_HOST_PORT`, `SHEMA_PLATFORM_NAME`, `SHEMA_SERVICE`, `SHEMA_HOST`, `SHEMA_OSUSER`, `SHEMA_SID`, `SHEMA_ORACLE_TIME`, `SHEMA_CPU_TIME`, `SHEMA_DB_LINK`, `SHEMA_DB_L_DATE_CRT`, `SHEMA_DB_LINK_TRANSLATE`, `SHEMA_DB_LINK_TNS`) VALUES
(1, 'RTL.SD', 1, 0, '29/06/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL206.rtl.ufa.usb', 'FC\\UFA01-S07042', '48', '217', '77.12', '22.88', 'mps.tech', '29/06/20', 'WAY4', '24'),
(2, 'RTL.TEST', 1, 0, '22/06/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL203.rtl.ufa.usb', 'FC\\UFA01-S07042', '57', '276', '53.15', '46.85', 'cvm3t;cftcl609;apexsrv.ufa.usb;mps01', '26/06/20;22/06/20;29/06/20;22/06/20', ';CFT-BANK;;', ';22;;'),
(3, 'RTL.KGO2', 1, 0, '18/05/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL200.rtl.ufa.usb', 'FC\\UFA01-S07042', '7', '77', '17.16', '82.84', 'cftcl607', '18/05/20', 'CFT-BANK', '17'),
(4, 'RTL13', 1, 0, '29/06/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL205.rtl.ufa.usb', 'FC\\UFA01-S07042', '19', '41', '1.19', '98.81', 'mpscl801;cftcl604', '29/06/20;29/06/20', 'WAY4;CFT-BANK', '24;21'),
(5, 'RTL.CKK2', 1, 0, '19/06/20', 'IBSORT11.FC.URALSIBBANK.RU:1521', 'Linux x86 64-bit', 'RTLCL207.rtl.ufa.usb', 'FC\\UFA01-S07042', '12', '22', '0.06', '99.94', 'mpscl802', '19/06/20', 'WAY4', '25'),
(6, 'RTL.PERF', 1, 1, '19/06/20', 'IBSORT11.FC.URALSIBBANK.RU:1521', 'Linux x86 64-bit', 'RTLCL207.rtl.ufa.usb', 'FC\\UFA01-S07042', '12', '22', '0.06', '99.94', '', '19/06/20', 'WAY4', '25'),
(7, 'RTL.TEMP2', 1, 1, '19/06/20', 'IBSORT11.FC.URALSIBBANK.RU:1521', 'Linux x86 64-bit', 'RTLCL207.rtl.ufa.usb', 'FC\\UFA01-S07042', '12', '22', '0.06', '99.94', '', '19/06/20', 'WAY4', '25'),
(8, 'RTL.TECH2', 1, 0, '04/05/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL212.rtl.ufa.usb', 'FC\\UFA01-S07042', '6', '40', '79.16', '20.84', 'mpspr3;cftgarb3n.ibso.ufa.usb', '06/05/20;04/05/20', ';CFT-BANK', ';15'),
(9, 'RTL.REPORT', 1, 1, '04/05/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL212.rtl.ufa.usb', 'FC\\UFA01-S07042', '6', '40', '79.16', '20.84', '', '06/05/20;04/05/20', ';CFT-BANK', ';15'),
(10, 'RTL.REPORT2', 1, 0, '01/07/20', 'MSK-IBSORT11.FC.URALSIBBANK.RU:1521', 'Linux x86 64-bit', 'RTLCL202.rtl.ufa.usb', 'FC\\UFA01-S07042', '4', '8', '0', '100.18', '', '', '', ''),
(11, 'RTL.REGRESS', 1, 0, '29/06/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL220.rtl.ufa.usb', 'FC\\UFA01-S07042', '12', '70', '38.19', '61.81', 'cftcl602;cvm3t;rtlcl220.rtl.ufa.usb;dbo2cl101', '29/06/20;29/06/20;29/06/20;29/06/20', 'CFT-BANK;;Ритейл;', '18;;40;'),
(12, 'RTL.SCHOOL', 1, 1, '29/06/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL220.rtl.ufa.usb', 'FC\\UFA01-S07042', '12', '70', '38.19', '61.81', '', '29/06/20;29/06/20;29/06/20;29/06/20', 'CFT-BANK;;Ритейл;', '18;;40;'),
(13, 'CFTBANK.JOIN', 1, 1, '29/06/20', 'ibsort11.fc.uralsibbank.ru:1521', 'Linux x86 64-bit', 'RTLCL220.rtl.ufa.usb', 'FC\\UFA01-S07042', '12', '70', '38.19', '61.81', '', '29/06/20;29/06/20;29/06/20;29/06/20', 'CFT-BANK;;Ритейл;', '18;;40;');

-- --------------------------------------------------------

--
-- Структура таблицы `config_update`
--

CREATE TABLE `config_update` (
  `id` int(11) NOT NULL,
  `tbl_name` varchar(64) NOT NULL,
  `auto_update` tinyint(1) DEFAULT NULL COMMENT '1 - нужно ли подменять значения для овтообновления. Используется для тех таблиц у которых не может быть использована единая конфигурация для всех пользователей',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_ip` varchar(16) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `tbl_caption` varchar(256) DEFAULT NULL,
  `time_for_update` time DEFAULT NULL COMMENT 'время через которое нужно обновлять',
  `parent_link` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `config_update`
--

INSERT INTO `config_update` (`id`, `tbl_name`, `auto_update`, `date`, `user_ip`, `user_name`, `tbl_caption`, `time_for_update`, `parent_link`) VALUES
(2, 'db_list_shema', 0, '2020-06-19 10:19:02', '10.1.128.160', 'AkhmadievaEI', 'Технологические базы данных', '12:00:00', 'http://ufa-webdbot02.fc.uralsibbank.ru/apex/f?p=106:1:0:::::'),
(10, 'auth_block_db', 0, '2020-07-02 15:48:16', '10.1.128.16', 'ValievaSR', ' ', '00:30:00', NULL),
(13, 'user_info', 1, '2019-11-26 18:41:40', '10.1.128.11', 'MukhamadieVA', '', '23:59:59', NULL),
(16, 'user_workorder', 1, '2020-07-02 14:56:36', '10.1.128.159', 'MukhamadieVA', 'Мои наряды', '02:00:00', 'https://sdportal/workorder/'),
(17, 'db_net_tns', 1, '2020-07-02 14:59:03', '10.1.128.159', 'MukhamadieVA', 'Сетевая TNS', '23:59:59', '\\\\\\fc.uralsibbank.ru\\ufa-dfs01\\Ibso\\network\\ADMIN\\TNSNAMES.ORA');

-- --------------------------------------------------------

--
-- Структура таблицы `db_config_shema`
--

CREATE TABLE `db_config_shema` (
  `id` int(4) NOT NULL,
  `SHEMA_NAME` varchar(128) NOT NULL,
  `SHEMA_LOGIN` varchar(128) NOT NULL,
  `SHEMA_PASS` varchar(256) NOT NULL,
  `SHEMA_TNS` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `db_config_shema`
--

INSERT INTO `db_config_shema` (`id`, `SHEMA_NAME`, `SHEMA_LOGIN`, `SHEMA_PASS`, `SHEMA_TNS`) VALUES
(1, 'RTL.SD', 'IBS', 'juehtw123', 'RTL.SD=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl206.rtl.ufa.usb)))'),
(2, 'RTL.TEST', 'IBS', 'juehtw123', 'RTL.TEST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl203.rtl.ufa.usb)))'),
(3, 'RTL.KGO2', 'IBS', 'juehtw123', 'RTL.KGO2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl200.rtl.ufa.usb)))'),
(4, 'RTL13', 'IBS', 'kbvjyfl', 'RTL13=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl205.rtl.ufa.usb)))'),
(5, 'RTL.CKK2', 'IBS', 'ckk2546', 'RTL.CKK2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL207.RTL.UFA.USB)))'),
(6, 'RTL.PERF', 'IBS', 'kbvjyfl', 'RTL.PERF=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl210.rtl.ufa.usb)))'),
(7, 'RTL.TEMP2', 'IBS', 'kbvjyfl', 'RTL.TEMP2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl204.rtl.ufa.usb)))'),
(8, 'RTL.TECH2', 'IBS', 'juehtw123', 'RTL.TECH2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl212.rtl.ufa.usb)))'),
(9, 'RTL.REPORT', 'IBS', 'kbvjyfl', 'RTL.REPORT=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl201.rtl.ufa.usb)))'),
(10, 'RTL.REPORT2', 'IBS', 'kbvjyfl', 'RTL.REPORT2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL202.RTL.UFA.USB)))'),
(11, 'RTL.REGRESS', 'IBS', 'ku3ov0k', 'RTL.REGRESS=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl220.rtl.ufa.usb)))'),
(12, 'RTL.SCHOOL', 'IBS', 'kbvjyfl', 'RTL.SCHOOL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl211.rtl.ufa.usb)))'),
(13, 'CFTBANK.JOIN', 'IBS', 'join2020', 'CFTBANK.JOIN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl604.ibso.ufa.usb)))');

-- --------------------------------------------------------

--
-- Структура таблицы `db_list_shema`
--

CREATE TABLE `db_list_shema` (
  `id` int(3) NOT NULL,
  `db_name` varchar(32) NOT NULL,
  `db_distorted` varchar(1) NOT NULL,
  `db_date_update` varchar(32) NOT NULL,
  `db_system` varchar(32) NOT NULL,
  `db_owner` varchar(128) NOT NULL,
  `db_phone_owner` varchar(32) NOT NULL,
  `db_server` varchar(32) NOT NULL,
  `db_copy_project` varchar(256) NOT NULL,
  `db_business` varchar(32) NOT NULL,
  `db_comment` varchar(128) NOT NULL,
  `db_customer` varchar(128) NOT NULL,
  `db_phone_customer` varchar(32) NOT NULL,
  `db_tns` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `db_list_shema`
--

INSERT INTO `db_list_shema` (`id`, `db_name`, `db_distorted`, `db_date_update`, `db_system`, `db_owner`, `db_phone_owner`, `db_server`, `db_copy_project`, `db_business`, `db_comment`, `db_customer`, `db_phone_customer`, `db_tns`) VALUES
(1, 'CKKCL400', 'Y', '13-10-2017', 'Ckk collection', 'Лукьянов Игорь Михайлович', '(010)-4193', 'ufads01sit', '-', '-', 'Клон ckkcl400 создан с клона ckkcl401', 'Лукьянов Игорь Михайлович', '(010)-4193', 'CKKCL400=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ufads01sit.fc.uralsibbank.ru)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=ckkcl400.ckk.ufa.usb)))'),
(2, 'CKKCL401', 'N', '04-08-2017', 'Ckk collection', 'Лукьянов Игорь Михайлович', '(010)-4193', 'ufads03sit', '-', '-', 'Клон ckkcl401', 'Лукьянов Игорь Михайлович', '(010)-4193', 'CKKCL401=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ufads03sit.fc.uralsibbank.ru)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=ckkcl401.ufa.usb)))'),
(3, 'CKKCL402', 'N', '02-07-2018', 'Ckk collection', 'Лукьянов Игорь Михайлович', '(010)-4193', 'ufads01sit', '-', '-', 'Клон ckkcl402', 'Лукьянов Игорь Михайлович', '(010)-4193', 'CKKCL402=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ufads01sit.fc.uralsibbank.ru)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=ckkcl402.ckk.ufa.usb)))'),
(4, 'CKKCL403', 'N', '12-09-2017', 'Ckk collection', 'Лукьянов Игорь Михайлович', '(010)-4193', 'ufads01sit', '-', '-', 'Клон ckkcl403', 'Лукьянов Игорь Михайлович', '(010)-4193', 'CKKCL403=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ufads01sit.fc.uralsibbank.ru)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=ckkcl403.ckk.ufa.usb)))'),
(5, 'CKKCL404', 'Y', '24-01-2018', 'Ckk collection', 'Лукьянов Игорь Михайлович', '(010)-4193', 'ufads01sit', '-', '-', 'Клон ckkcl404', 'Лукьянов Игорь Михайлович', '(010)-4193', 'CKKCL404=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ufads01sit.fc.uralsibbank.ru)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=ckkcl404.ckk.ufa.usb)))'),
(6, 'CKKCL405', 'N', '30-05-2018', 'Ckk collection', 'И.А. Аверин', '-', 'ufads03sit', '-', '-', 'Для тестирования oracle 12', 'И.А. Аверин', '-', 'CKKCL405=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ufads03sit.fc.uralsibbank.ru)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=ckkcl405.ufa.usb)))'),
(7, 'CPRTEST', 'N', '07-06-2012', 'City+', 'Клеванский Геннадий Валерьевич', '(010)-4061', 'ds03citypn', 'Проект «Каскад»', '-', 'удалена', 'Клеванский Геннадий Валерьевич', '(010)-4061', 'CPRTEST=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ds03citypn)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=cprtest)))'),
(8, 'CRM01', '-', '-', '-', '-', '-', '-', '-', '-', 'Клон (crmcl300) V7000T', 'Лукьянов Игорь Михайлович', '(010)-4193', 'crmcl300=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ufads03sit.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=crmcl300.crm.ufa.usb)))'),
(9, 'DBOF1', 'N', '26-06-2012', 'DBO физ. лиц', 'Журба Евгений Александрович', '(010)-2900', 'ufa-clstbsvk', 'Копия WEB для миграции Москвы в Finacle (a.k.a. WEBTST2)', '-', 'не существует', 'Зайцев Сергей Вячеславович', '(054)-5707', 'WEBTST2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ufa-clstbsvk.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=webtst2.dbofl.ufa.usb)))'),
(10, 'DBOU1', 'N', '26-04-2011', 'DBO юр. лиц', 'Журба Евгений Александрович', '(010)-2900', 'ufa-ibsodvp', 'Копия BSS.MSK для миграции Москвы в Finacle (a.k.a. BSS.FIN)', '-', 'не существует', 'Зайцев Сергей Вячеславович', '(054)-5707', 'BSS.FIN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ufa-ibsodvp.fc.uralsibbank.ru)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=bssfin)))'),
(11, 'DBOU2', 'N', '15-05-2012', 'DBO юр. лиц', 'Мухаметзянов Рустем Загирович', '(010)-4248', 'ufa-ds01dub', 'проект &quot;Каскад&quot;', '-', 'не существует', 'Мухаметзянов Рустем Загирович', '(010)-4248', 'BSSTEST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ufa-ds01dub.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=BSSTEST)))'),
(12, 'ELDVP', 'N', '17-03-2017', 'Электронный архив', 'Галеев Э,', '-', 'ibsort4', 'Копия для разрабочиков', '-', '-', '?', '?', 'ELDVP=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort4.fc.uralsibbank.ru)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=cfteldb)))'),
(13, 'IBS0', 'N', '02-12-2019', 'CFT-BANK', 'Махмутов Альберт Адгамович', '(010)-4209', 'ibsort33', 'Схема разработки (не искаженная)', '-', 'Клон (cftcl605) v7000T', 'Галеев Эдуард Робертович', '(010)-4209', 'cftbank.perf=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl605)))'),
(14, 'IBS02', 'Y', '25-11-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort33', 'Общее место ведения разработок', '-', 'Клон (cftcl603)', 'Махмутов Альберт Адгамович, Фалелюхин Евгений Алексеевич', '(053)-8228', 'CFTBANK.DVP=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl603)))'),
(15, 'IBS03n', 'Y', '20-12-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort33', 'Схема разработки (искаженная) для оперативного разбора ошибок функционала 3-й линией, обновляется ежедневно', '-', 'Клон (cftcl606) v7000T', 'Махмутов Альберт Адгамович, Фалелюхин Евгений Алексеевич', '(053)-8228', 'CFTBANK.GARB3=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftgarb3n.ibso.ufa.usb)))'),
(16, 'IBS06', 'Y', '25-11-2019', 'CFT-BANK', 'Махмутов Альберт Адгамович', '(010)-4209', 'ibsort33', 'Схема разработки (искаженная), установка обновления 3-й линией, ведется как эталонная схема по функционалу', '-', 'Клон (cftcl601) v7000T', 'Галеев Эдуард Робертович', '(010)-4209', 'CFTBANK.TECH=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl601)))'),
(17, 'IBS10', 'Y', '25-11-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort33', 'Схема разработки  (искаженная) для ведения разработок 3-й линией', '-', 'Клон (cftcl607) v7000T связана линком с rtl.KGO2', 'Махмутов Альберт Адгамович, Фалелюхин Евгений Алексеевич', '(053)-8228', 'CFTBANK.GARB2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl607.ibso.ufa.usb)))'),
(18, 'IBS11', 'N', '16-12-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort33', 'Тестовая схема администраторов + тестирование установки накатов администраторами + функциональное тестирование Бергом', '-', 'Клон (cftcl602) v7000T', 'Галеев Эдуард Робертович', '(010)-4209', 'CFTBANK.ADMIN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl602.ibso.ufa.usb)))'),
(19, 'IBS15', 'N', '17-10-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort33', 'Схема тестирования СМЭВ 3 по ФССП', '-', 'Клон (cftcl600) v7000T (связана с rtl.report2)', 'Галеев Эдуард Робертович', '(053)-8208', 'CFTBANK.FIN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl600.ibso.ufa.usb)))'),
(20, 'IBS16', 'Y', '23-10-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort4', 'Учебная схема для корпоративного университета', '-', 'Клон (cftcl608) v7000T', 'Галеев Эдуард Робертович', '-', 'CFTBANK.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort4)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=cftsch.ibso.ufa.usb)))'),
(21, 'IBS17', 'N', '25-11-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort33', 'Тестовая среда с неискаженными данными', '-', 'Клон (cftcl604) v7000T Связана линком с rtl13', 'Галеев Эдуард Робертович', '(053)-8228', 'CFTBANK.JOIN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl604)))'),
(22, 'IBS18', 'N', '05-11-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort33', '-', '-', 'Тестирование МФСО Клон (cftcl609) v7000T', 'Галеев Эдуард Робертович', '(010)-4209', 'CFT.BIS=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl609.ibso.ufa.usb)))'),
(23, 'IBS21', 'N', '12-09-2018', 'CFT-BANK', 'Махмутов Альберт Адгамович', '(010)-4030', 'ibsort1', 'Схема разработки (искаженная)', '-', 'Клон (cftcl613) - v7000T  - схема разобрана 02/10', 'Махмутов Альберт Адгамович', '-', 'CFTBANK.GARB1=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=ufa-ds02cft)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=cftpr2.ibso.ufa.usb)))'),
(24, 'MPS01', 'N', '20-11-2018', 'WAY4', 'Паньков Анатолий Аркадьевич', '(010)-4424', 'ds06mps', 'Тестирование новой версии Way4', '-', 'Клон (mpscl801) v7000Ts', 'Паньков Анатолий Аркадьевич', '(010)-4424', 'MPS.TECH=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ds06mps_perm)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=mpstech.mps.ufa.usb)))'),
(25, 'MPS02', 'N', '18-10-2018', 'WAY4', 'Паньков Анатолий Аркадьевич', '(010)-4424', 'ds06mps', 'Копия для проектов', '-', 'Клон (mpscl802) v7000Ts', 'Киреев Ильшат', '(010)-4373', 'MPS02=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ds06mps_perm.fc.uralsibbank.ru)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=mpsep2.mps.ufa.usb)))'),
(26, 'MPS04', 'N', '07-09-2017', 'WAY4', 'Паньков Анатолий Аркадьевич', '(010)-4424', 'ds06mps', 'Копия для проектов', '-', 'Клон (mpscl804) v7000T', 'Киреев Ильшат', '(010)-4373', 'MPS04=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ds06mps_perm.fc.uralsibbank.ru)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=mps04.mps.ufa.usb)))'),
(27, 'OOD01', '-', '-', 'OOD', '-', '-', '-', '-', '-', 'Клон (oodcl300) V7000T', 'Лукьянов Игорь Михайлович', '(010)-4193', 'oodcl300=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ufads03sit.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=oodcl300.ood.ufa.usb)))'),
(28, 'RKO', 'N', '29-11-2019', 'CFT-BANK', 'Махмутов Альберт Адгамович', '(010)-4030', 'ibsort33', '-', '-', 'Клон (cftcl611) v7000T', 'Махмутов Альберт Адгамович', '(010)-4030', 'cftbank.RKO=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl611.ibso.ufa.usb)))'),
(29, 'RTL.PERF', 'N', '10-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort11', 'Парная схема для тестирования новой версии ЦФТ-Банк на схеме CFTBANK.PERF', '-', 'Клон (rtlcl210) v7000R связана линком с cftbank.perf', 'Бурханов Денис Фанилевич', '(010)-4351', 'RTL.PERF=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl210.rtl.ufa.usb)))'),
(30, 'RTL06', 'Y', '16-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort11', 'Схема разработки (Дополнительная)', '-', 'Клон (rtlcl212)', 'Бурханов Денис Фанилевич', '(010)-4042', 'RTL.TECH2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl212.rtl.ufa.usb)))'),
(31, 'RTL07', 'Y', '16-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort11', 'Схема оперативного устранения ошибок (проблем SD)', '-', 'Клон (rtlcl206) v7000R', 'Бурханов Денис Фанилевич', '(010)-4042', 'RTL.SD=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl206.rtl.ufa.usb)))'),
(32, 'RTL13', 'N', '16-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort11', 'Проектные работы, тестирование новой версии W4, в периоды паузы тестирование различных доработок', '-', 'Клон (rtlcl205) v7000R связана линком с cftbank.JOIN', 'Бурханов Денис Фанилевич', '(010)-4351', 'RTL13=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl205.rtl.ufa.usb)))'),
(33, 'RTL14', 'N', '01-10-2018', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort5', 'Схема разработки (проект универсальная электронная карта) Сейчас используется для Миграции БФА и БПБ', '-', 'Клон (rtlcl208) v7000R связана линком с cftbank.GARB1', 'Бурханов Денис Фанилевич', '(010)-4042', 'RTL.KGO1=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl208.rtl.ufa.usb)))'),
(34, 'RTL15', 'N', '02-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort5', 'Схема получения отчетов', '-', 'Клон (rtlcl201) v7000R', 'Бурханов Денис Фанилевич', '(010)-4351', 'RTL.REPORT=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl201.rtl.ufa.usb)))'),
(35, 'RTL16', 'N', '02-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort5', 'Проектные работы, тестирование новой версии W4, в периоды ненадобности, схема гасится', '-', 'Клон (rtlcl202) v7000R', 'Бурханов Денис Фанилевич', '(010)-4351', 'RTL.REPORT2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl202.rtl.ufa.usb)))'),
(36, 'RTL17', 'Y', '09-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort5', 'Схема разработки (Основная)', '-', 'Клон (rtlcl203) v7000R', 'Бурханов Денис Фанилевич', '(010)-4042', 'RTL.TEST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl203.rtl.ufa.usb)))'),
(37, 'RTL18', 'Y', '16-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort5', 'Схема разработки  (Проект Ромашка)', '-', 'Клон (rtlcl200) v7000R связана линком с cftbank.GARB2', 'Бурханов Денис Фанилевич', '(010)-4042', 'RTL.KGO2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl200.rtl.ufa.usb)))'),
(38, 'RTL19', 'N', '20-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort5', 'Схема проверки накатов (предпрод)', '-', 'Клон (rtlcl204) v7000R', 'Бурханов Денис Фанилевич', '(010)-4351', 'RTL.TEMP2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl204.rtl.ufa.usb)))'),
(39, 'RTL20', 'N', '13-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort5', 'Учебная схема для корпоративного университета', '-', 'Клон (rtlcl211) v7000R', 'Бурханов Денис Фанилевич', '(010)-4351', 'RTL.SCHOOL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl211.rtl.ufa.usb)))'),
(40, 'RTL24', 'Y', '16-12-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort3', 'Схема функционального тестирования', '-', 'Клон (rtlcl220) v7000R', 'Берг Эдуард Генрихович', '(053)-8300', 'RTL.REGRESS=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl220.rtl.ufa.usb)))'),
(41, 'RTL25', 'N', '18-10-2018', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort1', '-', '-', 'Клон (rtlcl209) v7000R', 'Бурханов Денис Фанилевич', '(010)-4042', 'RTL.PART=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl209.rtl.ufa.usb)))'),
(42, 'RTL26', 'Y', '02-08-2019', 'Ритейл', 'Бурханов Денис Фанилевич', '(010)-4351', 'ibsort1', 'Схема Габдуллина Станислава для проекта Siebel CRM. Используется внешним контрагентом.', '-', 'Клон (rtlcl207) v7000R', 'Бурханов Денис Фанилевич', '(010)-4042', 'RTL.CKK2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort11.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=rtlcl207.rtl.ufa.usb)))'),
(43, 'SLS', 'Y', '03-12-2019', 'CFT-BANK', 'Галеев Эдуард Робертович', '(010)-4209', 'ibsort33', 'Схема для задач тестирования конверсионных операций, типа 26338, 26339', '-', 'Клон (cftcl610) v7000T', 'Махмутов Альберт Адгамович', '(010)-4030', 'cftbank.SLS=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=ibsort33.fc.uralsibbank.ru)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=cftcl610)))'),
(44, 'mps03', 'y', '07-02-2019', 'WAY4', 'Паньков Анатолий Аркадьевич', '(010)-4424', 'ds06mps', '-', '-', 'Клон (mpscl803) v7000Ts', 'Паньков Анатолий Аркадьевич', 'ds06mps', 'MPS03=(DESCRIPTION=	(ADDRESS=(PROTOCOL=TCP)	(HOST=ds06mps.fc.uralsibbank.ru)	(PORT=1521)	)	(CONNECT_DATA=(SERVICE_NAME=mpscl803.mps.ufa.usb)))');

-- --------------------------------------------------------

--
-- Структура таблицы `db_net_tns`
--

CREATE TABLE `db_net_tns` (
  `id` int(4) NOT NULL,
  `SHEMA_NAME` varchar(128) NOT NULL,
  `SHEMA_TNS` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `db_net_tns`
--

INSERT INTO `db_net_tns` (`id`, `SHEMA_NAME`, `SHEMA_TNS`) VALUES
(1, 'AUTH_MSK.WORLD', 'AUTH_MSK.WORLD=(DESCRIPTION=(LOAD_BALANCE=OFF)(FAILOVER=ON)(CONNECT_TIMEOUT=1)(RETRY_COUNT=1)(SDU=32767)(TRANSPORT_CONNECT_TIMEOUT=1)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.6.129.8)(PORT=1517))(ADDRESS=(PROTOCOL=TCP)(HOST=10.6.129.7)(PORT=1517)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=PEGAS.URAN.K903.RUSOFT.INFO)))'),
(2, 'AUTH_UFA.WORLD', 'AUTH_UFA.WORLD=(DESCRIPTION=(LOAD_BALANCE=OFF)(FAILOVER=ON)(CONNECT_TIMEOUT=1)(RETRY_COUNT=1)(SDU=32767)(TRANSPORT_CONNECT_TIMEOUT=1)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.6.129.8)(PORT=1517))(ADDRESS=(PROTOCOL=TCP)(HOST=10.6.129.7)(PORT=1517)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=PEGAS.URAN.K903.RUSOFT.INFO)))'),
(3, 'BC2', 'BC2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=BC2)))'),
(4, 'BC', 'BC=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=BC)))'),
(5, 'BNK2FIL.WORLD', 'BNK2FIL.WORLD=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.67.1.190)(PORT=1521))(CONNECT_DATA=(SID=BNK2FIL)))'),
(6, 'BPB.BASE', 'BPB.BASE=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSOB.BPB.UFA.USB)))'),
(7, 'BPB.BASESB', 'BPB.BASESB=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.3.64.11)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO.BASE.BPB.USB)))'),
(8, 'BPB.RTL', 'BPB.RTL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=BPBRTL.BPB.UFA.USB)))'),
(9, 'BPB.SCHOOL', 'BPB.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.3.64.11)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.BPB.USB)))'),
(10, 'BPBRTLSTBY', 'BPBRTLSTBY=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.3.64.111)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=BPBRTL.BASHPROM.UFA.USB)))'),
(11, 'BSFRAUD', 'BSFRAUD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=BSFRAUD)))'),
(12, 'BSSMSK', 'BSSMSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-DS02DUB.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=BSSSTBY)))'),
(13, 'BSSTBY', 'BSSTBY=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-DS01DUB.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=BSSMSK)))'),
(14, 'BSSTCOPY', 'BSSTCOPY=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=BSSTCOPY)))'),
(15, 'CB.PROD', 'CB.PROD=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=CB.WORK))(ADDRESS=(HOST=MSK-DS01CRIF.FC.URALSIBBANK.RU)(PORT=1521)(PROTOCOL=TCP)))'),
(16, 'CDW.WORK', 'CDW.WORK=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=E20DB01.FC.URALSIBBANK.RU)(PORT=1531))(ADDRESS=(PROTOCOL=TCP)(HOST=E30DB01.FC.URALSIBBANK.RU)(PORT=1531)))(CONNECT_DATA=(SERVICE_NAME=CDW.WORK)))'),
(17, 'CDWCI', 'CDWCI=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=E20DBADM02.FC.URALSIBBANK.RU)(PORT=1535))(ADDRESS=(PROTOCOL=TCP)(HOST=10.158.76.82)(PORT=1536)))(CONNECT_DATA=(SERVICE_NAME=CDWCI2)))'),
(18, 'CDWDEV.TEST', 'CDWDEV.TEST=(DESCRIPTION_LIST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=E20DB02.FC.URALSIBBANK.RU)(PORT=1536))(CONNECT_DATA=(SERVICE_NAME=CDWDEV.TEST))))'),
(19, 'CDWH.DEV', 'CDWH.DEV=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=E20DB02)(PORT=1536))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=CDWDEV.TEST)))'),
(20, 'CDWPP.TEST', 'CDWPP.TEST=(DESCRIPTION_LIST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=CDWPP.FC.URALSIBBANK.RU)(PORT=1532))(CONNECT_DATA=(SERVICE_NAME=CDWPP.TEST))))'),
(21, 'CDWUAT', 'CDWUAT=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=E20DBADM02.FC.URALSIBBANK.RU)(PORT=1535))(ADDRESS=(PROTOCOL=TCP)(HOST=10.158.76.82)(PORT=1534)))(CONNECT_DATA=(SERVICE_NAME=CDWUAT)))'),
(22, 'CFT.BIS', 'CFT.BIS=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL609.IBSO.UFA.USB)))'),
(23, 'CFT.FIN2', 'CFT.FIN2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=CFTCL704.IBSO.UFA.USB)))'),
(24, 'CFT.MSKFIN', 'CFT.MSKFIN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=MSKFIN.IBSO.UFA.USB)))'),
(25, 'CFT.SCHOOL', 'CFT.SCHOOL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL608.IBSO.UFA.USB)))'),
(26, 'CFT.ST', 'CFT.ST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT1.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=CFT11.IBSO.UFA.USB)))'),
(27, 'CFT11', 'CFT11=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB02.FC.URALSIBBANK.RU)(PORT=1561)))(CONNECT_DATA=(SERVICE_NAME=CFT11.IBSO.UFA.USB)))'),
(28, 'CFT139', 'CFT139=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=CFTCL701.IBSO.UFA.USB)))'),
(29, 'CFTBANK.BASE', 'CFTBANK.BASE=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB.FC.URALSIBBANK.RU)(PORT=1561)))(CONNECT_DATA=(SERVICE_NAME=CFTVIP.IBSO.UFA.USB)))'),
(30, 'CFTBANK.DUMP2', 'CFTBANK.DUMP2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.69.23)(PORT=1561))(CONNECT_DATA=(SERVICE_NAME=CFTDUMP2.IBSO.UFA.USB)))'),
(31, 'CFTBANK.DUMP', 'CFTBANK.DUMP=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT1.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=IBSO141.IBSO.UFA.USB)))'),
(32, 'CFTBANK.DVP', 'CFTBANK.DVP=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL603)))'),
(33, 'CFTBANK.EL_BASE', 'CFTBANK.EL_BASE=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP2.FC.URALSIBBANK.RU)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=ELBASE)))'),
(34, 'CFTBANK.EL_DVP', 'CFTBANK.EL_DVP=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1791)))(CONNECT_DATA=(SERVICE_NAME=ELDVP)))'),
(35, 'CFTBANK.FIN2', 'CFTBANK.FIN2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL611.IBSO.UFA.USB)))'),
(36, 'CFTBANK.FIN', 'CFTBANK.FIN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL600.IBSO.UFA.USB)))'),
(37, 'CFTBANK.GARB2', 'CFTBANK.GARB2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=CFTCL607.IBSO.UFA.USB)))'),
(38, 'CFTBANK.GARB3', 'CFTBANK.GARB3=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=CFTGARB3N.IBSO.UFA.USB)))'),
(39, 'CFTBANK.GARB', 'CFTBANK.GARB=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB02.FC.URALSIBBANK.RU)(PORT=1561)))(CONNECT_DATA=(SERVICE_NAME=CFTGARB.IBSO.UFA.USB)))'),
(40, 'CFTBANK.INKAS', 'CFTBANK.INKAS=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791)))(CONNECT_DATA=(SERVICE_NAME=INK133.IBSO.UFA.USB)))'),
(41, 'CFTBANK.JOIN', 'CFTBANK.JOIN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL604.IBSO.UFA.USB)))'),
(42, 'CFTBANK.PERF', 'CFTBANK.PERF=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL605)))'),
(43, 'CFTBANK.RESERV1', 'CFTBANK.RESERV1=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1561)))(CONNECT_DATA=(SERVICE_NAME=CFTVIP.IBSO.UFA.USB)))'),
(44, 'CFTBANK.RESERV2', 'CFTBANK.RESERV2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB02.FC.URALSIBBANK.RU)(PORT=1561)))(CONNECT_DATA=(SERVICE_NAME=CFTVIP.IBSO.UFA.USB)))'),
(45, 'CFTBANK.RESERV', 'CFTBANK.RESERV=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1561)))(CONNECT_DATA=(SERVICE_NAME=COPY2.IBSO.UFA.USB)))'),
(46, 'CFTBANK.RKO', 'CFTBANK.RKO=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL611)))'),
(47, 'CFTBANK.SCHOOL2', 'CFTBANK.SCHOOL2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791)))(CONNECT_DATA=(SERVICE_NAME=CFTSCH2.IBSO.UFA.USB)))'),
(48, 'CFTBANK.SCHOOL_MSK', 'CFTBANK.SCHOOL_MSK=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=CFTCL608)))'),
(49, 'CFTBANK.SLS', 'CFTBANK.SLS=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL610.IBSO.UFA.USB)))'),
(50, 'CFTBANK.STAT', 'CFTBANK.STAT=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB02.FC.URALSIBBANK.RU)(PORT=1561)))(CONNECT_DATA=(SERVICE_NAME=CFTSTAT.IBSO.UFA.USB)))'),
(51, 'CFTBANK.STBY', 'CFTBANK.STBY=(DESCRIPTION=(TRANSPORT_CONNECT_TIMEOUT=1)(CONNECT_TIMEOUT=2)(RETRY_COUNT=2)(ADDRESS_LIST=(FAILOVER=ON)(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB02.FC.URALSIBBANK.RU)(PORT=1561))(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1561)))(CONNECT_DATA=(SERVICE_NAME=CFTSTBY.IBSO.UFA.USB)))'),
(52, 'CFTBANK.TECH', 'CFTBANK.TECH=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT22.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=CFTCL601)))'),
(53, 'CFTBANK.TEST102', 'CFTBANK.TEST102=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=CFT102.IBSO.UFA.USB)))'),
(54, 'CFTBANK.TEST104', 'CFTBANK.TEST104=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=CFT104.IBSO.UFA.USB)))'),
(55, 'CFTBANK.TEST11_13', 'CFTBANK.TEST11_13=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=IBSCL3.IBSO.UFA.USB)))'),
(56, 'CFTBANK.TEST11_2', 'CFTBANK.TEST11_2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=IBSCL1.IBSO.UFA.USB)))'),
(57, 'CFTBANK_ELDVP2', 'CFTBANK_ELDVP2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT4.FC.URALSIBBANK.RU)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=CFTELDB)))'),
(58, 'CFTBANK_EL_ARCH', 'CFTBANK_EL_ARCH=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS01EARCH)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=CFTEL.PROD.MSK.USB)))'),
(59, 'CFTFSSP1', 'CFTFSSP1=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS03FSSP)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=CFTFSSP.PROD.MSK.USB)))'),
(60, 'CHBO.PROD', 'CHBO.PROD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=CHBO.DB.URALSIBBANK.RU)(PORT=2002))(ADDRESS=(PROTOCOL=TCP)(HOST=CHBOSB.DB.URALSIBBANK.RU)(PORT=2002)))(CONNECT_DATA=(SERVICE_NAME=CHBO.PROD)))'),
(61, 'CHEL.SCHOOL', 'CHEL.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=CHL-ORA3SUSE)(PORT=1521)))(CONNECT_DATA=(SID=IBSO3)))'),
(62, 'CHL.DOR', 'CHL.DOR=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.10)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSOD.CHL.UFA.USB)))'),
(63, 'CKK.PROD_NEW', 'CKK.PROD_NEW=(DESCRIPTION=(TRANSPORT_CONNECT_TIMEOUT=1)(CONNECT_TIMEOUT=1)(RETRY_COUNT=2)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFADS08SI.FC.URALSIBBANK.RU)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=UFADS09SI.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=CKK.PROD.UFA.USB)))'),
(64, 'CRIF.MIGR', 'CRIF.MIGR=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=CRIF.PROD))(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=CRIFSB.DB.URALSIBBANK.RU)(PORT=1525))(ADDRESS=(PROTOCOL=TCP)(HOST=BG82.FC.URALSIBBANK.RU)(PORT=1525))))'),
(65, 'CRIF.MIGR_STBY', 'CRIF.MIGR_STBY=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=BG31.DB.URALSIBBANK.RU)(PORT=1525))(ADDRESS=(PROTOCOL=TCP)(HOST=BG21.DB.URALSIBBANK.RU)(PORT=1525)))(CONNECT_DATA=(SERVICE_NAME=CRIF_PR.DB.URALSIBBANK.RU)))'),
(66, 'CVM2.PROD', 'CVM2.PROD=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=CVM2.WORK))(ADDRESS_LIST=(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=CVM2.DB.URALSIBBANK.RU)(PORT=2072))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=CVM2SB.DB.URALSIBBANK.RU)(PORT=2072))))'),
(67, 'DBO.BPB', 'DBO.BPB=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.10)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=DBOBPB.UFA.USB)))'),
(68, 'DBO2CL104', 'DBO2CL104=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-DS01DBO2T.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=DBO2CL104)))'),
(69, 'DBSCL.WORLD', 'DBSCL.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS02SVK.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=WORKNT)))'),
(70, 'DSED.TEST', 'DSED.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=DSED.TEST))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=DSED.DB.URALSIBBANK.RU)(PORT=2114)))'),
(71, 'EBMIG2', 'EBMIG2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINTEST.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=EBMIG2)))'),
(72, 'EBTEST', 'EBTEST=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINTEST.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=EBTEST)))'),
(73, 'EDU', 'EDU=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINEDU.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=FINEDU)))'),
(74, 'EKT2', 'EKT2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1622)))(CONNECT_DATA=(SERVICE_NAME=EKT2)))'),
(75, 'EKTR.SVX', 'EKTR.SVX=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO24.SVX.UFA.USB)))'),
(76, 'ELDVP', 'ELDVP=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=ELDVP)))'),
(77, 'FINARCH', 'FINARCH=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCCOREDB01.FC.URALSIBBANK.RU)(PORT=1530)))(CONNECT_DATA=(SERVICE_NAME=FINARCH)))'),
(78, 'FINDB', 'FINDB=(DESCRIPTION=(ADDRESS_LIST=(LOAD_BALANCE=ON)(FAILOVER=ON)(ADDRESS=(PROTOCOL=TCP)(HOST=DCCOREDB04.FC.URALSIBBANK.RU)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=DCCOREDB03.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=FINDB_PROD)(FAILOVER_MODE=(TYPE=SESSION)(METHOD=BASIC)(RETRIES=20)(DELAY=5))))'),
(79, 'FINHELL', 'FINHELL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINALFA.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=FINHELL)))'),
(80, 'FINMIG2', 'FINMIG2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINTEST.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=FINMIG2)))'),
(81, 'FINMIG', 'FINMIG=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINTECH.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=FINMIG)))'),
(82, 'FINTECH', 'FINTECH=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINTECH.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=FINTECH)))'),
(83, 'FINTEST2', 'FINTEST2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINTEST.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=FINTEST2)))'),
(84, 'FINTESTTR', 'FINTESTTR=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCFINTEST.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=TRTEST67)))'),
(85, 'HOTCOPY.WORLD', 'HOTCOPY.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS06MPS_PERM.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=HOTCOPY.MPS.UFA.USB)))'),
(86, 'IBSO.ARKH', 'IBSO.ARKH=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO54.ARH.UFA.USB)))'),
(87, 'IBSO.ASTR', 'IBSO.ASTR=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO29.ASF.UFA.USB)))'),
(88, 'IBSO.BRNL', 'IBSO.BRNL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=IBSO34.BNL.UFA.USB)))'),
(89, 'IBSO.CHEL', 'IBSO.CHEL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO85.CHL.UFA.USB)))'),
(90, 'IBSO.DVP', 'IBSO.DVP=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1522))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=IBSODVP.SCHOOL.STMK.USB)))'),
(91, 'IBSO.EKT', 'IBSO.EKT=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1622)))(CONNECT_DATA=(SERVICE_NAME=EKT)))'),
(92, 'IBSO.GARB', 'IBSO.GARB=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=OSBI.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO.GARB.IBSO.HQ.USB)))'),
(93, 'IBSO.GO', 'IBSO.GO=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1522)))(CONNECT_DATA=(SERVICE_NAME=IBSOGO)))'),
(94, 'IBSO.IRKS', 'IBSO.IRKS=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO73.IKT.UFA.USB)))'),
(95, 'IBSO.IZHEVSK', 'IBSO.IZHEVSK=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO65.IJK.UFA.USB)))'),
(96, 'IBSO.KEMER', 'IBSO.KEMER=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.10)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO74.KEJ.UFA.USB)))'),
(97, 'IBSO.KLNG', 'IBSO.KLNG=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=SWBBNK.SWBBNK.UFA.USB)))'),
(98, 'IBSO.KURGAN', 'IBSO.KURGAN=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO95.KRO.UFA.USB)))'),
(99, 'IBSO.NNOVG', 'IBSO.NNOVG=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.10)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO16.NNV.UFA.USB)))'),
(100, 'IBSO.NVART', 'IBSO.NVART=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO53.NJC.UFA.USB)))'),
(101, 'IBSO.PERM', 'IBSO.PERM=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO52.PEE.UFA.USB)))'),
(102, 'IBSO.PIT', 'IBSO.PIT=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO22.SPB.UFA.USB)))'),
(103, 'IBSO.PTRZ', 'IBSO.PTRZ=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO15.PTZ.UFA.USB)))'),
(104, 'IBSO.SARATOV', 'IBSO.SARATOV=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO45.RTW.UFA.USB)))'),
(105, 'IBSO.SCHL2', 'IBSO.SCHL2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSOSCHOOL.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSSCHL2.DWH.HQ.USB)))'),
(106, 'IBSO.SCHOOL', 'IBSO.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.3.64.11)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.BPB.USB)))'),
(107, 'IBSO.SCHOOLST', 'IBSO.SCHOOLST=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=LNXSTSTMK)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.STMK.USB)(SERVER=DEDICATED)))'),
(108, 'IBSO.STM', 'IBSO.STM=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1522))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=IBSS.SCHOOL.STMK.USB)))'),
(109, 'IBSO.STMK', 'IBSO.STMK=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO42.STM.UFA.USB)(SERVER=DEDICATED)))'),
(110, 'IBSO.SURGUT', 'IBSO.SURGUT=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=IBSO35.SGC.UFA.USB)))'),
(111, 'IBSO.SVX', 'IBSO.SVX=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=LNXEKTR)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=IBSO.BASE.EKTR.USB)))'),
(112, 'IBSO.TECH', 'IBSO.TECH=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1522))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=IBSOTECH.SCHOOL.STMK.USB)))'),
(113, 'IBSO.TEST', 'IBSO.TEST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.39.3.69)(PORT=1521))(CONNECT_DATA=(SID=WOLF)))'),
(114, 'IBSO.TOMSK', 'IBSO.TOMSK=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO23.TOF.UFA.USB)))'),
(115, 'IBSO.TULA', 'IBSO.TULA=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO41.TLA.UFA.USB)))'),
(116, 'IBSO.TYUMEN', 'IBSO.TYUMEN=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=IBSO63.TJM.UFA.USB)))'),
(117, 'IBSO.VOLG', 'IBSO.VOLG=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO31.VOG.UFA.USB)))'),
(118, 'IBSO24.BASE', 'IBSO24.BASE=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1522)))(CONNECT_DATA=(SERVICE_NAME=IBSO24.IBSO.UFA.USB)))'),
(119, 'IBSOB.SCHOOL', 'IBSOB.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.3.64.11)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.BPB.USB)))'),
(120, 'IBSOD.ETAL', 'IBSOD.ETAL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=IBSDISTR)))'),
(121, 'IBSOD.TEST', 'IBSOD.TEST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=IBSODTST)))'),
(122, 'IBSODI.TEMP', 'IBSODI.TEMP=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1564)))(CONNECT_DATA=(SERVICE_NAME=IBSODI.TEST.UFA.USB)))'),
(123, 'IBSODI12.TEMP', 'IBSODI12.TEMP=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1564))(CONNECT_DATA=(SERVICE_NAME=IBSODI12.TEST.UFA.USB)))'),
(124, 'IBSODI15.TEMP', 'IBSODI15.TEMP=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1564))(CONNECT_DATA=(SERVICE_NAME=IBSODI15.TEST.UFA.USB)))'),
(125, 'IBSODI2.TEMP', 'IBSODI2.TEMP=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1564)))(CONNECT_DATA=(SERVICE_NAME=IBSODI2.TEST.UFA.USB)))'),
(126, 'IBSODI3.TEMP', 'IBSODI3.TEMP=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1564)))(CONNECT_DATA=(SERVICE_NAME=IBSODI3.TEST.UFA.USB)))'),
(127, 'IBSODI4.TEMP', 'IBSODI4.TEMP=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DCIBSODB01.FC.URALSIBBANK.RU)(PORT=1564)))(CONNECT_DATA=(SERVICE_NAME=IBSODI4.TEST.UFA.USB)))'),
(128, 'IBSODNEW.SCHOOL', 'IBSODNEW.SCHOOL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=OSBI)(PORT=1677))(CONNECT_DATA=(SERVICE_NAME=IBSODSCH)))'),
(129, 'IBSOEKT.SCHOOL', 'IBSOEKT.SCHOOL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=LNXEKTR)(PORT=1521))(CONNECT_DATA=(SID=SCHOOL)))'),
(130, 'IBSOTEST.BASE', 'IBSOTEST.BASE=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.39.3.69)(PORT=1521))(CONNECT_DATA=(SID=WOLF)))'),
(131, 'IRK.SCHOOL', 'IRK.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.34.0.110)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.IRKS.USB)))'),
(132, 'IZHEVSK.SCHOOL', 'IZHEVSK.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.65.1.12)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=TEST)))'),
(133, 'KHV.BASE', 'KHV.BASE=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO56.KHV.UFA.USB)))'),
(134, 'KHV.SCHOOL', 'KHV.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.86.0.25)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.KHV.USB)))'),
(135, 'KIT.PROD', 'KIT.PROD=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=KIT.PROD))(ADDRESS=(HOST=KIT.DB.URALSIBBANK.RU)(PORT=2112)(PROTOCOL=TCP)))'),
(136, 'LANDOCS2.WORLD', 'LANDOCS2.WORLD=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=EDM.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SID=LANDOCS2)))'),
(137, 'MCHBO.TEST', 'MCHBO.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=MCHBO.TEST))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=MCHBO.DB.URALSIBBANK.RU)(PORT=3005)))'),
(138, 'MFR.STMK', 'MFR.STMK=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=BSSDB-STMK)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=MFR.STMK.USB)(SERVER=DEDICATED)))'),
(139, 'MPS.EFS', 'MPS.EFS=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS02MPS_PERM)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=MPSEFS.MPS.UFA.USB)))'),
(140, 'MPS.HSK', 'MPS.HSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS06MPS_PERM)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPS01)))'),
(141, 'MPS.TECH2', 'MPS.TECH2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS06MPS_PERM.FC.URALSIBBANK.RU)(PORT=1621)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=MPSTECH2.MPS.UFA.USB)))'),
(142, 'MPS.UPGR', 'MPS.UPGR=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS04MPS.UFA.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=MPSUPGR.MPS.UFA.USB)))'),
(143, 'MPS.X86', 'MPS.X86=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS08MPS)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=MPSPR2)))'),
(144, 'MPS01', 'MPS01=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS09MPS)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPSCL801)))'),
(145, 'MPS01MSK', 'MPS01MSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS10MPS)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPSCL801)))'),
(146, 'MPS02', 'MPS02=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS09MPS)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=MPSCL802)))'),
(147, 'MPS02MSK', 'MPS02MSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS10MPS)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPSCL802)))'),
(148, 'MPS03', 'MPS03=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS09MPS.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPS03.MPS.UFA.USB)))'),
(149, 'MPS03CL', 'MPS03CL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS09MPS)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=MPSCL803)))'),
(150, 'MPS03MSK', 'MPS03MSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS10MPS.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPS03)))'),
(151, 'MPS04', 'MPS04=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS09MPS.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPS04.MPS.UFA.USB)))'),
(152, 'MPS05', 'MPS05=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS06MPS.FC.URALSIBBANK.RU)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=MPS05.MPS.UFA.USB)))'),
(153, 'MPS06', 'MPS06=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS06MPS.FC.URALSIBBANK.RU)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=MPS06.MPS.UFA.USB)))'),
(154, 'MPS70002', 'MPS70002=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT1.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPS70002.MPS.UFA.USB)))'),
(155, 'MPS7000', 'MPS7000=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS01MPS_PERM.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPS7000.MPS.UFA.USB)))'),
(156, 'MPSGARB.WORLD', 'MPSGARB.WORLD=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS06MPS_PERM.FC.URALSIBBANK.RU)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=MPSTECH.MPS.UFA.USB)))'),
(157, 'MPSMIGFM', 'MPSMIGFM=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS03MPS1)(PORT=1621))(ADDRESS=(PROTOCOL=TCP)(HOST=DSMPSOLD)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=MPSMIGFM.MPS.UFA.USB)))'),
(158, 'MPSMSK', 'MPSMSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DSMPS)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=MPS.PROD.MSK.USB)))'),
(159, 'MPSMSK_BAL', 'MPSMSK_BAL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.166.137.130)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=MPSPR3)))'),
(160, 'MPSPROD_11', 'MPSPROD_11=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS04MPS)(PORT=1921)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=MPSUPGR.MPS.UFA.USB)))'),
(161, 'MPSPRT1_SHARED', 'MPSPRT1_SHARED=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.137.183)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=MPSPRT1.MPS.UFA.USB)))'),
(162, 'MPSSTBY', 'MPSSTBY=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS04MPS1.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=MPSSTBY.MPS.UFA.USB)))'),
(163, 'MPSX86.STBY', 'MPSX86.STBY=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DS07MPS)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=MPSSTBY.MPS.UFA.USB)))'),
(164, 'MSK.GARB', 'MSK.GARB=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=MSKGARB)))'),
(165, 'MSK.TMC', 'MSK.TMC=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1522)))(CONNECT_DATA=(SERVICE_NAME=MSKTMC)))'),
(166, 'MSK.TMCTT', 'MSK.TMCTT=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1522)))(CONNECT_DATA=(SERVICE_NAME=MSKTMCTT)))'),
(167, 'MSKBIO', 'MSKBIO=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS02BIO.FC.URALSIBBANK.RU)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS01BIO.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=BMDB.WORK)))'),
(168, 'NNOV.SCHOOL', 'NNOV.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.37.3.11)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.NNVG.USB)))'),
(169, 'NNOV.SCHOOL', 'NNOV.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=LNXSTNNVG)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.NNVG.USB)))'),
(170, 'NOVA', 'NOVA=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO32.OVB.UFA.USB)))'),
(171, 'NOVOSIB.SCHOOL', 'NOVOSIB.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.39.3.69)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=WOLF)))'),
(172, 'NVSB.RETA', 'NVSB.RETA=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RET.OVB.UFA.USB)))'),
(173, 'O9.WORLD', 'O9.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=10.10.67.27)(PORT=1521))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=10.10.67.27)(PORT=1526)))(CONNECT_DATA=(SID=ORCL)))'),
(174, 'ORA01BM', 'ORA01BM=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DBSPIS.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=SPIS.PROD.MSK.USB)))'),
(175, 'ORA_CROWN.WORLD', 'ORA_CROWN.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=10.55.64.51)(PORT=1521))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=10.55.64.51)(PORT=1526)))(CONNECT_DATA=(SID=CROWN)))'),
(176, 'ORCL.WORLD.STBY', 'ORCL.WORLD.STBY=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS04MPS1.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=MPSPROD.MPS.UFA.USB)))'),
(177, 'ORCL.WORLD', 'ORCL.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS03MPS1.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=MPSPROD.MPS.UFA.USB)))'),
(178, 'PBWDEV.TEST', 'PBWDEV.TEST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=BG82.FC.URALSIBBANK.RU)(PORT=1525))(CONNECT_DATA=(SERVICE_NAME=PBWDEV.TEST)))'),
(179, 'PBW_NEW2.WORLD', 'PBW_NEW2.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=BG81.FC.URALSIBBANK.RU)(PORT=1525)))(CONNECT_DATA=(SERVICE_NAME=PBW.DB.URALSIBBANK.RU)))'),
(180, 'PERM.SCHOOL', 'PERM.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.64.0.115)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.PERM.USB)))'),
(181, 'PERM2', 'PERM2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1522)))(CONNECT_DATA=(SERVICE_NAME=IBSO.IBSO.BASE.PERM.USB)))'),
(182, 'PROG_MIR.WORLD', 'PROG_MIR.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MIR.DB.URALSIBBANK.RU)(PORT=2018))(ADDRESS=(PROTOCOL=TCP)(HOST=MIRSB.DB.URALSIBBANK.RU)(PORT=2018)))(CONNECT_DATA=(SERVICE_NAME=MIR.PROD)))'),
(183, 'PROM.OODPROD', 'PROM.OODPROD=(DESCRIPTION=(TRANSPORT_CONNECT_TIMEOUT=1)(CONNECT_TIMEOUT=2)(RETRY_COUNT=2)(ADDRESS_LIST=(FAILOVER=ON)(ADDRESS=(PROTOCOL=TCP)(HOST=UFADS04SI.FC.URALSIBBANK.RU)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=UFADS05SI.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=OODPROD)))'),
(184, 'RBB_REPORT', 'RBB_REPORT=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-DS01RR.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=OLAP1)))'),
(185, 'RBB_REPORT_2', 'RBB_REPORT_2=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-DS02RR.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=OLAP2)))'),
(186, 'REPORT_NEW11', 'REPORT_NEW11=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORSTB5.FC.URALSIBBANK.RU)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=REPORT_NEW.RTL.UFA.USB)))'),
(187, 'RTL.1310', 'RTL.1310=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTL1310.RTL.UFA.USB)))'),
(188, 'RTL.AUD15', 'RTL.AUD15=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=RTLAUD15)))'),
(189, 'RTL.AUD', 'RTL.AUD=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLAUD)))'),
(190, 'RTL.BFT', 'RTL.BFT=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=RTLCL813.RTL.UFA.USB)))'),
(191, 'RTL.BFT', 'RTL.BFT=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=RTLCL813.RTL.UFA.USB)))'),
(192, 'RTL.CFT3', 'RTL.CFT3=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLCFT3.RTL.UFA.USB)))'),
(193, 'RTL.CKK2', 'RTL.CKK2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL207.RTL.UFA.USB)))'),
(194, 'RTL.CKK2NEW', 'RTL.CKK2NEW=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL207.RTL.UFA.USB)))'),
(195, 'RTL.CKK2_MSK', 'RTL.CKK2_MSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL207.RTL.UFA.USB)))'),
(196, 'RTL.CKK2_NEW', 'RTL.CKK2_NEW=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL207.RTL.UFA.USB)))'),
(197, 'RTL.DVP11', 'RTL.DVP11=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=RTLDVP2.DVP.RTL.HQ.USB)))'),
(198, 'RTL.ECATCRED', 'RTL.ECATCRED=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTL.ECATCRED.RTL.UFA.USB)))'),
(199, 'RTL.EP3', 'RTL.EP3=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=RTLSTBSVC.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLEP3.RTL.UFA.USB)))'),
(200, 'RTL.FIN1', 'RTL.FIN1=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT1.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLCL730.RTL.UFA.USB)))'),
(201, 'RTL.FIN3', 'RTL.FIN3=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT1.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL731.RTL.UFA.USB)))'),
(202, 'RTL.KGO1', 'RTL.KGO1=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT5.FC.URALSIBBANK.RU)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=RTLCL208.RTL.UFA.USB)))'),
(203, 'RTL.KGO2', 'RTL.KGO2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL200.RTL.UFA.USB)))'),
(204, 'RTL.KLNG', 'RTL.KLNG=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=SWBRTBNK.SWBRTBNK.UFA.USB)))'),
(205, 'RTL.MSK1', 'RTL.MSK1=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=RTLSTBSVC.UFA.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLTECH.RTL.UFA.USB)))'),
(206, 'RTL.PART', 'RTL.PART=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT1.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL209.RTL.UFA.USB)))'),
(207, 'RTL.PERF', 'RTL.PERF=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL210.RTL.UFA.USB)))'),
(208, 'RTL.REGRESS', 'RTL.REGRESS=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL220.RTL.UFA.USB)))'),
(209, 'RTL.REPORT2', 'RTL.REPORT2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL202.RTL.UFA.USB)))'),
(210, 'RTL.REPORT', 'RTL.REPORT=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL201.RTL.UFA.USB)))'),
(211, 'RTL.REPORT', 'RTL.REPORT=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL201.RTL.UFA.USB)))'),
(212, 'RTL.REPORT_MSK', 'RTL.REPORT_MSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL201.RTL.UFA.USB)))'),
(213, 'RTL.SCHOOL', 'RTL.SCHOOL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL211.RTL.UFA.USB)))'),
(214, 'RTL.SCHOOL', 'RTL.SCHOOL=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL211.RTL.UFA.USB)))'),
(215, 'RTL.SD', 'RTL.SD=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL206.RTL.UFA.USB)))'),
(216, 'RTL.ST', 'RTL.ST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=RTLCL810.RTL.UFA.USB)))'),
(217, 'RTL.TECH2', 'RTL.TECH2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL212.RTL.UFA.USB)))'),
(218, 'RTL.TECH4', 'RTL.TECH4=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLTECH4.RTL.UFA.USB)))'),
(219, 'RTL.TECH5', 'RTL.TECH5=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=RTLSTBSVC.UFA.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLTECH5.RTL.UFA.USB)))'),
(220, 'RTL.TECH6', 'RTL.TECH6=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLTECH6.RTL.UFA.USB)))'),
(221, 'RTL.TEMP2', 'RTL.TEMP2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL204.RTL.UFA.USB)))'),
(222, 'RTL.TEMP2_MSK', 'RTL.TEMP2_MSK=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL204.RTL.UFA.USB)))'),
(223, 'RTL.TEMP', 'RTL.TEMP=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLTEMP.RTL.UFA.USB)))'),
(224, 'RTL.TEST2', 'RTL.TEST2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSODBSTB6.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=RTLTEST.RTL.UFA.USB)))'),
(225, 'RTL.TEST', 'RTL.TEST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL203.RTL.UFA.USB)))'),
(226, 'RTL.TEST_SECURE', 'RTL.TEST_SECURE=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL203.RTL.UFA.USB)))'),
(227, 'RTL.UEC', 'RTL.UEC=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL208.RTL.UFA.USB)))'),
(228, 'RTL.WORLD', 'RTL.WORLD=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.67.1.209)(PORT=1521))(CONNECT_DATA=(SID=SWBRTBNK)))'),
(229, 'RTL12', 'RTL12=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT5.FC.URALSIBBANK.RU)(PORT=1621))(CONNECT_DATA=(SERVICE_NAME=RTLCL707.RTL.UFA.USB)))'),
(230, 'RTL13', 'RTL13=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT11.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLCL205.RTL.UFA.USB)))'),
(231, 'RTL22', 'RTL22=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1791))(CONNECT_DATA=(SERVICE_NAME=RTLCL813.RTL.UFA.USB)))'),
(232, 'RTL3.TEMP', 'RTL3.TEMP=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=RTLSTBSVC.UFA.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTL3TEMP.RTL.UFA.USB)))'),
(233, 'RTL40.BASE', 'RTL40.BASE=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DCRTLDB.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLVIP.RTL.UFA.USB)))'),
(234, 'RTL40.RBS', 'RTL40.RBS=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLRBS.RTL.UFA.USB)))'),
(235, 'RTL40.RESERV1', 'RTL40.RESERV1=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=RTLSVC.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLVIP.RTL.UFA.USB)))'),
(236, 'RTL40.RESERV2', 'RTL40.RESERV2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=RTLSTBSVC.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLVIP.RTL.UFA.USB)))'),
(237, 'RTL40.RPT', 'RTL40.RPT=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTL40RPT.RTL.UFA.USB)))'),
(238, 'RTL40.STBY', 'RTL40.STBY=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS01RTL)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLPR4.RTL.MSK.USB)))'),
(239, 'RTL40.TECH2', 'RTL40.TECH2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=RTLTECH2.RTL.UFA.USB)))'),
(240, 'RTL40.TECH3', 'RTL40.TECH3=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLTECH3.RTL.UFA.USB)))'),
(241, 'RTL40.TECH', 'RTL40.TECH=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSORT2.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLTECH.RTL.UFA.USB)))'),
(242, 'RTL40', 'RTL40=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=1)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTL40.BASE)))'),
(243, 'RTLB.SCHOOL', 'RTLB.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.3.64.111)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=BPBTEST.BASHPROM.UFA.USB)))'),
(244, 'RTLPR2_BAL', 'RTLPR2_BAL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.166.66.10)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=RTLPR2.RTL.MSK.USB)))'),
(245, 'RTLTEST', 'RTLTEST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=IBSODBSTB6.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=RTLTEST.RTL.UFA.USB)))'),
(246, 'SAMARA.BASE', 'SAMARA.BASE=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO75.KUF.UFA.USB)))'),
(247, 'SAMARA.SCHOOL', 'SAMARA.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=LNXSTSMR)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO.SCHOOL.SAMR.USB)))'),
(248, 'SANDBOX', 'SANDBOX=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS01DWH.FC.URALSIBBANK.RU)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=MSK-DS02DWH.FC.URALSIBBANK.RU)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=SANDBOX.PROD.MSK.USB)))'),
(249, 'SCHOOL.IBSO1', 'SCHOOL.IBSO1=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1622)))(CONNECT_DATA=(SERVICE_NAME=SCHOOL)))'),
(250, 'SCHOOL.IBSO2', 'SCHOOL.IBSO2=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.11.30.12)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.OPAB.USB)))'),
(251, 'SCHOOL.IBSO3', 'SCHOOL.IBSO3=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.STMK.USB)(SERVER=DEDICATED)))'),
(252, 'SCHOOL.KLNG', 'SCHOOL.KLNG=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.67.1.209)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=SWBBNK)))'),
(253, 'SCHOOL.STMK', 'SCHOOL.STMK=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=LNXSTSTMK)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.STMK.USB)(SERVER=DEDICATED)))'),
(254, 'SED.PROD', 'SED.PROD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=EDS.DB.URALSIBBANK.RU)(PORT=2004))(ADDRESS=(PROTOCOL=TCP)(HOST=EDSSB.DB.URALSIBBANK.RU)(PORT=2004)))(CONNECT_DATA=(SERVICE_NAME=SED.PROD)))'),
(255, 'SPIS.BASE', 'SPIS.BASE=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DBSPIS.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=SPIS.PROD.MSK.USB)))'),
(256, 'SPIS.STBY', 'SPIS.STBY=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DBSPIS-STB.FC.URALSIBBANK.RU)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=SPIS.STBY.MSK.USB)))'),
(257, 'SPONSOR_URALSIB.WORLD', 'SPONSOR_URALSIB.WORLD=(DESCRIPTION=(SDU=32767)(ADDRESS=(PROTOCOL=TCP)(HOST=10.129.97.30)(PORT=1812))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=URALSIB)))'),
(258, 'SRV.SCH', 'SRV.SCH=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.62.0.27)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.SRV.USB)))'),
(259, 'STMK.SCHOOL', 'STMK.SCHOOL=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=LNXSTSTMK)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSS.SCHOOL.STMK.USB)(SERVER=DEDICATED)))'),
(260, 'TBW.PROD', 'TBW.PROD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=TBW.DB.URALSIBBANK.RU)(PORT=2044))(ADDRESS=(PROTOCOL=TCP)(HOST=TBWSB.DB.URALSIBBANK.RU)(PORT=2044)))(CONNECT_DATA=(SERVICE_NAME=TBW.PROD)))'),
(261, 'TCHBO_AIX.TEST', 'TCHBO_AIX.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=TCHBO.TEST)(SERVER=DEDICATED))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=TCHBO.DB.URALSIBBANK.RU)(PORT=2017)))'),
(262, 'TEST.WORLD', 'TEST.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=DS06MPS_PERM.FC.URALSIBBANK.RU)(PORT=1621)))(CONNECT_DATA=(SERVICE_NAME=MPSTEST.MPS.UFA.USB)))'),
(263, 'TEST_IBSO.PERM', 'TEST_IBSO.PERM=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=UFA-IBSODVP.FC.URALSIBBANK.RU)(PORT=1622)))(CONNECT_DATA=(SERVICE_NAME=PERM2)))'),
(264, 'TPBS.TEST', 'TPBS.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=TPBS.TEST))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=TPBS.DB.URALSIBBANK.RU)(PORT=2104)))'),
(265, 'TRDB', 'TRDB=(DESCRIPTION=(ADDRESS_LIST=(LOAD_BALANCE=ON)(FAILOVER=ON)(ADDRESS=(PROTOCOL=TCP)(HOST=DCCOREDB01.FC.URALSIBBANK.RU)(PORT=1527))(ADDRESS=(PROTOCOL=TCP)(HOST=DCCOREDB02.FC.URALSIBBANK.RU)(PORT=1527)))(CONNECT_DATA=(SERVICE_NAME=TRDB_PROD)(FAILOVER_MODE=(TYPE=SESSION)(METHOD=BASIC)(RETRIES=20)(DELAY=5))))'),
(266, 'TSED.TEST', 'TSED.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=TSED.TEST))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=TSED.DB.URALSIBBANK.RU)(PORT=2016)))'),
(267, 'TVER.BASE', 'TVER.BASE=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.8)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=IBSO93.TVR.UFA.USB)))'),
(268, 'URALSIB_MSK.WORLD', 'URALSIB_MSK.WORLD=(DESCRIPTION=(LOAD_BALANCE=OFF)(FAILOVER=ON)(CONNECT_TIMEOUT=4)(RETRY_COUNT=1)(SDU=32767)(TRANSPORT_CONNECT_TIMEOUT=4)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.6.129.6)(PORT=1541))(ADDRESS=(PROTOCOL=TCP)(HOST=10.6.129.5)(PORT=1541)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=URALSIB.K903.RUSOFT.INFO)))'),
(269, 'URALSIB_URSA.WORLD', 'URALSIB_URSA.WORLD=(DESCRIPTION=(LOAD_BALANCE=OFF)(FAILOVER=ON)(CONNECT_TIMEOUT=1)(RETRY_COUNT=1)(SDU=32767)(TRANSPORT_CONNECT_TIMEOUT=1)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.6.129.6)(PORT=1541))(ADDRESS=(PROTOCOL=TCP)(HOST=10.6.129.5)(PORT=1541)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=URALSIB.K903.RUSOFT.INFO)))'),
(270, 'USER_MIR.WORLD', 'USER_MIR.WORLD=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=MIR.DB.URALSIBBANK.RU)(PORT=2018))(ADDRESS=(PROTOCOL=TCP)(HOST=MIRSB.DB.URALSIBBANK.RU)(PORT=2018)))(CONNECT_DATA=(SERVICE_NAME=MIR.PROD)))'),
(271, 'VEGA.BPB', 'VEGA.BPB=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.10.67.10)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=VEGA.BPB.USB)))'),
(272, 'VSED.TEST', 'VSED.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=VSED.TEST)(SERVER=DEDICATED))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=VSED.DB.URALSIBBANK.RU)(PORT=2096)))'),
(273, 'XCHBO.TEST', 'XCHBO.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=XCHBO.TEST))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=XCHBO.DB.URALSIBBANK.RU)(PORT=2102)))'),
(274, 'Y2CHBO.TEST', 'Y2CHBO.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=Y2CHBO.TEST))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=Y2CHBO.DB.URALSIBBANK.RU)(PORT=2089)))'),
(275, 'YCHBO.TEST', 'YCHBO.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=YCHBO.TEST))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=YCHBO.DB.URALSIBBANK.RU)(PORT=2088)))'),
(276, 'ZCHBO.TEST', 'ZCHBO.TEST=(DESCRIPTION=(CONNECT_DATA=(SERVICE_NAME=ZCHBO.TEST))(ADDRESS=(COMMUNITY=TCP.WORLD)(PROTOCOL=TCP)(HOST=ZCHBO.DB.URALSIBBANK.RU)(PORT=2070)))');

-- --------------------------------------------------------

--
-- Структура таблицы `user_info`
--

CREATE TABLE `user_info` (
  `id` int(4) NOT NULL,
  `date_update` datetime NOT NULL COMMENT 'дата обновления',
  `ip` varchar(15) NOT NULL COMMENT 'ip адрес',
  `login` varchar(128) NOT NULL COMMENT 'сетевой логин',
  `fio` varchar(512) NOT NULL COMMENT 'ФИО',
  `id_sdportal` varchar(64) NOT NULL,
  `host` varchar(128) DEFAULT NULL,
  `domain` varchar(64) DEFAULT NULL,
  `img` varchar(64) NOT NULL COMMENT 'фотография',
  `job_title` varchar(256) NOT NULL COMMENT 'должность',
  `deport` varchar(512) NOT NULL COMMENT 'подразделение',
  `phone` varchar(128) NOT NULL COMMENT 'телефон',
  `address` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Дамп данных таблицы `user_info`
--

INSERT INTO `user_info` (`id`, `date_update`, `ip`, `login`, `fio`, `id_sdportal`, `host`, `domain`, `img`, `job_title`, `deport`, `phone`, `address`) VALUES
(18, '2020-03-23 12:30:38', '10.1.128.158', 'MukhamadieVA2', 'Мухамадиев Вадим Ансафович', '282624122160991', 'UFA01-S07042', 'FC', '00170738', 'Ведущий специалист', 'Группа сопровождения депозит. продуктов', '(010)-4259', 'г.Уфа, Революционная ул., д.41'),
(19, '2020-03-23 12:36:36', '10.1.128.159', 'MukhamadieVA', 'Мухамадиев Вадим Ансафович', '282624122160991', 'UFA01-S07042', 'FC', '00170738', 'Ведущий специалист', 'Группа сопровождения депозит. продуктов', '(010)-4259', 'г.Уфа, Революционная ул., д.41'),
(20, '2020-04-22 11:51:20', '10.1.128.152', 'BobronnikoAB', 'Бобронников Андрей Борисович', '282319089895050', 'UFA01-S07042', 'FC', '00156063', 'Руководитель группы', 'Группа сопровождения депозит. продуктов', '(010)-4187', 'г.Уфа, Революционная ул., д.41'),
(21, '2020-06-11 17:43:20', '10.1.128.16', 'ValievaSR', 'Валиева Светлана Рамилевна', '281771499259479', 'UFA01-S07042', 'FC', '00108492', 'Старший специалист', 'Группа сопровождения депозит. продуктов', '(010)-4375', 'г.Уфа, Революционная ул., д.41'),
(22, '2020-06-11 17:43:35', '10.1.128.29', 'MusinMA', 'Мусин Мурад Ахметович', '282305230210751', 'UFA01-S07042', 'FC', '00155347', 'Главный разработчик', 'Группа сопровождения депозит. продуктов', '(010)-4199', 'г.Уфа, Революционная ул., д.41'),
(23, '2020-06-11 17:44:52', '10.1.128.148', 'PudovkinaNS', 'Пудовкина Нина Сергеевна', '282232667506404', 'UFA01-S07042', 'FC', '00151761', 'Ведущий специалист', 'Группа сопровождения депозит. продуктов', '(010)-4098', 'г.Уфа, Революционная ул., д.41'),
(24, '2020-06-16 16:17:24', '10.1.128.35', 'MikhajlovaTO', 'Михайлова Татьяна Олеговна', '282668562450295', 'UFA01-S07042', 'FC', '00171850', 'Главный специалист', 'Группа сопровождения депозит. продуктов', '(010)-4326', 'г.Уфа, Революционная ул., д.41'),
(25, '2020-06-16 16:18:05', '10.1.128.32', 'AminevaZM', 'Аминева Зухра Мунировна', '282607816476548', 'UFA01-S07042', 'FC', '00170350', 'Главный специалист', 'Группа сопровождения депозит. продуктов', '(010)-4275', 'г.Уфа, Революционная ул., д.41'),
(26, '2020-06-18 11:23:19', '10.1.128.160', 'AkhmadievaEI', 'Ахмадиева Элина Ильдаровна', '282845076981753', 'UFA01-S07042', 'FC', '00176312', 'Ведущий специалист', 'Группа сопровождения депозит. продуктов', '(010)-4189', 'г.Уфа, Революционная ул., д.41'),
(27, '2020-06-26 14:25:16', '10.1.128.160', 'BiglovaAA', 'Биглова Алина Азатовна', '281714218042877', 'UFA01-S07042', 'FC', '00100333', 'Ведущий специалист', 'Группа сопровождения депозит. продуктов', '(010)-4487', 'г.Уфа, Революционная ул., д.41');

-- --------------------------------------------------------

--
-- Структура таблицы `user_workorder`
--

CREATE TABLE `user_workorder` (
  `id` int(5) NOT NULL,
  `date_update` datetime NOT NULL,
  `login` varchar(128) NOT NULL,
  `wor_id` varchar(64) NOT NULL,
  `dop_info` varchar(512) NOT NULL,
  `relation_type` varchar(512) NOT NULL,
  `mpoject` varchar(512) NOT NULL,
  `job_title` varchar(512) NOT NULL,
  `reg_date` varchar(24) NOT NULL,
  `deadline` varchar(24) NOT NULL,
  `wor_description` varchar(1024) NOT NULL,
  `text` varchar(512) NOT NULL,
  `requestor_fio` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_workorder`
--

INSERT INTO `user_workorder` (`id`, `date_update`, `login`, `wor_id`, `dop_info`, `relation_type`, `mpoject`, `job_title`, `reg_date`, `deadline`, `wor_description`, `text`, `requestor_fio`) VALUES
(678, '2020-06-11 17:42:31', 'BobronnikoAB', '3017516', 'Анализ и оценка 931367\n', 'МП/ЗП/Изменение', '931367', 'Руководитель группы', '2020-06-11T07:46:34.000Z', '2020-06-22T15:45:00.000Z', 'Анализ и оценка 931367', 'Бобронников, Андрей Борисович, 00156063, (010)-4187, Уфа,  Революционная ул., д.41,', 'Бобронников, Андрей Борисович'),
(679, '2020-06-11 17:43:23', 'ValievaSR', '3017574', 'Анализ проблемы 16040\n', 'Проблема', '', 'Старший специалист', '2020-06-11T08:15:34.000Z', '2020-07-07T15:45:00.000Z', 'Анализ проблемы 16040', 'Валиева, Светлана Рамилевна, 00108492, (010)-4375, Уфа,  Революционная ул., д.41,', 'Валиева, Светлана Рамилевна'),
(681, '2020-06-11 17:44:55', 'PudovkinaNS', '3016816', 'Тестирование 929186\n', 'МП/ЗП/Изменение', '929186', 'Руководитель группы', '2020-06-29T07:00:00.000Z', '2020-07-03T15:45:00.000Z', 'Тестирование 929186', 'Бобронников, Андрей Борисович, 00156063, (010)-4187, Уфа,  Революционная ул., д.41,', 'Бобронников, Андрей Борисович'),
(687, '2020-06-16 16:18:07', 'AminevaZM', '3022037', 'Оценка по Мини-проект №931006 \n', 'МП/ЗП/Изменение', '931006', 'Руководитель группы', '2020-06-16T09:38:34.000Z', '2020-06-26T15:45:00.000Z', 'Оценка по Мини-проект №931006 ', 'Горбунов, Николай Александрович, 00002697, (010)-4273, Уфа,  Революционная ул., д.41,', 'Горбунов, Николай Александрович'),
(688, '2020-06-16 16:18:08', 'AminevaZM', '3016244', 'Консультация\n', 'МП/ЗП/Изменение', '931220', 'Руководитель дирекции', '2020-07-20T07:00:00.000Z', '2020-08-03T15:45:00.000Z', 'Консультация', 'Ахметшина, Зульфия Лотфулловна, 00169514, (010)-2332, Уфа,  Революционная ул., д.41,', 'Ахметшина, Зульфия Лотфулловна'),
(689, '2020-06-16 16:18:08', 'AminevaZM', '3020323', 'Требуется ли разработка в Ритейле\n', 'МП/ЗП/Изменение', '931307', 'Руководитель группы', '2020-06-15T09:28:35.000Z', '2020-06-17T15:45:00.000Z', 'Экспресс-оценка по Мини-проект №931307', 'Горбунов, Николай Александрович, 00002697, (010)-4273, Уфа,  Революционная ул., д.41,', 'Горбунов, Николай Александрович'),
(690, '2020-06-16 16:18:09', 'AminevaZM', '2990602', 'Исполнение 930027\n', 'МП/ЗП/Изменение', '930027', 'Руководитель группы', '2020-07-29T07:00:00.000Z', '2020-08-07T15:45:00.000Z', 'Исполнение 930027', 'Бобронников, Андрей Борисович, 00156063, (010)-4187, Уфа,  Революционная ул., д.41,', 'Бобронников, Андрей Борисович'),
(691, '2020-06-16 16:18:09', 'AminevaZM', '2960960', 'Реализация 929966\n', 'МП/ЗП/Изменение', '929966', 'Главный разработчик', '2020-06-01T07:00:00.000Z', '2020-07-28T15:45:00.000Z', 'Реализация 929966', 'Мусин, Мурад Ахметович, 00155347, (010)-4199, Уфа,  Революционная ул., д.41,', 'Мусин, Мурад Ахметович'),
(700, '2020-06-19 10:18:17', 'AkhmadievaEI', '3027673', 'Импорт сервисных пакетов, субтипов. Настройка карточных продуктов и схем выпуска', 'нет', '', 'Менеджер-эксперт', '2020-06-19T07:06:10.000Z', '2020-06-19T16:06:10.000Z', 'Импорт сервисных пакетов, субтипов. Настройка карточных продуктов и схем выпуска', 'Сурков, Александр Юрьевич, 00174785, (010)-4267, Уфа,  Революционная ул., д.41,', 'Сурков, Александр Юрьевич'),
(701, '2020-06-19 13:10:57', 'MusinMA', '2960961', 'Реализациия 929965\n', 'МП/ЗП/Изменение', '929965', 'Главный разработчик', '2020-06-08T07:00:00.000Z', '2020-07-30T15:45:00.000Z', 'Реализация 929965', 'Мусин, Мурад Ахметович, 00155347, (010)-4199, Уфа,  Революционная ул., д.41,', 'Мусин, Мурад Ахметович'),
(711, '2020-06-26 09:59:32', 'MikhajlovaTO', '3024105', 'Реализация 930086\n', 'МП/ЗП/Изменение', '930086', 'Руководитель группы', '2020-07-17T07:00:00.000Z', '2020-07-23T15:45:00.000Z', 'Реализация 930086', 'Бобронников, Андрей Борисович, 00156063, (010)-4187, Уфа,  Революционная ул., д.41,', 'Бобронников, Андрей Борисович'),
(712, '2020-06-26 09:59:33', 'MikhajlovaTO', '3016932', 'Исполнение 929562\n', 'МП/ЗП/Изменение', '929562', 'Руководитель группы', '2020-06-30T07:00:00.000Z', '2020-07-16T15:45:00.000Z', 'Исполнение 929562', 'Бобронников, Андрей Борисович, 00156063, (010)-4187, Уфа,  Революционная ул., д.41,', 'Бобронников, Андрей Борисович'),
(713, '2020-06-26 09:59:33', 'MikhajlovaTO', '3016812', 'Исполнение 929186\n', 'МП/ЗП/Изменение', '929186', 'Руководитель группы', '2020-06-10T15:37:48.000Z', '2020-06-29T21:45:00.000Z', 'Исполнение 929186', 'Бобронников, Андрей Борисович, 00156063, (010)-4187, Уфа,  Революционная ул., д.41,', 'Бобронников, Андрей Борисович'),
(715, '2020-07-02 14:56:36', 'MukhamadieVA', '2935249', 'Исполнение 927259\n', 'МП/ЗП', '927259', 'Руководитель группы', '2020-05-06T07:00:00.000Z', '2020-07-06T19:45:00.000Z', 'Исполнение 927259', 'Бобронников, Андрей Борисович, 00156063, (010)-4187, Уфа,  Революционная ул., д.41,', 'Бобронников, Андрей Борисович');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_block_db`
--
ALTER TABLE `auth_block_db`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `config_update`
--
ALTER TABLE `config_update`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `db_config_shema`
--
ALTER TABLE `db_config_shema`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `db_list_shema`
--
ALTER TABLE `db_list_shema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `db_net_tns`
--
ALTER TABLE `db_net_tns`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_workorder`
--
ALTER TABLE `user_workorder`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_block_db`
--
ALTER TABLE `auth_block_db`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `config_update`
--
ALTER TABLE `config_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `db_config_shema`
--
ALTER TABLE `db_config_shema`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `db_list_shema`
--
ALTER TABLE `db_list_shema`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `db_net_tns`
--
ALTER TABLE `db_net_tns`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT для таблицы `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `user_workorder`
--
ALTER TABLE `user_workorder`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=716;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
