-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 07 2022 г., 15:44
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `publishing`
--

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `ISBN` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages` int(11) NOT NULL,
  `datePub` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `ISBN`, `title`, `pages`, `datePub`) VALUES
(1, '656343', 'книга1', 255, '1999-12-14'),
(2, '214122', 'книга2', 300, '1967-09-07'),
(3, '985784', 'книга3', 150, '1970-05-01'),
(4, '656343', 'книга4', 600, '1988-11-09'),
(5, '656343', 'книга5', 555, '1980-03-30');

-- --------------------------------------------------------

--
-- Структура таблицы `bookauthor`
--

CREATE TABLE `bookauthor` (
  `id` int(11) NOT NULL,
  `idBook` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bookauthor`
--

INSERT INTO `bookauthor` (`id`, `idBook`, `name`, `surname`) VALUES
(1, 1, 'Имя1', 'Фам1'),
(2, 1, 'Имя2', 'Фам2'),
(3, 1, 'Имя3', 'Фам3'),
(4, 3, 'Имя4', 'Фам4'),
(5, 4, 'Имя5', 'Фам5'),
(6, 4, 'Имя6', 'Фам6'),
(7, 5, 'Имя7', 'Фам7'),
(8, 5, 'Имя8', 'Фам8');

-- --------------------------------------------------------

--
-- Структура таблицы `bookgenre`
--

CREATE TABLE `bookgenre` (
  `id` int(11) NOT NULL,
  `idBook` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bookgenre`
--

INSERT INTO `bookgenre` (`id`, `idBook`, `name`) VALUES
(1, 1, 'фантастика'),
(2, 1, 'приключения'),
(3, 2, 'детектив'),
(4, 2, 'приключения'),
(5, 3, 'юмор'),
(6, 3, 'фантастика'),
(7, 4, 'роман'),
(8, 4, 'детектив');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_BookAuthor_idBook_id` (`idBook`);

--
-- Индексы таблицы `bookgenre`
--
ALTER TABLE `bookgenre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_BookGenre_idBook_id` (`idBook`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bookauthor`
--
ALTER TABLE `bookauthor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD CONSTRAINT `FK_BookAuthor_idBook_id` FOREIGN KEY (`idBook`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `bookgenre`
--
ALTER TABLE `bookgenre`
  ADD CONSTRAINT `FK_BookGenre_idBook_id` FOREIGN KEY (`idBook`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
