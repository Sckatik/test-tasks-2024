
# создание таблиц #

DROP TABLE IF EXISTS `types`;
DROP TABLE IF EXISTS `motorcycles`;

CREATE TABLE `types`
(
    `id`   bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255)    NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `motorcycles`
(
    `id`  bigint unsigned NOT NULL AUTO_INCREMENT,
    `type_id`  bigint unsigned NOT NULL,
    `name` varchar(255) NOT NULL,
    `discontinued` tinyint(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`, `type_id`),
    CONSTRAINT `motorcycle_types_id_fk` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE
);

# добавление данных в таблицы #

INSERT INTO `types` (`id`, `name`)
VALUES (1, 'Классика'),
       (2, 'Нейкед'),
       (3, 'Скрэмблер'),
       (4, 'Спортбайк'),
       (5, 'Туристический'),
       (6, 'Гипербайк'),
       (7, 'Турэндуро'),
       (8, 'Круизер'),
       (9, 'Мускулбайк'),
       (10, 'Боббер'),
       (11, 'Кафе-рейсер'),
       (12, 'Мотоцикл с коляской'),
       (13, 'Кастом'),
       (14, 'Чоппер'),
       (15, 'Мини-байк'),
       (16, 'Трайк'),
       (17, 'Макси-скутер'),
       (18, 'Кроссовый'),
       (19, 'Эндуро'),
       (20, 'Мотард'),
       (21, 'Супермото'),
       (22, 'Триалбайк'),
       (23, 'Питбайк'),
       (24, 'Мопед'),
       (25, 'Скутер'),
       (26, 'Скутеретта');

INSERT INTO `motorcycles` (`id`, `type_id`, `name`, `discontinued`)
VALUES (1, '1', 'Honda CB400SS', '0'),
       (2, '1', 'Triumph Bonneville T100', '0'),

       (3, '2', 'KTM Duke 390', '0'),
       (4, '2', 'Bajaj Pulsar 180 NEW', '0'),

       (5, '3', 'Honda CL400', '0'),
       (6, '3', 'Husqvarna Svartpilen 401', '0'),

       (7, '4', 'Yamaha YZF-R3', '0'),

       (8, '5', 'Honda Gold Wing', '0'),

       (9, '6', 'Suzuki GSX1300R Hayabusa', '0'),
       (10, '6', 'Kawasaki Ninja H2 SX', '0'),

       (11, '7', 'KTM Adventure 790', '0'),
       (12, '7', 'Honda Africa Twin 1000/1100 DCT', '0'),
       (13, '7', 'BMW R 1250 GS', '0'),

       (14, '8', 'Yamaha Dragstar 1100', '0'),
       (15, '8', 'Harley Davidson Heritage Classic', '0');



# Предполагаю, что у нас связь 1-m, те в одном типе мотоциклов может быть их несколько
# Запрос будет такой:

SELECT t.name as type_name,
       count(m.id) motorcycle_count
FROM types t
    LEFT OUTER JOIN motorcycles m ON m.type_id = t.id
AND m.discontinued = 0 GROUP BY t.name;