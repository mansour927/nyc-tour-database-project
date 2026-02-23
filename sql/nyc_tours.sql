DROP DATABASE IF EXISTS nyc_tours_db;
CREATE DATABASE nyc_tours_db;

USE nyc_tours_db;



CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guides` (
  `guide_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `cert_number` varchar(50) NOT NULL,
  PRIMARY KEY (`guide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `tour_packages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(100) NOT NULL,
  `duration` int DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `landmarks` (
  `landmark_id` int NOT NULL AUTO_INCREMENT,
  `landmark_name` varchar(100) NOT NULL,
  `is_movie_spot` BOOLEAN DEFAULT NULL,
  `landmark_description` text,
  PRIMARY KEY (`landmark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `guide_languages` (
  `language_name` varchar(45) NOT NULL,
  `guides_guide_id` int NOT NULL,
  PRIMARY KEY (`language_name`,`guides_guide_id`),
  KEY `fk_guide_languages_guides1_idx` (`guides_guide_id`),
  CONSTRAINT `fk_guide_languages_guides1` FOREIGN KEY (`guides_guide_id`) REFERENCES `guides` (`guide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `tour_itinerary` (
  `stop_order` int NOT NULL,
  `visit_type` varchar(45) DEFAULT NULL,
  `tour_packages_package_id` int NOT NULL,
  `landmarks_landmark_id` int NOT NULL,
  PRIMARY KEY (`stop_order`,`tour_packages_package_id`,`landmarks_landmark_id`),
  KEY `fk_tour_itinerary_tour_packages1_idx` (`tour_packages_package_id`),
  KEY `fk_tour_itinerary_landmarks1_idx` (`landmarks_landmark_id`),
  CONSTRAINT `fk_tour_itinerary_landmarks1` FOREIGN KEY (`landmarks_landmark_id`) REFERENCES `landmarks` (`landmark_id`),
  CONSTRAINT `fk_tour_itinerary_tour_packages1` FOREIGN KEY (`tour_packages_package_id`) REFERENCES `tour_packages` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `tour_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `customers_customer_id` int NOT NULL,
  `guides_guide_id` int NOT NULL,
  `tour_packages_package_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_bookings_customers_idx` (`customers_customer_id`),
  KEY `fk_bookings_guides1_idx` (`guides_guide_id`),
  KEY `fk_bookings_tour_packages1_idx` (`tour_packages_package_id`),
  CONSTRAINT `fk_bookings_customers` FOREIGN KEY (`customers_customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_bookings_guides1` FOREIGN KEY (`guides_guide_id`) REFERENCES `guides` (`guide_id`),
  CONSTRAINT `fk_bookings_tour_packages1` FOREIGN KEY (`tour_packages_package_id`) REFERENCES `tour_packages` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





INSERT INTO customers (first_name, last_name, email, phone)
VALUES 
('Mahmoud', 'Mansour', 'mahmoud.mansour@email.com', '212-555-0101'),
('Fatimah', 'Al-Sayed', 'fatimah.np@email.com', '212-555-0102'),
('John', 'Smith', 'jsmith@gmail.com', '917-555-1234'),
('Sarah', 'Johnson', 'sarah.j@outlook.com', '646-555-5678'),
('Michael', 'Brown', 'mbrown@nycmail.com', '347-555-9012'),
('Emily', 'Davis', 'emilyd@lehman.edu', '212-555-3456'),
('David', 'Wilson', 'dwilson@tourist.com', '516-555-7890'),
('Jessica', 'Taylor', 'jtaylor@service.com', '718-555-2345'),
('Christopher', 'Anderson', 'chris.a@mail.com', '914-555-6789'),
('Ashley', 'Thomas', 'athomas@provider.net', '201-555-0112');

INSERT INTO guides (first_name, last_name, cert_number)
VALUES 
('Abdul', 'Rahman', 'CERT1001'),
('Jay', 'Rodriguez', 'CERT1002'),
('Sami', 'Hassan', 'CERT1003');

INSERT INTO tour_packages (package_name, duration, base_price)
VALUES
('30-Minute Express Tour', 30, 45.00),
('1-Hour Standard Tour', 60, 75.00),
('2-Hour Adventure Tour', 120, 120.00);

INSERT INTO guide_languages(guides_guide_id, language_name) VALUES
(1,'French'),
(2,'Arabic');

INSERT INTO landmarks ( landmark_name, is_movie_spot, landmark_description)
VALUES
('Bethesda Fountain', 1, 'Iconic Central Park fountain featured in Enchanted and Home Alone 2.'),
('Bow Bridge', 1, 'A romantic cast-iron bridge in Central Park seen in Spider-Man and Manhattan.'),
('Times Square', 0, 'The neon-lit junction of Broadway and Seventh Avenue; the heart of the Theater District.'),
('Empire State Building', 1, 'Art Deco skyscraper famous for the King Kong and Sleepless in Seattle filming locations.'),
('The Ghostbusters Firehouse', 1, 'Hook & Ladder Company 8 in Tribeca; famous headquarters from the Ghostbusters films.'),
('Grand Central Terminal', 0, 'Historic transportation hub known for its celestial ceiling and Whispering Gallery.'),
('The High Line', 0, 'A public park built on a historic freight rail line elevated above Manhattan’s West Side.'),
('Tiffany & Co. Flagship', 1, 'Luxury jewelry store on 5th Ave; the central location for Breakfast at Tiffany’s.'),
('Top of the Rock', 0, 'Observation deck at Rockefeller Center offering 360-degree views of the city skyline.'),
('Katz’s Delicatessen', 1, 'Legendary Lower East Side deli famous for the "I’ll have what she’s having" scene in When Harry Met Sally.');


INSERT INTO bookings (tour_date,total_amount, customers_customer_id, guides_guide_id, tour_packages_package_id) VALUES
('2026-03-10', 75.00, 1, 1, 2),
('2026-03-10', 120.00, 2, 2, 3),
('2026-03-11', 45.00, 3, 1, 1),
('2026-03-11', 120.00, 4, 3, 3),
('2026-03-12', 75.00, 5, 2, 2),
('2026-03-12', 75.00, 6, 2, 2),
('2026-03-13', 120.00, 7, 3, 3),
('2026-03-13', 45.00, 8, 1, 1),
('2026-03-14', 120.00, 9, 3, 3),
('2026-03-14', 75.00, 10, 2, 2);

INSERT INTO tour_itinerary(stop_order, visit_type,tour_packages_package_id, landmarks_landmark_id)
VALUES 
(1, 'photo stop', 2, 1),
(2, 'drive-by',   2, 2),
(1, 'photo stop', 3, 1),
(2, 'photo stop', 3, 2),
(3, 'drive-by',   3, 9);

SELECT * FROM customers;
SELECT * FROM bookings;
SELECT * FROM landmarks;
SELECT * FROM tour_packages;
SELECT * FROM tour_itinerary;
