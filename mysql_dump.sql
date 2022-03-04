create database bus_booking;
use bus_booking;
create table if not exists `users`(
`id` int not null auto_increment,
`fname` varchar(255),
`username` varchar(255),
`email` varchar(255),
`password` varchar(255),
PRIMARY KEY (`id`)
);

create table if not exists `buslist`(
`id` int not null auto_increment,
`name` varchar(255),
`time` varchar(255),
`from` varchar(255),
`to` varchar(255),
`price` varchar(255),
primary key (`id`)
);
create table if not exists `booking`(
`id` int not null auto_increment,
`userid` int,
`busid` int,
`time` varchar(255),
primary key (`id`),
FOREIGN KEY (userid) REFERENCES users(id),
FOREIGN KEY (busid) REFERENCES buslist(id)   
);

insert into `buslist` 
values 
(1,'VOLVO BUS','7 PM','Pune','Mumbai','700'),
(2,'SHIVSHAHI BUS','8 PM','Pune','Mumbai','400'),
(3,'ASHWAMEGH BUS','8:30 PM','Pune','Mumbai','500'),
(4,'SHIVNERI BUS','9 PM','Pune','Mumbai','600'),
(5,'MSRTC BUS','9:30 PM','Pune','Mumbai','300'),

(6,'VOLVO BUS','7 PM','Mumbai','Pune','700'),
(7,'SHIVSHAHI BUS','8 PM','Mumbai','Pune','400'),
(8,'ASHWAMEGH BUS','8:30 PM','Mumbai','Pune','500'),
(9,'SHIVNERI BUS','9 PM','Mumbai','Pune','600'),
(10,'MSRTC BUS','9:30 PM','Mumbai','Pune','300'),

(11,'MSRTC BUS','7:30 AM','Pune','Pusad','600'),
(12,'CHANAKYA BUS','8:30 PM','Pune','Pusad','1000'),
(13,'CHINTAMAI BUS','9:30 PM','Pune','Pusad','1000'),

(14,'MSRTC BUS','7:30 AM','Pusad','Pune','600'),
(15,'CHANAKYA BUS','8:30 PM','Pusad','Pune','1000'),
(16,'CHINTAMAI BUS','9:30 PM','Pusad','Pune','1000'),

(17,'VOLVO BUS','7 PM','Pune','Bengaluru','1200'),
(18,'VRL Travels ','8 PM','Pune','Bengaluru','1000'),
(19,'National travels ntsb','8:30 PM','Pune','Bengaluru','1000'),
(20,'Orange Tours and TravelsS','9 PM','Pune','Bengaluru','1100'),
(21,'Paulo travels','9:30 PM','Pune','Bengaluru','1150'),

(22,'VOLVO BUS','7 PM','Bengaluru','Pune','1200'),
(23,'VRL Travels ','8 PM','Bengaluru','Pune','1000'),
(24,'National travels ntsb','8:30 PM','Bengaluru','Pune','1000'),
(25,'Orange Tours and Travels','9 PM','Bengaluru','Pune','1100'),
(26,'Paulo travels','9:30 PM','Bengaluru','Pune','1150'),

(27,'VOLVO BUS','7 PM','Mumbai','Bengaluru','1200'),
(28,'VRL Travels ','8 PM','Mumbai','Bengaluru','1000'),
(29,'National travels ntsb','8:30 PM','Mumbai','Bengaluru','1000'),
(30,'Orange Tours and TravelsS','9 PM','Mumbai','Bengaluru','1100'),
(31,'Paulo travels','9:30 PM','Mumbai','Bengaluru','1150'),

(32,'VOLVO BUS','7 PM','Bengaluru','Mumbai','1200'),
(33,'VRL Travels ','8 PM','Bengaluru','Mumbai','1000'),
(34,'National travels ntsb','8:30 PM','Bengaluru','Mumbai','1000'),
(35,'Orange Tours and Travels','9 PM','Bengaluru','Mumbai','1100'),
(36,'Paulo travels','9:30 PM','Bengaluru','Pune','1150'),

(37,'MSRTC BUS','7:30 AM','Mumbai','Pusad','800'),
(38,'CHANAKYA BUS','8:30 PM','Mumbai','Pusad','1200'),
(39,'CHINTAMAI BUS','9:30 PM','Mumbai','Pusad','1100'),

(40,'MSRTC BUS','7:30 AM','Pusad','Mumbai','800'),
(41,'CHANAKYA BUS','8:30 PM','Pusad','Mumbai','1200'),
(42,'CHINTAMAI BUS','9:30 PM','Pusad','Mumbai','1000'),

(43,'National travels ntsb','8:30 PM','Bengaluru','Pusad','1400'),
(44,'Orange Tours and Travels','9 PM','Bengaluru','Pusad','1300'),
(45,'CHANAKYA BUS','8:30 PM','Bengaluru','Pusad','1200'),
(46,'CHINTAMAI BUS','9:30 PM','Bengaluru','Pusad','1100'),

(47,'National travels ntsb','8:30 PM','Pusad','Bengaluru','1400'),
(48,'Orange Tours and Travels','9 PM','Pusad','Bengaluru','1100'),
(49,'CHANAKYA BUS','8:30 PM','Pusad','Bengaluru','1200'),
(50,'CHINTAMAI BUS','9:30 PM','Pusad','Bengaluru','1000');
