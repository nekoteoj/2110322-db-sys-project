use db_sys_development
insert into CATEGORY values
(1, "electronic", "electronic gadget"),
(2, "entertainment", "source of any entertainment"),
(3, "toys and games", "any toys and games for all people"),
(4, "household", "anything used in household"),
(5, "decoration", "anything used for decoration");

insert into SELLER values
("1156800225336", "Netithorn", "Niratpattanasai", "seller of Apple product", '2018-11-25 12:33:16', '2018-11-25 12:33:16', "neti123", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG"),
("3135011225771", "Pranon", "Maneerattana", "seller of BNK product", '2018-11-25 15:31:10', '2018-11-25 15:31:10', "Pran333", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG"),
("2122000225345", "Wiset", "Pridi", "seller of games and toys", '2018-11-26 10:21:45', '2018-11-26 10:21:45', "Wiset555", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG"),
("4519833572017", "Emjaroen", "Singharattanapan", "general thing around the house", '2018-11-26 18:44:19', '2018-11-26 18:44:19', "Emja_eiei", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG"),
("9878454551835", "Khakanang", "Sriroj", "sell computer related stuffs", '2018-11-27 14:55:10', '2018-11-27 14:55:10', "Khaka111", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG");

insert into SELLER_EMAIL values
("1156800225336", "nidi_yyy@gmail.com"),
("3135011225771", "super_fan1@hotmail.com"),
("3135011225771", "bnk_ezz@hotmail.com"),
("2122000225345", "vis_the_great@gmail.com"),
("4519833572017", "Emjaroen@gmail.com"),
("9878454551835", "kkk_5@gmail.com");

insert into SELLER_PHONE values
("1156800225336", "023163636"), 
("3135011225771", "027510883"),
("2122000225345", "022872680"),
("4519833572017", "038577505"),
("9878454551835", "022345447"),
("9878454551835", "0857781475");

insert into  CUSTOMER values
("5457811015347", "Thawan", "Paithoonbuathong", "Ween1968", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG"),
("6989112457678", "Napatsorn", "Inchareon", "andeed", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG"),
("0478936145815", "Somkid", "Pookusuwan", "Supost78", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG"),
("1151798931005", "Ruangsak", "Souvanatong", "Younk1992", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG"),
("1711433538661", "Daran", "Boripat", "qualown", "$2b$12$OWBb535FeoyN4CFzwkEVQuEqSyJ56QqFE91buVqNAmV/61pC8UcAG");

insert into CUSTOMER_PHONE values
("5457811015347", "027881415"),
("6989112457678", "029490686"),
("0478936145815", "0924724547"),
("0478936145815", "0924127633"),
("1151798931005", "0851738899"),
("1711433538661", "0841791715");

insert into CUSTOMER_EMAIL values
("5457811015347", "Ween1968@gmail.com"),
("6989112457678", "npnp@gmail.com"),
("0478936145815", "Supost78@hotmail.com"),
("1151798931005", "Younk1992@gmail.com"),
("1151798931005", "prt_inlove@gmail.com"),
("1711433538661", "daran72@gmail.com");

insert into PAYMENT_GATEWAY values
(1, "Easy Pay", "https://www.easypay.com/api?tok=asdfghjkl"),
(2, "super pay", "https://www.superpay.com/api?tok=zxcvbnm");

insert into item values
(1, "The most amazing iPhone ever!", 55000, "iPhone XS Max", "Apple", '2018-11-26 20:41:54', '2018-11-26 20:41:54', "Apple Inc.", 40, 1, "1156800225336"),
(2, "Intel 8th gen CPU, 8 Gb ram, 256 Gb SSD and no touch bar!", 49000, "Macbook Air 13 in", "Apple", '2018-11-26 21:33:50', '2018-11-26 21:21:33', "Apple Inc.", 20, 1, "1156800225336"),
(3, "Random picture of member included!", 350, "CD Kimi wa Melody 4th Single", "BNK48", '2018-11-26 23:14:05', '2018-11-26 23:14:05', "BNK48 Official", 1000, 2, "3135011225771"),
(4, "4 Tb, 7200 RPM, 3Y warranty", 3600, "Western Digital My passport 4 Tb 2.5 Ext Hdd", "Western Digital", '2018-11-27 11:00:15', '2018-11-27 11:00:15', "Western Digital", 400, 1, "9878454551835"),
(5, "10 cores, 3.3 Ghz base clock, up to 4.3 Ghz turbo", 34900, "INTEL Core i9-7900X", "Intel", '2018-11-27 16:39:21', '2018-11-27 16:39:21', "Intel", 50, 1, "9878454551835"),
(6, "The story-rich and thrilling adventure game", 1400, "Marvel Spiderman, DLC included", "Sony Interactive", '2018-11-28 09:34:40', '2018-11-28 09:34:40', "Sony Interactive Entertainment", 400, 3, "2122000225345"),
(7, "The only tablet you ever need!", 45000, "iPad Pro", "Apple", '2018-11-28 14:11:40', '2018-11-28 14:11:40', "Apple Inc.", 20, 1, "1156800225336"),
(8, "Adore your wall with lovely picture!", 1000, "BNK Yume e no Route Poster", "BNK48", '2018-11-28 19:40:12', '2018-11-28 19:37:22', "BNK48 official", 200, 5, "3135011225771"),
(9, "Make your mobile stand out! *random picture", 400, "BNK Kimi wa Melody Mobile Pop", "BNK48", '2018-11-28 20:41:20', '2018-11-28 20:41:20', "BNK48 official", 500, 5, "3135011225771");

insert into comment values
(1, "This is too pricy and the face ID thing is suck", '2018-11-27 21:18:31'),
(2, "Highly recommended! Everyone should play this", '2018-11-28 10:38:34'),
(3, "Does this has hyper threading?", '2018-11-28 12:55:35'),
(4, "I love to get one of these", '2018-11-28 20:22:15');

insert into orders values
(1, 2, '2018-11-27 16:31:55', "0478936145815"),
(2, 2, '2018-11-28 20:30:51', "5457811015347"),
(3, 1, '2018-11-28 21:30:50', "1711433538661");

insert into IS_IN values
(1, 1, 55000, 2),
(2, 1, 49000, 1),
(3, 2, 350, 10),
(4,2,3600, 2),
(6,2,1400,1),
(7,3, 45000, 1),
(8,3,1000,5);

insert into POSTS values
(1, "1711433538661", 1),
(6, "6989112457678", 2),
(5, "1711433538661", 3),
(8, "1151798931005", 4);