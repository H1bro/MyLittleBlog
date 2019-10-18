-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Окт 18 2019 г., 13:56
-- Версия сервера: 5.7.27-0ubuntu0.16.04.1
-- Версия PHP: 7.0.33-8+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2advanced`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Тестовая категория'),
(2, 'Linux'),
(3, 'PHP'),
(4, 'Git'),
(5, 'Yii2'),
(6, 'DevOps');

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `publish_status` enum('moderate','publish') NOT NULL DEFAULT 'moderate',
  `post_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `pid`, `title`, `content`, `publish_status`, `post_id`, `author_id`) VALUES
(1, NULL, 'Заголовок комментария', 'текст комментария', 'publish', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1564873323),
('m130524_201442_init', 1564873327),
('m141018_161427_18102014', 1564873327),
('m141116_104920_tags', 1564873328),
('m141213_134307_comments', 1564873328),
('m160307_190534_default_user', 1564873328),
('m170203_192824_tag_post_pk', 1564873328);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `anons` text NOT NULL,
  `content` text NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `publish_status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `publish_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `title`, `anons`, `content`, `category_id`, `author_id`, `publish_status`, `publish_date`) VALUES
(1, 'Первый пост', 'Анонс', 'Контент', 1, 1, 'publish', '2019-08-05 15:57:02'),
(2, 'Cортировка массива без встроенной функции сортировки ', 'Чтобы отсортировать массив с пользовательским сортированием, вы можете использовать этот код:', '$array = array(1,3,5,6,7,8,11,12,17,11);\r\n$arrayCount = count($array);  // no need to evaluate the count on every iteration of the for loop\r\n\r\nfor($i=0; $i < $arrayCount - 1; $i++)\r\n{\r\n    for($j = $i+1; $j < $arrayCount; $j++)\r\n    {\r\n        // if you want the array sorted from bigger to smaller number use \'>\' here\r\n        if($array[$j] < $array[$i])\r\n        {\r\n            $temp = $array[$i];\r\n            $array[$i] = $array[$j];\r\n            $array[$j] = $temp;\r\n        }\r\n    }\r\n}\r\n\r\nprint_r($array);\r\n\r\n\r\nкоторый выводит:\r\n\r\nArray\r\n(\r\n  [0] => 1\r\n  [1] => 3\r\n  [2] => 5\r\n  [3] => 6\r\n  [4] => 7\r\n  [5] => 8\r\n  [6] => 11\r\n  [7] => 11\r\n  [8] => 12\r\n  [9] => 17\r\n)\r\n\r\n\r\n// Check if array contains a value 12, if it does return the index location in the array\r\n// returns false if the value is not found\r\n$index = array_search(12, $array); \r\n\r\nif($index === false)\r\n{\r\n    echo \'Value does not exist in the array.\';\r\n}\r\nelse\r\n{\r\n    echo \'Value \'.$array[$index].\' is at index \'.$index.\' in the array.\';\r\n}', 3, 1, 'publish', '2019-08-05 18:20:25'),
(3, 'Как создать символические ссылки в Linux', 'Создаём символические ссылки с помощью команды ln', 'Символическая ссылка, также известная как symlink или soft link, представляет собой особый тип файла, который указывает на другой файл или каталог.\r\n\r\nТипы ссылок\r\nВ системах Linux/UNIX существует два типа ссылок:\r\n\r\nЖесткие ссылки. Вы можете считать жесткую ссылку в качестве дополнительного имени для существующего файла. Жесткие ссылки связывают два или более имени файла с тем же inode. Вы можете создать одну или несколько жестких ссылок для одного файла. Жесткие ссылки не могут быть созданы для каталогов и файлов в другой файловой системе или разделе.\r\nМягкие ссылки. Soft link – это что-то вроде ярлыка в Windows. Это косвенный указатель на файл или каталог. В отличие от жесткой ссылки, символическая ссылка может указывать на файл или каталог на другой файловой системе или разделе.\r\n\r\nКоманда ln\r\nУтилита ln для создания связей между файлами. По умолчанию команда ln создает жесткие ссылки. Для создания символических ссылок используйте параметр -s( --symbolic).\r\n\r\nСинтаксис команды ln выглядит следующим образом : ln [OPTIONS] FILE LINK\r\n\r\nСоздание символических ссылок.\r\nЧтобы создать символическую ссылку в Linux, откройте свой терминал и введите: ln -s source_file symbolic_link\r\n\r\nЗамените имя source_file существующего файла, для которого вы хотите создать символическую ссылку, и с именем symbolic_link символической ссылки.\r\nПараметр symbolic_link является необязательным. Если вы не укажете символическую ссылку, команда ln создаст новую ссылку в вашем текущем каталоге.\r\n\r\nСоздание символических ссылок на файлы\r\nВ следующем примере мы создаем символическую ссылку, названную my_link.txt в файл с именем my_file.txt: ln -s my_file.txt my_link.txt\r\n\r\nЧтобы убедиться, что символическая ссылка была создана, используйте команду ls: ls -l my_link.txt\r\n\r\nРезультат будет выглядеть примерно так: lrwxrwxrwx 1 linuxize users  4 Nov  2 23:03  my_link.txt -> my_file.txt\r\nСимвол l – это флаг типа файла, представляющий символическую ссылку. Символ -> показывает файл символическая ссылка указывает.\r\n\r\nСоздание ссылок на каталоги\r\nКоманда создания символической ссылки на каталог такая же, как при создании символической ссылки на файл. Укажите имя каталога как параметр firs и символическую ссылку в качестве второго параметра.\r\nНапример, если вы хотите создать символическую ссылку из каталога /mnt/my_drive/movies в каталог ~/my_movies, который вы запустили: ln -s /mnt/my_drive/movies ~/my_movies\r\n\r\nПерезапись символов\r\nЕсли вы попытаетесь создать символическую ссылку, которая уже существует, команда ln выведет сообщение об ошибке.\r\nln -s my_file.txt my_link.txt\r\nln: failed to create symbolic link \'my_link.txt\': File exists\r\n \r\nЧтобы переписать путь назначения символической ссылки, используйте опцию -f( --force).\r\nln -sf my_file.txt my_link.txt\r\n\r\nУдаление Symlinks\r\nВы можете удалить существующую символическую ссылку с помощью команды unlink или rm.\r\n\r\nСинтаксис команды unlink очень прост: unlink symlink_to_remove\r\nУдаление символической ссылки с помощью команды rm аналогично удалению файла: rm symlink_to_remove\r\n \r\nhttps://andreyex.ru/operacionnaya-sistema-linux/kak-sozdat-simvolicheskie-ssylki-v-linux-s-pomoshhyu-komandy-ln/\r\nВы должны использовать утилиту unlink для удаления символической ссылки.\r\n\r\nЕсли вы удалите или переместите исходный файл в другое место, символический файл останется нерабочим. Вы должны удалить его, потому что он больше не будет работать.', 2, 1, 'publish', '2019-08-07 17:15:16'),
(4, 'Создание простого виджета на Yii2', 'Создаёте в папке widgets (если этой папки нет, то нужно её создать в корне сайта) файл WMenu.php', 'Создаёте в папке widgets (если этой папки нет, то нужно её создать в корне сайта) файл WMenu.php:\r\n<?php\r\nnamespace app\\widgets;\r\n\r\nuse app\\models\\Menu;\r\nuse yii\\bootstrap\\Widget;\r\n\r\nclass WMenu extends Widget\r\n{\r\n    public function init(){}\r\n\r\n    public function run() {\r\n        return $this->render(\'menu/view\', [\r\n            \'menuItems\' => Menu::find()->all()\r\n        ]);\r\n    }\r\n}\r\n\r\nДалее в этой же папке создаёте папку \'views\' если у вас ещё не было виджетов до этого, и в папке views создаёте папку menu, в этом папке будет файл view.php:\r\n<?php\r\nuse yii\\helpers\\Url;\r\n\r\n?>\r\n\r\n<ul>\r\n    <?php foreach($menuItems as $item) {\r\n    ?>\r\n        <li><a href="<?= Url::to([\'/\'.$item->url]); ?>"><?= $item->text ?></a></li>\r\n    <?php\r\n    }\r\n    ?>\r\n</ul>\r\n\r\nДалее в файл layouts/main.php сверху добавляете:\r\nuse app\\widgets\\WMenu;\r\n\r\nи в нужное место вставляет такой код:\r\n<?= WMenu::widget(); ?>\r\n\r\n', 5, 1, 'publish', '2019-08-07 21:54:33'),
(5, 'Второй тестовый', '<h1>Hello trust</h1>', '<h2>Hello trust</h2>', 1, 1, 'publish', '2019-08-12 21:05:33'),
(6, 'CI/CD: принципы, внедрение, инструменты', '<img src="https://miro.medium.com/max/1400/0*7Ug0sGytwhy94O3Z.png" class="imgblog">\r\nКонцепция непрерывной интеграции и доставки (CI/CD) — как основа тестирования', '<img src="https://miro.medium.com/max/1400/0*7Ug0sGytwhy94O3Z.png" class="imgblog">\r\n<p>\r\nCI/CD — концепция, которая реализуется как конвейер, облегчая слияние только что закомиченного кода в основную кодовую базу. Концепция позволяет запускать различные типы тестов на каждом этапе (выполнение интеграционного аспекта) и завершать его запуском с развертыванием закомиченного кода в фактический продукт, который видят конечные пользователи (выполнение доставки).\r\n</p>\r\n<p>\r\nCI/CD необходимы для разработки программного обеспечения с применением Agile-методологии, которая рекомендует использовать автоматическое тестирование для быстрой наладки рабочего программного обеспечения. Автоматическое тестирование дает заинтересованным лицам доступ к вновь созданным функциям и обеспечивает быструю обратную связь.\r\n</p>\r\n<b>Содержание</b>\r\nПринципы CI/CD\r\n1.1. Сегрегация ответственности заинтересованных сторон.\r\n1.2. Снижение риска.\r\n1.3. Короткий цикл обратной связи.\r\n2. Реализации среды в CI/CD.\r\n3. Инструменты для CI/CD.', 6, 1, 'publish', '2019-08-31 17:30:42');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`) VALUES
(1, 'Поиск');

-- --------------------------------------------------------

--
-- Структура таблицы `tag_post`
--

CREATE TABLE `tag_post` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'demoadmin', 'Jg6O-7Sho1sxY38OgTcx3RTX30VUlXTi', '$2y$13$MKjLOsF/qyONMpwqhOe99ufFNK.3f8amFf5lB27/4zD9F1Xj4EiVy', NULL, 'admin@localhost.local', 100, 10, 1564873328, 1564873328),
(2, 'qwerty', 'Gm_7Kq5H4qpmc8hevnBpNzmxhRO6AL1J', '$2y$13$pgt2bnHXKRWzBb.zcgg19.MOgrPfJBjgK9xmPU8o/4DH1U47vlYK2', NULL, 'qw@gmail.com', 10, 10, 1565019023, 1565217169);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comment_author` (`author_id`),
  ADD KEY `FK_comment_post` (`post_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_post_author` (`author_id`),
  ADD KEY `FK_post_category` (`category_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tag_post`
--
ALTER TABLE `tag_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tag` (`tag_id`),
  ADD KEY `FK_post` (`post_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `tag_post`
--
ALTER TABLE `tag_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_post_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tag_post`
--
ALTER TABLE `tag_post`
  ADD CONSTRAINT `FK_post_tag` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tag_post` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
