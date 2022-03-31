INSERT INTO `sauna`.`customer`
(`phone`,
`name`)
VALUES
(20862045, "Morten"),
(12345678, "Lars"),
(87654321, "Annette"),
(43215678, "Hans"),
(98761234, "Grete"),
(23145323, "Anna");

INSERT INTO `sauna`.`location`
(`address`,
`zip`,
`city`,
`gps`)
VALUES
("Balladegade 23", 2880, "Bagsværd", 1234),
("Gadevej 40", 2600, "Lyngby", 4321),
("ByGade 30", 2000, "KBH", 2030),
("Torvevej 1", 2500, "By", 3000),
("Vejgade 2", 1800, "Søborg", 1400);

INSERT INTO `sauna`.`event`
(`start_time`,
`duration`,
`price`,
`participants`,
`lokation_id`)
VALUES
("30/03/2022", 1, 1650, 12, 1),
("31/03/2022", 1, 165, 12, 2),
("01/03/2022", 1, 165, 12, 3),
("24/12/2022", 1, 165, 12, 4),
("25/12/2022", 1, 165, 12, 5);

INSERT INTO `sauna`.`user`
(`email`,
`password`,
`role`)
VALUES
("sebastian@sauna.dk", 1234, "admin");








