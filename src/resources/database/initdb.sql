USE test;

DROP TABLE IF EXISTS parts;
CREATE TABLE parts
(
  ID             int(5)       not null auto_increment,
  PARTS_NAME     varchar(200) not null,
  PARTS_REQUIRE  int(1)       not null,
  PARTS_QUANTITY int(5)       not null,
  PRIMARY KEY (id),
  UNIQUE KEY `parts_ID_uindex` (`ID`)
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


INSERT INTO `parts` (`ID`, `PARTS_NAME`, `PARTS_REQUIRE`, `PARTS_QUANTITY`) VALUES
(1,  'Материнская плата', 1, 3),
(2,  'Звуковая карта', 0, 10),
(3,  'Процессор', 1, 10),
(4,  'Подсветка корпуса', 0, 0),
(5,  'HDD диск', 0, 7),
(6,  'Корпус', 1, 5),
(7,  'Память', 1, 20),
(8,  'SSD диск', 1, 8),
(9,  'Видеокарта', 0, 9),
(10, 'Ноутбук ASUS', 0, 7),
(11, 'Ноутбук HP', 0, 10),
(12, 'Ноутбук ACER', 0, 11),
(13, 'Мышь', 0, 6),
(14, 'Принтер HP', 0, 7),
(15, 'Принтер Samsung', 0, 2),
(16, 'Принтер Canon', 0, 7),
(17, 'Сканер Epson', 0, 4),
(18, 'Сканер Canon', 0, 3),
(19, 'Сканер HP', 0, 8),
(20, 'Клавиатура', 0, 1),
(21, 'Геймпад', 0, 3),
(22, 'Джойстик', 0, 4),
(23, 'Источник бесперебойного питания', 0, 10),
(24, 'Сетевой фильтр', 0, 2),
(25, 'Кулер для процессора', 0, 5),
(26, 'CD/DVD-R', 0, 1),
(27, 'Монитор Samsung', 0, 7),
(28, 'Монитор Sony', 0, 10),
(29, 'WiFi роутер', 0, 3),
(30, 'Сетевой концентратор', 0, 4),
(31, 'Операционная система', 0, 2);