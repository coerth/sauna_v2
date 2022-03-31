CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `events_view` AS
    SELECT 
        `event`.`location_id` AS `location_id`,
        `event`.`event_id` AS `event_id`,
        `event`.`start_time` AS `start_time`,
        `event`.`duration` AS `duration`,
        `event`.`price` AS `price`,
        `event`.`participants` AS `participants`,
        `location`.`address` AS `address`,
        `location`.`zip` AS `zip`,
        `location`.`city` AS `city`,
        `location`.`gps` AS `gps`
    FROM
        (`event`
        JOIN `location` ON ((`event`.`location_id` = `location`.`location_id`)))