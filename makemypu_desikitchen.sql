-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 29, 2015 at 05:05 PM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `makemypu_desikitchen`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'IndianVeg'),
(2, 'IndianEgg'),
(3, 'Chinese'),
(4, 'Italian'),
(5, 'FastFood'),
(6, 'MySpecial');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `users_id` mediumint(9) NOT NULL,
  `dishes_id` mediumint(9) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `dishes_id` (`dishes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `users_id`, `dishes_id`, `comment`) VALUES
(1, 146, 19, 'nice recipe'),
(2, 137, 12, 'nice recipe'),
(3, 137, 17, 'yupee'),
(4, 137, 23, 'i love garlic bread');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE IF NOT EXISTS `dishes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `categories_id` mediumint(9) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `method` text,
  `other_info` varchar(500) DEFAULT NULL,
  `spicy` int(1) DEFAULT NULL,
  `sweet` int(1) DEFAULT NULL,
  `likes` int(10) DEFAULT NULL,
  `prep_time` varchar(100) NOT NULL,
  `serves` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'draft',
  `image_url` varchar(100) DEFAULT NULL,
  `ingredients` text,
  `is_deleted` varchar(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `categories_id` (`categories_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `categories_id`, `name`, `description`, `method`, `other_info`, `spicy`, `sweet`, `likes`, `prep_time`, `serves`, `status`, `image_url`, `ingredients`, `is_deleted`) VALUES
(1, 1, 'Aaloo Ke Parathe', 'Aaloo Ke Parathe', '<p>For The Dough 2 1/4 cups whole wheat flour (gehun ka atta) 2 tbsp melted ghee salt to taste For The Stuffing 2 1/2 cups boiled , peeled and mashed potatoes 2 tsp melted ghee 1 tsp cumin seeds (jeera) 1/2 cup finely chopped onions 1 tbsp finely chopped green chillies salt to taste 1/2 tsp chilli powder 2 tbsp finely chopped coriander (dhania) 2 tsp dried mango powder (amchur)</p>', '', 2, 0, 8, '', '', 'published', 'http://localhost/DesiKitchen/dishpics/alooparatha.jpg', 'dfdsfsfsdfsdfsdfsdfsdfsdfsddfsdfsdfsf,sdfsdfdsfsdfsdfdfererrwrwerwerwer,sddfsvczvvxcvsfsvsvvxcvxvxvxvxcxv,xcvsdfsdfafaafdafdfssfsdf,sdfsdffgfddbcvbdbdfgsfzxvczv,fsgdhghdbcvbcvbfgddfgdfgdfgdf,dfafdsfdsssdsdfvssv', 'no'),
(2, 1, 'Saragwa Sing', 'Saragwa Sing', '', '', 2, 0, 4, '', '', 'published', '', NULL, 'no'),
(3, 1, 'Muli Ke Parathe', 'Muli Ke Parathe', '', '', 2, 0, 5, '', '', 'published', '', NULL, 'no'),
(4, 1, 'Puranpoli', 'Puranpoli', '', '', 0, 2, 10, '', '', 'published', '', NULL, 'no'),
(5, 1, 'Baingan Ka Bharta', 'Baingan Ka Bharta', '', '', 2, 0, 8, '', '', 'published', '', NULL, 'no'),
(6, 1, 'Spicy Gugara', 'Spicy Gugara', '', '', 3, 0, 12, '', '', 'published', '', NULL, 'no'),
(7, 1, 'Sev Tamatar Ki Sabzi', 'Sev Tamatar Ki Sabzi', '', '', 3, 0, 25, '', '', 'published', '', NULL, 'no'),
(8, 1, 'Bharma Bhindi', 'Bharma Bhindi', '', '', 1, 0, 16, '', '', 'published', '', NULL, 'no'),
(10, 2, 'Omlet', 'Omlet', '<p>Take two eggs and fodo it in a bowl<br />Then fdsf dsfsdfsdf dsfsdf dsfdsfsdf sdfdsf dsfdsf <br />Fsfdsf sdfdsf dsfdsf sdfdsf <strong>dfsdf sdffdsf sdf </strong>fsdfsdf.</p>', '', 2, 0, 0, '', '', 'published', '', 'fsdfsdsdfsfsf,sfsfsdfsdfsfsf,dsfsfsfsffsdfsdf,sdfsdfsdfsff,sdfsfsdfsfsfs,dfsdfsdfsfsfsdf', 'yes'),
(12, 4, 'Vegetable Cheese Pasta', 'Vegetable Cheese Pasta', '<h3>How to boil pasta?&nbsp;</h3>\r\n<p style="padding-left: 30px;">First boil pasta with 3 bowls of water. Add 1-2 tbs oil in it and boil it for 10-15 minutes till pasta expands and becomes soft. Then blanch the pasta from hot water and then add cold water in it and again blanch from it and toss with 1-2 tsp oil.</p>\r\n<h3>How to make veggies?</h3>\r\n<p style="padding-left: 30px;">Take a pan . add 1-1.5 tbs butter and 1 tbs oil in it on low flame. Then add garlic in it and saute for half a minute. Add onions and saute for 2-3 minutes and then add capsicums (red, Green &amp; yellow) and again saute for 2 minutes. Lastly add tomatoes and saute it on medium flame. And add 1 tsp chilly flakes , 1 tbs&nbsp;oregano , 1/2 tbs red chilly powder , 1/2 tsp black pepper powder , 1/2-1 tsp pasta masala (optional) , salt to taste. Mix it well and cover it for 2 minutes and then remove from stove and keep it aside.&nbsp;</p>\r\n<h3>How to make white sauce?&nbsp;</h3>\r\n<p style="padding-left: 30px;">Take a pan . add 2 tbs butter and 1 tbs oil in it on low flame. Then add 2 tbs maida flour and mix it well and add 2-3 cups of milk in it and stir well (make sure that it does not make lumps). Then add 1/2 tsp black pepper powder , 1/2 tsp chilly flakes , 1/2 tsp oregano , 1/2 tsp red chilly powder and salt to taste. Grate 1 cheese cube in it and stir well and leave it till sill comes up. then off the flame.&nbsp;</p>\r\n<p style="padding-left: 30px;">&nbsp;</p>\r\n<p>finally&nbsp;mix pasta with veggies properly and keep it aside.</p>', '<p>Plate a mixture of pasta and veggies and pour white sauce on it according to taste. Add little tomato ketchup (optional) on it according to taste and serve..</p>', 2, 0, 1, '45 mins', '2', 'published', '', '1 bowl pasta , butter , oil , 1/2 tbs garlic chopped , 1 onion diced , 1 red capsicum , 1 yellow capsicum and 1 green capsicum (all diced) , 1 tomato diced , chilly flakes , oregano , red chilly powder , black pepper , pasta masala (if available) , salt , milk , cheese.', 'no'),
(15, 2, 'Cheese Egg Roll', 'Cheese egg roll is made of cheese and garlic mixture put on the bread slices and then deep fried.', '<h3><strong>How to make cheese egg roll?&nbsp;</strong></h3>\r\n<ul>\r\n<li>Mix all the ingredients (except bread and oil) together in a bowl.&nbsp;</li>\r\n<li>Spread egg-cheese mixture on bread slice and keep aside.</li>\r\n<li>Heat oil in frying pan, carefully slide in the layered bread (mixture side down) into the hot oil. Fry for 2-3 minutes, then turn over to the other side. Fry untill golden brown on either side.&nbsp;</li>\r\n<li>drain excess oil on the absorbant paper and serve hot, on a bed of cabbage leaves and accompanied be tomato ketchup.</li>\r\n</ul>\r\n<h3>&nbsp;</h3>\r\n<p class="MsoNormal" style="margin-right: 7.5pt; margin-left: 43.5pt; text-indent: -0.25in; line-height: 200%; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><!-- [if !supportLists]--></p>', '', 2, 0, 2, '30 mins', '2', 'published', '', '2 Eggs , 4 Bread slices , 4 tbsp cheese , 3 tbsp (level) Cornflour , 1 tsp Chilli powder , 1 (small) onion , 2 green chillies , 1 tsp Garlic paste , Green coriander , 2 tbsp leaves , Oil for shallow frying.', 'no'),
(16, 6, 'Tomato Oats', 'Tomato Oats is medium spicy and little sweet dish with little sour taste due to tomato.', '<h3>How to make Tomato Oats?&nbsp;</h3>\r\n<ul>\r\n<li>Heat 1-2 tbs oil in a pan. Add 1/2 tbs ginger-garlic paste and saute for 1/2 a minute.&nbsp;</li>\r\n<li>Now add onion and saute for 1-2 minutes. then add capsicum in it again saute for 1/2 a minute. then add tomato and mix properly.</li>\r\n<li>Now add 1/2 tbs black pepper powder , 1/2 tbs red chilly power , pinch of turmeric powder , 1/2 tbs garam masala (optional) and mix well.&nbsp;</li>\r\n<li>Now add&nbsp;1 packet saffola Masala Oats Peppy Tomato flavour in it and mix well. Now immediately add 2 glass (or 2 packets*) of water in it and stir for 2-3 minutes. Add tomato ketchup (optional).</li>\r\n<li>After the mixture will get little thick, remove from stove and serve hot.</li>\r\n</ul>', '<p><span style="font-family: Verdana, sans-serif; font-size: 8.5pt; line-height: 115%;">packet = black colour marking is done on packet of saffola oats</span></p>\r\n<p class="MsoNormal">&nbsp;</p>', 2, 0, 0, '20 mins', '2', 'published', '', '1 packet saffola Masala Oats Peppy Tomato flavour , black pepper powder , red chilly powder , turmeric powder , salt , garam masala (optional) , 1/2 capsicum chopped , 1/2 onion chopped , 1/2 tomato chopped , ginger-garlic paste , oil , tomato ketchup (optional) , water.', 'no'),
(17, 6, 'Tasty Noodles', 'Tasty Noodles', '<div>\r\n<h3>How to boil green peas?&nbsp;&nbsp;</h3>\r\n<ul>\r\n<li><span style="font-size: 8.5pt; line-height: 115%;">Take 1 bowl of green peas in pan and add 1-2 glass of water and boil for 10-15 minutes on stove on medium flame. It will get little soft.</span></li>\r\n</ul>\r\n</div>\r\n<h3>How to cook Tasty Noodles? &nbsp;</h3>\r\n<ul>\r\n<li>Heat 1-1<sub><sup>1/2</sup></sub>&nbsp;tbs butter and 1 tbs oil in a pan. Add 1 tbs garlic-ginger paste and green chilly paste and saute it for 5-10 seconds.&nbsp;</li>\r\n<li>Add onion and saute for 1/2 a minute. Now add capsicum and saute for 1/2 minute. Add 1 bowl of green peas in it and mix well.</li>\r\n<li>Add 1 packet of noodles in it and saute for 1/2-1 minute. Add tomato and mix well.</li>\r\n<li>Add 1/2 tbs red chilly powder , 1/2 tbs black pepper powder , 1/2 tbs turmeric powder , 1 packet maggi masala , salt to taste , 1/4 tbs sugar in it and mix well.&nbsp;</li>\r\n<li>Immediately add 1 glass (or 1<sup><sub>1/2</sub></sup>-2 glass*) of water and mix all the ingredients well.&nbsp;</li>\r\n<li>Cover the lid and leave it for 2-3 minutes on medium flame.&nbsp;</li>\r\n<li>Finally add 1 tbs of tomato ketchup (optional) and mix well and serve hot.&nbsp;\r\n<p class="MsoNormal">&nbsp;</p>\r\n</li>\r\n</ul>', '<p>1<sup><sub>1/2</sub></sup>-2 glass = For consistancy of gravy one wants. &nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 2, 0, 1, '20 mins', '2', 'published', '', '1 noodles packet , 1 tomato chopped, 1 capsicum chopped , 1 onion chopped , 1 bowl green peas boiled , garlic-ginger paste , green chilly paste , red chilly powder , black pepper powder , turmeric powder , maggi masala , butter , oil , sugar , water , salt  , tomato ketchup', 'no'),
(18, 1, 'jkhj', 'jhg', '<p>khkj </p>', '<p>jggh </p>', 1, 0, 0, '', '', 'published', '', 'jgj', 'yes'),
(19, 2, 'Egg Cutlet', 'Egg Cutlet is spicy dish with red gravy.', '<h3><strong>How to make gravy?&nbsp;</strong></h3>\r\n<ul>\r\n<li>Heat a pan with 1 tbs of butter with 1 tbs of oil in it. Add onion and saute it for 1 minute and then add tomato and saute it for 1/2 a minute.&nbsp;</li>\r\n<li>Add 1 bowl (or 50-60 grams) of coriander leaves in it and mix well.&nbsp;</li>\r\n<li>Now add 1 tbs red chilly powder , 1/2 tbs turmeric powder, salt to taste , 1/2 tbs kitchen king masala , 1/2 tbs garam masala and mix well.&nbsp;</li>\r\n<li>Add 1/2-1 cup of water if required as gravy should be little thick.</li>\r\n<li>Stir the mixture for 2 minutes and remove from stove and keep it aside.&nbsp;</li>\r\n</ul>\r\n<h3>&nbsp;<strong>How to make egg cutlet?</strong></h3>\r\n<ul>\r\n<li>Break 3-4 eggs in a bowl and add 1 tbs green chilly paste , 1 tbs garlic-ginger paste , 1/2 bowl (or 10-20 grams) of coriander leaves , 1/2 tbs red chilly powder , 1/2 tbs turmeric powder , salt to taste and mix well.&nbsp;</li>\r\n<li>Take a pan and add heat 2 tbs butter and 1 tbs oil.&nbsp;</li>\r\n<li>Pour the mixture in it and spread wholly in a pan. After little omlet gets ready, Grate 1 cheese cube on omlet. Now roll the omlet and give heat for 1/2-1 minute.&nbsp;</li>\r\n<li>Take that roll in a plate and cut that roll in square shape.</li>\r\n</ul>', '<h3><strong>How to serve? </strong></h3>\r\n<ul>\r\n<li>Plate 1 egg cutlet and pour gravy on it and grate 1/2 boiled egg on it and garnish with coriander leaves and serve hot.</li>\r\n</ul>', 3, 0, 1, '45 mins', '4', 'published', '', '3-4 raw eggs , 1-2 boiled eggs , green chilly paste , garlic-ginger paste , coriander leaves chopped , red chilly powder , turmeric powder , salt , butter , oil , cheese cube , 1 onion finely chopped , 1 tomato finely chopped , kitchen king masala , garam masala powder.', 'no'),
(20, 1, 'Aaloo Shimla Mirch', 'Aaloo Shimla Mirch is a spicy dish and eaten with chapatti.', '<h3>How to cook Aaloo Shimla Mirch?</h3>\r\n<ul>\r\n<li>Take 1 sp of oil in pan. After it gets hot, add cumin seeds and asafetida in it.&nbsp;</li>\r\n<li>After 1/2 a minute, add potatos in it. Now add turmeric powder , green chillies , red chilly powder , coriander leaves powder and mix well.</li>\r\n<li>After potato gets simmer well, add capsicum and salt to taste and mix properly and saute the mixture for 2-3 minutes.</li>\r\n<li>Add 1 sp of water if reqiured and let the mixture simmer covering the pan.</li>\r\n<li>Lastly, add raw mango powder , garam masala powder and mix properly.</li>\r\n<li>Garnish with coriander leaves and serve hot with chapatti.</li>\r\n</ul>', '<h3><strong>How to cut vegetables?</strong></h3>\r\n<ol>\r\n<li>capsicum should be diced and seeds should be removed from it.&nbsp;</li>\r\n<li>potato should be first peeled and then diced.</li>\r\n</ol>', 2, 0, 2, '45 mins', '2', 'published', '', '250 grams green capsicum diced , 250 grams potato diced , 1/4 tbs cumin seeds (jeera) , 1/4 tbs red chilly powder , 1/4 tbs turmeric powder , 1/4 tbs raw mango powder (aamchur powder) , 1/4 tbs coriander leaves powder , 1/4 tbs garam masala powder , 2 small green chillies chopped , oil , pinch of Asafetida (hing) , 1 sp coriander leaves finely chopped , salt.', 'no'),
(21, 1, 'hkjh', 'kjhkjh', '<p>kjhkh</p>', '<p>jhkj</p>', 0, 0, 0, '', '', 'published', '', 'kjhkjh', 'yes'),
(22, 5, 'Vegetable Toast Sandwich', 'Vegetable Toast Sandwich-1', '<h3>How to make stuffing of sandwich?&nbsp;</h3>\r\n<ul>\r\n<li>Heat 3 sp of butter with 2 tbsp of oil in pan. Add all the vegetables one by one (capsicum , cabbage , carrots and beet) and saute for 5-7 minutes.</li>\r\n<li>Add 2 tbs green chilly paste , 2 tbs&nbsp;black pepper powder , 2 tbs garam masala powder , salt to taste , 2 tbs sandwich masala powder and mix well. Remove from pan and keep aside and let it cool.&nbsp;</li>\r\n<li>Now boil potatoes and peel it and mash it. and add to above mixture of vegetables. Stuffiing is ready. stuffing should be little more spicy.&nbsp;</li>\r\n</ul>\r\n<h3>How to make sandwich?&nbsp;</h3>\r\n<ul>\r\n<li>Place 2 slice bread in plate. Apply butter on one side of each bread.&nbsp;</li>\r\n<li>Now put appropriate amount of stuffing on one bread where butter is applied.&nbsp;</li>\r\n<li>Put another bread above stuffing facing butter over stuffing.&nbsp;</li>\r\n<li>Put this in&nbsp;sandwich maker&nbsp;until the bread turns crispy and brown.</li>\r\n<li>Serve&nbsp;with ketchup and green chatni.</li>\r\n</ul>', '<p>can also add cheese if needed.</p>', 2, 0, 2, '45 mins', '4', 'published', '', '3 potatoes boiled , 1 beet grated, 1 capsicum finely chopped, 1/2 cabbage finely chopped , 1-2 carrots finely chopped , butter , oil , salt to taste , green chilly paste , black pepper powder , garam masala powder , sandwich masala powder , 1 packet slice bread', 'no'),
(23, 4, 'Garlic Bread', 'Garlic Bread', '<h3>How to make&nbsp;toppings for Garlic Bread?</h3>\r\n<ul>\r\n<li>Take a pan .Add 1-1.5 tbs butter and 1 tbs oil in it on low flame. Then add garlic in it and saute for half a minute. Add onions and saute for 2-3 minutes and then add capsicums (red, Green &amp; yellow) and again saute for 2 miutes. Lastly add tomatoes and saute it on medium flame. and add 1 tbs chilly flakes , 1 tbs&nbsp;oregano , 1/2 tbs red chilly powder , 1/2 tbs&nbsp;black pepper powder , salt to taste. Mix it well and cover it for 2 minutes and then remove from stove and keep it aside. &nbsp;</li>\r\n</ul>\r\n<h3>How to make Garlic Bread?&nbsp;</h3>\r\n<ul>\r\n<li>Take 3-4 sliced bread and apply butter on one side of each bread.&nbsp;</li>\r\n<li>Take a pan and toast one side of sliced bread where butter is applied til golden brown.&nbsp;</li>\r\n<li>Remove from pan and place in plate facing toasted side upwords. Now put toppings on each bread and grate cheese on it.&nbsp;</li>\r\n<li>Now heat the pan with little amount of buuter and oil and place the bread with toppings in pan and cover it for 2-3 minutes. Let the surface gets golden brown and cheese gets melt.&nbsp;</li>\r\n<li>Garlic Bread is ready. Serve with ketchup.</li>\r\n</ul>\r\n<p style="padding-left: 30px;">&nbsp;</p>', '<p>Can add boiled pasta as toppings also.</p>', 2, 0, 1, '45 mins', '2', 'published', '', 'butter , oil , 2 sp garlic chopped , 1 onion diced , 1 red capsicum , 1 yellow capsicum and 1 green capsicum (all diced) , 1 tomato diced , chilly flakes , oregano , red chilly powder , black pepper , salt , cheese , sliced bread', 'no'),
(24, 2, 'Cheese Omelette', 'Cheese Omelette', '<h3>How to make cheese omelette:</h3>\r\n<ul>\r\n<li>Beat the eggs thoroughly along with the salt, green chillies , red chilly powder , ginger-garlic paste and the black pepper powder.</li>\r\n<li>Melt the butter and then add oil in a non stick pan over a low flame.</li>\r\n<li>Add the beaten eggs . spread evenly around the pan and sprinkle the grated cheese on top.</li>\r\n<li><span style="line-height: 200%; text-indent: -0.25in;">Cook on one side till the egg is cooked. Fold the egg into half and remove from the flame. Serve hot.</span></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '<p>Omelette can be eaten with bread or roti/chapatti.</p>', 1, 0, 1, '10 mins', '2', 'published', 'http://makemypublicity.com/DesiKitchen/dishpics/1.jpg', '2 Eggs , 1/2 cup grated Cheese , 1 chopped Green Chilli (Hari mirch) , 1/2 tbs red chilly powder , 1 tbs ginger-garlic paste , Salt to taste , 1 tbs Butter , 1/2 tbs oil , 1 tbs black pepper powder', 'no'),
(25, 2, 'Egg Toast', 'Egg Toast', '<h3>How to make Egg Toast?&nbsp;</h3>\r\n<ul>\r\n<li>Beat the eggs and add milk, chopped onions, tomatoes, green chilies, coriander, salt &amp; chili powder.</li>\r\n<li>Beat the mixture until foamed.</li>\r\n<li>Heat oil in a frying-pan or griddle.</li>\r\n<li>Dip bread slice in the mixture and coat it evenly and fry over low flame.</li>\r\n<li>Fry on both sides until done. Repeat the same for other slices.</li>\r\n<li>Serve egg toast hot with ketchup.</li>\r\n</ul>', '', 1, 0, 2, '20 mins', '2', 'published', '', '2 eggs , 2-3 slices of Bread , 1/2 onion (finely chopped) , 1/2 tomato (finely chopped) , 1-2 green chilies (finely chopped) , 2 tbsp chopped coriander leaves , Salt To Taste , 1 tbsp milk , 1/2 tsp red chili powder or to taste , Oil to fry', 'no'),
(26, 2, 'Vegetable Egg Omelette', 'Egg Toast', '<h3>How to make Egg Toast?&nbsp;</h3>\r\n<ul>\r\n<li>Beat the eggs and add milk, chopped onions, tomatoes, green chilies, coriander, salt &amp; chili powder.</li>\r\n<li>Beat the mixture until foamed.</li>\r\n<li>Melt the butter and then add oil in a non stick pan over a low flame.</li>\r\n<li>Add the beaten eggs mixture . Spread evenly around the pan and sprinkle the grated cheese on top.</li>\r\n<li><span style="line-height: 200%; text-indent: -0.25in;">Cook on one side till the egg is cooked. Fold the egg into half and remove from the flame. Serve hot.</span></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '', 1, 0, 2, '20 mins', '2', 'published', '', '2 eggs , 1/2 onion (finely chopped) , 1/2 tomato (finely chopped) , 1-2 green chilies (finely chopped) , 2 tbsp chopped coriander leaves , Salt To Taste , 1 tbsp milk , 1/2 tsp red chili powder , 1/2 tsp black pepper powder , 1 tbs butter , 1  tsp oil , 1/2 cup grated cheese', 'no'),
(35, 1, 'Masala Rice', 'kkjh', '<p>hkhkjhjkh</p>', '<p>kjkjh</p>', 1, 0, 0, '', '', 'published', '', 'kjhjkh', 'yes'),
(36, 1, 'Cheese Omlet', 'testing', '<p>testing</p>', '<p>testing</p>', 2, 0, 0, '', '', 'published', '', 'testing', 'yes'),
(37, 2, 'Half-Fry', '', '<p>erwr</p>', '', 0, 0, 0, '', '', 'published', '', '2 eggs , salt to taste , 1/2 tsp black pepper powder , 1/2 tbs red chilly powder , 1/4 tbs green chilly paste , 1/4 tbs garllc-ginger paste , 1/2 tbs garam masala powder , 3-4 tblsp', 'yes'),
(38, 2, 'Half-Fry Egg', 'Half-Fry Egg', '<h3>How to make Half-Fry Egg?&nbsp;</h3>\r\n<ul type="disc">\r\n<li>&nbsp;Take oil in pan, Keep Stove on slow heat, Break Eggs into half and pour it into the pan when oil is not Hot.</li>\r\n<li>Sprinkle a little salt and black&nbsp;pepper powder , red chilly powder ,&nbsp;green chilly paste , garllc-ginger paste , garam masala powder on it.&nbsp;</li>\r\n<li>Now&nbsp;Cook Egg yellow by taking oil from pan in spoon and continue to pour over the Egg. Dont let break the Egg yellow, till the egg yellow is semi-cook.</li>\r\n<li>Carefully remove Half fried Egg from pan and put in Plate.&nbsp;</li>\r\n<li>Serve with bread.</li>\r\n</ul>', '', 2, 0, 0, '', '', 'published', '', '2 eggs , salt to taste , 1/2 tsp black pepper powder , 1/2 tsp red chilly powder , 1/4 tsp green chilly paste , 1/4 tsp garllc-ginger paste , 1/2 tsp garam masala powder , 3-4 tbs oil ', 'yes'),
(39, 2, 'Half-Fry Egg', 'Half-Fry Egg', '<h3>How to make Half-Fry Egg?&nbsp;</h3>\r\n<ul type="disc">\r\n<li>Take oil in pan, Keep Stove on slow heat, Break Eggs into half and pour it into the pan when oil is not Hot.</li>\r\n<li>Sprinkle a little salt and black&nbsp;pepper powder , red chilly powder ,&nbsp;green chilly paste , garllc-ginger paste , garam masala powder , cumin-coriander* powder on it.&nbsp;</li>\r\n<li>Now&nbsp;Cook Egg yellow by taking oil from pan in spoon and continue to pour over the Egg. Dont let break the Egg yellow, till the egg yellow is semi-cook.</li>\r\n<li>Carefully remove Half fried Egg from pan and put in Plate.&nbsp;</li>\r\n<li>Serve with bread.</li>\r\n</ul>', '<p>cumin-coriander powder = dhana-jeeru powder</p>', 2, 0, 4, '10 mins', '2', 'published', 'http://makemypublicity.com/DesiKitchen/dishpics/6.jpg', '2 eggs , salt to taste , 1/2 tsp black pepper powder , 1/2 tsp red chilly powder , 1/4 tsp green chilly paste , 1/4 tsp garllc-ginger paste , 1/2 tsp garam masala powder , 1/4 tsp cumin-coriander powder , 3-4 tbs oil', 'no'),
(40, 2, 'Sundae Mondae Half-Fry Egg', '', '<h3>How to make Sundae Mondae Half-Fry Egg?&nbsp;</h3>\r\n<ul type="disc">\r\n<li>Take 3-4 tbs oil in pan, Keep Stove on slow heat, Break Eggs into half and pour it into the pan when oil is not Hot.</li>\r\n<li>Sprinkle a little salt and black&nbsp;pepper powder on it.</li>\r\n<li>Now&nbsp;Cook Egg yellow by taking oil from pan in spoon and continue to pour over the Egg. Dont let break the Egg yellow, till the egg yellow is semi-cook.</li>\r\n<li>Carefully remove Half fried Egg from pan and put in aside.</li>\r\n<li>Now take another pan and heat 1 Tbs of Oil, saute paste of garlic-Ginger and green chilly for 1/2 minute. Add Turmeric powder. Add Tomato, Cumin-Coriander powder, garam masala in it and mix well. When tomato is done, add chopped fresh green garlic. Now it will be a kind of thick gravy. Pour it over Half-fried Eggs. Garnish with fresh coriander leaves and serve hot with bread.</li>\r\n</ul>', '', 2, 0, 0, '15 mins', '2', 'published', 'http://makemypublicity.com/DesiKitchen/dishpics/2.jpg', '2 eggs , salt to taste , pinch of black pepper powder , 1/2 tsp green chilly paste , 1/4 tsp garllc-ginger paste , 1/4 tsp garam masala powder , 1/4 tsp cumin-coriander powder , oil , 1 tomato , 1/4 tsp turmeric powder , 2 fresh green garlic (optional)', 'no'),
(41, 1, 'Toast Sandwich', 'Vegetable Toast Sandwich-2', '<h3>How to make paste for applying on bread?&nbsp;</h3>\r\n<ul>\r\n<li>Mix tomato ketchup and red chilly sauce in a bowl in a ratio of 3:1 respectively.</li>\r\n</ul>\r\n<h3>How to make sandwich?&nbsp;</h3>\r\n<ul>\r\n<li>Place 2 slice bread in plate. Apply butter and paste on one side of each bread.&nbsp;</li>\r\n<li>Now put 1 layer of tomatoes&nbsp;on one bread , now put another layer of cucumber and then another layer of potatoes where butter is applied.&nbsp;</li>\r\n<li>Sprinkle salt to taste , 1/4 tsp black pepper powder , 1/4 tsp red chilly powder , 1/4 tsp sandwich masala powder , 1/4 tsp garam masala powder. Now sprinkle grated cheese on it.&nbsp;</li>\r\n<li>Put another bread above stuffing facing butter and paste over stuffing.&nbsp;</li>\r\n<li>Put this in&nbsp;sandwich maker&nbsp;until the bread turns crispy and brown.&nbsp;</li>\r\n<li>Serve with ketchup and green chatni.</li>\r\n</ul>', '', 2, 0, 1, '30 mins', '4', 'published', '', '1 packet slice bread , 2-3 tomatoes sliced , 2-3 cucumber sliced , 2-3 potatoes boiled and sliced , salt to taste , black pepper powder , red chilly powder , sandwich masala powder , garam masala powder , tomato ketchup , red chilly sauce , 2-3 cubes grated cheese , butter.', 'no'),
(42, 2, 'Mexican Eggs', 'Mexican Eggs', '<h3>How to make Mexican Eggs?&nbsp;</h3>\r\n<ul>\r\n<li>Take a pan and heat 1 tbsp butter and 3 tbsp oil in it. Add 2-3 tsp ginger-garlic paste and saute for 1/2 a minute on medium flame.&nbsp;</li>\r\n<li>Now add onions and saute it until it gets soft for approx 5 minutes. Then add cdapsicum and saute it for 3-4 minutes. Now add tomatoes and again saute it for 2-3 minutes.&nbsp;</li>\r\n<li>Add 2 tsp green chilly paste , 1/2 tsp black pepper powder , 1/2 tsp red chilly powder , salt to taste , 1/2 tsp garam masala powder , 1/2 tsp egg masala powder (optional) and mix well.&nbsp;</li>\r\n<li>Add the stock. Reduce heat to low and simmer for 5 minutes or until the mixture thickens.&nbsp;</li>\r\n<li>Now grate the cheese on it.</li>\r\n<li>Crack 1 egg into a small cup. Use the back of a spoon to make a hollow in the sauce. Pour in the egg. Repeat with the another&nbsp;egg. Cook for 2-3 minutes or until the eggs are set.</li>\r\n<li>Garnish with parsley*.</li>\r\n<li>Serve it with toast.</li>\r\n</ul>', '<p>parsley* = coriander leaves</p>', 2, 0, 0, '20 mins', '2', 'published', 'http://makemypublicity.com/DesiKitchen/dishpics/7.jpg', '2 eggs , 2 onions finely chopped , 2 tomatoes finely chopped , 1 capsicum finely chopped , red chilly powder , black pepper powder , garam masala powder , egg masala powder (optional) , garlic-ginger paste , green chilly paste , salt to taste , butter , cheese , oil', 'no'),
(43, 1, 'Dal-Dhokli', '', '<h3>How to make Dal-Dhokli?&nbsp;</h3>\r\n<ul>\r\n<li>Rinse 2 cups toovar dal in running water and add it in the 3/4 liter steel or aluminum pressure cooker. Add 1&frac12; cups water and salt in it. Close the lid and pressure-cook it over medium flame for 7-8-whistles. Remove cooker from flame and let it stand idle until pressure subsides naturally for approx. 5-7 minutes.</li>\r\n<li>While dal is cooking, prepare dough for dhokli. Take 1/2 cup wheat flour, 1/4 tsp turmeric powder, 1/2 tsp green chilli paste, 1/2 tsp ginger-garlic paste , 1/2 tsp coriander powder, 1-tsp oil and salt in a wide mouthed bowl. Add water as required in small quantities and knead a little stiff but smooth dough (like paratha dough). Cover with a cloth and let it settle for 20-30 minutes.</li>\r\n<li>Open the lid of pressure cooker and transfer dal to a deep bowl or just keep it inside the cooker and mix it into smooth puree using hand blender (<span lang="EN">Churn dasher</span><span lang="EN">)</span>. Add 2-3-cups water and blend again for 5-10 seconds.&nbsp;</li>\r\n<li>Heat 2-tsp oil and 2 tsp ghee in a large kadai or pan over medium flame. Add cumin seeds and allow them to sizzle. Add 1 tbsp ginger-garlic paste and saute it for &frac12; a minute. Add 1/4 tsp turmeric powder and mix well.&nbsp;</li>\r\n<li>Add pureed dal and salt. Bring it to boil over medium flame and then reduce flame/heat to low and cook for 5-7 minutes and add 1/2 bowl of mint leaves finely chopped and stir properly.&nbsp;</li>\r\n<li>Meanwhile, divide dough into 4-equal portions and give them a round shape. Take one dough ball, give it a shape like pattie and put it over rolling board. Dust little flour, roll it out into a thin circle of 7-8 inch diameter and transfer to a plate. Repeat the step for remaining dough balls.&nbsp;</li>\r\n<li>Take one rolled circle over rolling board and cut it into multiple small diamond shapes using knife or cutter. These pieces are known as &ldquo;Dhokli&rdquo;.&nbsp;</li>\r\n<li>Slowly add all diamond shaped pieces (12-14 pieces at a time) into boiling dal and increase flame to medium and cook for a minute or two. Add next batch of diamond shaped pieces after 1-2 minutes. Stir occasionally in between.&nbsp;</li>\r\n<li>Repeat the process with remaining rolled circles, cut them into pieces and add into dal. After adding all pieces, cook them over medium flame until dhokli does not taste raw, about 8-10 minutes. Stir occasionally in between.&nbsp;</li>\r\n<li>Turn off flame and transfer it to a serving bowl or deep serving plate. Garnish with fresh coriander leaves and serve hot or warm.</li>\r\n</ul>', '', 2, 0, 1, '60 mins', '6', 'published', '', 'toovar dal , wheat flour for dough , turmeric powder , green chilly paste , ginger-garlic paste , coriander powder , salt to taste , oil , cumin seeds , mint leaves finely chopped , coriander leaves for garnishing , water as required.', 'no'),
(46, 1, 'Locho', '', '<h3>How to make batter of Locho?&nbsp;</h3>\r\n<ul>\r\n<li>Soak chana daal , rice , urad daal for 5-7 hours differently and then grind them in grinder machine properly and remove it in air tight container.</li>\r\n<li>Grind green chillies and ginger in grinder mchine and add in that container.&nbsp;</li>\r\n<li>Add soda-by-carb powder in it and make batter like batter of indada.</li>\r\n<li>Now add 1/2 tsp turmeric powder and salt to taste and mix well and leave it aside overnight.&nbsp;</li>\r\n</ul>\r\n<h3>How to make Locho?&nbsp;</h3>\r\n<ul>\r\n<li>Take a dish of indada cooker and grease oil properly in it and add 2-3 tbsp of batter in it and keep it in cooker and heat it for 7-8 minutes.&nbsp;</li>\r\n<li>After it is done , spread batter/khiru on it and sprinkle grated cheese and mixture of (chat masala , red chilly powder and black salt) on it and serve hot.</li>\r\n</ul>', '', 2, 0, 0, '10 mins', '4', 'published', '', 'For making batter/khiru of Locho: \r\n1 bowl chana daal , 1/3 bowl rice , 1/2 bowl urad daal , 1/2 tsp soda-by-carb , 7-8 green chilly , 1 ginger , 1 tsp turmeric powder , salt to taste , 2 tbsp curd , oil\r\n\r\nFor garnishing: \r\n1 tsp red chilly powder , 1 tsp chat masala , 1/2 tsp black salt , butter , grated cheese.', 'no'),
(47, 1, 'Tomato Rice', '', '<h3>How to make Rice?&nbsp;</h3>\r\n<ul>\r\n<li>Soak Rice for 2 hours in water.</li>\r\n<li>Take a big bowl and boil water. After it gets boil , add rice in it and add salt to taste and boil it partially.</li>\r\n<li>Now blanch this rice from hot water and keep it aside for becoming cold.&nbsp;</li>\r\n</ul>\r\n<h3>How to make Tomato Rice?&nbsp;</h3>\r\n<ul>\r\n<li>Heat a oil and ghee in a pan and roast cinnamon stick , cloves , bay leaf , black pepper , star anise and cumin seeds to splutter.&nbsp;</li>\r\n<li>Now add garlic-ginger paste and saute it for 1/2 a minute.</li>\r\n<li>Add onions and saute it for a minute and then add capsicum in it and again saute it for 2-3 minutes.&nbsp;</li>\r\n<li>Add tomatoes in it and saute it for 2 minutes. </li>\r\n<li>Add salt to taste , green chilly paste , red chilly powder , turmeric powder in it and mix well.</li>\r\n<li>Now add rice in it. Cover the pan for 2 minutes oe untill water of tomato gets vapour up.&nbsp;</li>\r\n<li>Now add cashew nuts and coriander leaves to garnish and serve hot.</li>\r\n</ul>', '', 2, 0, 0, '60 mins', '4', 'published', '', '1 small bowl rice , salt to taste , 1 tbs oil , 1 tbs ghee , 1 cinnamon stick , 2-3 cloves , 1-2 bay leaf , 2-3 black pepper , 1 star anise and 1 tsp cumin seeds , 1 tsp garlic-ginger paste , 1 onion sliced , 1 capsicum diced , 2-3 tomatoes diced , 1-2 tsp green chilly paste , 1 tsp red chilly powder , 1/2 tsp turmeric powder , 3-4 cashew nuts , 1 tbs coriander leaves chopped.', 'no'),
(48, 1, 'Cold Coco', '', '<h3>How to make Cold Coco?</h3>\r\n<ul>\r\n<li>Heat the milk and add coco powder and custard powder in it and mix well. Now stir the mixture for 2-3 minutes til the gravy gets thickenned and let it boil. Remove the mixture from stove and keep it aside. </li>\r\n<li>Add sugar in it and mix it properly. Keep it idle till the mixture gets cool down.</li>\r\n<li>Now keep the mixture in refrigerator for 7-8 hours and serves chill in a glass with cashew nuts and malai.</li>\r\n</ul>', '<h3>For Garnishing:</h3>\r\n<ul>\r\n<li>Add 1 tsp cashew nuts and 1 tsp malai in each glass.</li>\r\n</ul>', 0, 2, 0, '15 mins', '4', 'published', '', '1 liter milk , 1 tbs coco powder , 1 tbsp custard powder , 2-3 tbsp sugar , 1 tbs malai , 2-3 tbs cashew diced.', 'no'),
(49, 1, 'Dal-Fry', '', '<h3>How to make Dal-fry?</h3>\r\n<ul>\r\n<li>Soak toovar dal for 30 minutes in a bowl.</li>\r\n<li>Take 3/4 liter steel or aluminum pressure cooker and heat 2 tbs oil in it. Roast cinnamon stick , cloves , bay leaf , black pepper , star anise and cumin seeds to splutter.</li>\r\n<li>Add 1 tbsp ginger-garlic paste and saute it for &frac12; a minute.</li>\r\n<li>Add onions and saute it for 1/2 a minute. Now add capsicum in it and again saute it for 1/2 a minute. Add tomatoes and saute it for 1/2 a minute again.</li>\r\n<li>Add turmeric powder , green chilly paste , garam masala powder , salt to taste , red chilly powder , black pepper powder in it and mix it propery.</li>\r\n<li>Now add dal in above mixture and mix well. Add 3 cups water in it.</li>\r\n<li>Now Close the lid and pressure-cook it over medium flame for 7-8-whistles. Remove cooker from flame and let it stand idle until pressure subsides naturally for approx. 5-7 minutes.</li>\r\n<li>Open the lid of pressure cooker and transfer dal to a deep bowl or just keep it inside the cooker and mix it into smooth puree using hand blender (<span lang="EN">Churn dasher</span><span lang="EN">)</span>. If required add litlle amount of water in it.</li>\r\n<li>Now turn on the stove to medium flame and add 1-2 tbs malai in it and mix it and keep it on gas stove for a minute.</li>\r\n<li>Dal-Fry is ready to serve.</li>\r\n</ul>', '<p>Dal-Fry can be eaten with roti/chapatti.</p>', 1, 0, 0, '30 mins', '4', 'published', '', '1 Â½ cup toovar dal , 1 cinnamon stick , 2-3 cloves , 1 bay leaf , 2-3 black pepper , 1 star anise and 1 tsp cumin seeds , 1 tsp garlic-ginger paste , 1 onion sliced , 1 capsicum diced , 1 tomatoes diced , 1-2 tsp green chilly paste , 1 tsp red chilly powder , 1/2 tsp turmeric powder , 1/2 tsp black pepper powder , 1/2 garam masala powder , salt to taste , 1-2 tbs malai.', 'no'),
(50, 1, 'Fish Tomato Sabji', '', '', '', 2, 0, 0, '', '', 'draft', '', '250 grams tomato , a bud of garlic , 8-10 black pepper , 1 tbsp cumin seeds , 1 tbsp coriander powder , 1 tbsp cumin powder , 1 tbsp turmeric powder , 1 tbsp red chilly powder , 1 tsp green chilly paste , 1 tsp lemon juice , 1-2 tbsp Sorghum flour , 1-2 tbsp coriander leaves finely chopped , salt to taste , oil , water.', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE IF NOT EXISTS `favourites` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `users_id` mediumint(9) DEFAULT NULL,
  `dishes_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `dishes_id` (`dishes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `users_id`, `dishes_id`) VALUES
(4, 126, 20),
(6, 137, 25),
(7, 125, 41),
(8, 148, 20),
(9, 148, 19),
(10, 134, 25),
(11, 134, 39),
(14, 137, 12),
(15, 137, 17),
(16, 137, 20),
(17, 137, 23),
(18, 137, 39),
(19, 137, 15),
(20, 123, 39),
(21, 123, 15);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `users_id` mediumint(9) DEFAULT NULL,
  `feedback` text,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `users_id`, `feedback`) VALUES
(11, 135, 'Baler app'),
(10, 126, 'Awesome!! Keep going!!');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `users_id` mediumint(9) NOT NULL,
  `dishes_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `dishes_id` (`dishes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `users_id`, `dishes_id`) VALUES
(3, 126, 20),
(5, 138, 22),
(6, 137, 25),
(7, 125, 41),
(8, 146, 39),
(9, 148, 19),
(10, 134, 25),
(11, 134, 39),
(12, 123, 22),
(13, 137, 12),
(16, 137, 17),
(17, 137, 23),
(18, 137, 39),
(19, 137, 15),
(20, 124, 15),
(21, 123, 39),
(22, 124, 43);

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE IF NOT EXISTS `tips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `tip` text NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `tips`
--

INSERT INTO `tips` (`id`, `title`, `tip`, `created_at`) VALUES
(33, 'How to treat hiccups?', 'Eat 3-4 leaves of radish when you get hiccups. It will go away.', '2015-09-29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `gcm_id` text,
  `device_id` varchar(20) DEFAULT NULL,
  `platform` varchar(10) DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_id` (`device_id`),
  UNIQUE KEY `device_id_2` (`device_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=163 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gcm_id`, `device_id`, `platform`, `mobile_number`, `gender`) VALUES
(121, NULL, NULL, 'APA91bH3ptM_VG7822-JNerVJD40-zqSyLb6xaQRDmf8iCgPUqyVJK6g82TD5ZTsLXF-Mdn17hA2ri1yO47lgSL0YsUj2svG44zwvuoZzqodkxnjG0F1Rb8TlfwhmiC11jUTure2H2mu', 'd2ee4fcdebc008b1', NULL, NULL, NULL),
(123, 'Karan', 'BHUTWALA', 'APA91bHxfOI2nnTn5TFrP80yuv4izt81TyjDHdvJOiES7kcJJ20WzC9IykEyUWigtiujE3bbC-H00clsaE4lG9j2gkaWQcPBvTVARGIVn0QcMp2i-bBQfGkUxHvIQSvgvBJG_lSlWUpV', '8fb1c956dca5eb78', NULL, '849140784', 'male'),
(124, 'Shreya', 'Gupta', 'APA91bGim4wWjapXVfrDtSZNHxlqsHZxGT15giDP5W2SSRXVXmV7MkOvBXOIatN2Tqi8gu811cor-AsJoDXT2UDyAGGH-q7INrfc9izVGdLyfa1Wt4LMjXOt1UqTVIz1ZrkRnuYkexZQ', 'b6f8d1c3e9f19283', NULL, '8390717522', 'female'),
(125, 'Vimal', 'jain', '', '5aa547dabd9cf37', NULL, '9765643995', 'male'),
(126, NULL, NULL, 'APA91bF0cE06wWRv7ArcV7cA25CxRrFUSn-ZaQ-QijdxkmNAob1Y5V0q2MHninffmcy8LeEECOMPqLrSuEy_YeORNRMPH1zV2GaRt9kCAX-u8oCpA9KB3CtX-ifjDQWbm2aCaQwiIoC6', '7b7cace43c5f5d8e', NULL, NULL, NULL),
(127, NULL, NULL, 'APA91bHZXkd82FIaOg133h-YtRqT3AY6y1myEncuzkzsaRlp9vgZsWlNUawYvoigjejbX5oY_IlLgdIE4zqKYGfe55BY0FraIXYKhECumMZrX0bhJ_XMxrCo3dBmDqGptG1rRe8w2em_', '238922b44e2ff61', NULL, NULL, NULL),
(128, 'Khushboo', 'Lalwala', '', '98dcbb214b6800', NULL, '7405330174', 'female'),
(129, NULL, NULL, 'APA91bFSx_7RYbRgy_8VLe03QJ6uLyU0QKBvDi_FGkBDFx-9vlK-loeSAmXbwUVREncUC55FiBppW3-G0Cz3N__FpRZOZRaljR4m0-FScnwecxq0EFOejI1_Y-aTVOm1P1KVw9uCDkYk', '63f09b15502974f9', NULL, NULL, NULL),
(130, NULL, NULL, '', '3dd75483ec240969', NULL, NULL, NULL),
(131, NULL, NULL, '', '8744fdac4fb89450', NULL, NULL, NULL),
(133, NULL, NULL, 'APA91bF0itZMpe502pfn76fXZAp2NBDNa0frEwZRXq6by9Ma49QPWpacKWPztOq43nAPqOvOYHElSzcc2-SplPrCabpoaelnXrktCrmICRylTyP5MsiaCnivPidr6YXQyXzXFYb-QB88', '15b92297ed3780a7', NULL, NULL, NULL),
(134, NULL, NULL, 'APA91bGtsyYQqP9IpJoMatZsrzTRFMTSeYajH0FotjOJyvnU5hh9vTvlD8W-6bsntHA6FgocfeJqXJfNJvcL74_12Mk7G1YBMCCmtf7gQ2G-IayInC6JlIGo-V58F2D2efNagJyPut7F', '813cb73caeb69892', NULL, NULL, NULL),
(135, NULL, NULL, 'APA91bFpYi4MRCk5W25MtS0G6RGq0YHjjNSfm34MRbLG-cgf_Np1tdh0JIWpPt_U5ZfpHFyrkQ4nOkLkRBk8NO9OdavP0nZvJpy75bq9ObErtt9GXv6VLcpD4lTp-rdlLvcotJ3LAb0H', 'c85e6577063d7116', NULL, NULL, NULL),
(137, 'DEEP', 'LUNIA', '', '2c0ea26a7c487761', NULL, '9913892401', 'male'),
(138, NULL, NULL, 'APA91bHbRGIckTpj0jq-ArySmRdqfSXDVaQ0ZvuHhK8U27Uvzrqaje1LLygo0FFepQpn5vGY0OLTTxcU1SeAtAEN8csh-jyAJU2slGIQG5U44V19ddnVcLXgIpNG10GjB2STULpC4Kii', '804230c6135438a8', NULL, NULL, NULL),
(139, NULL, NULL, 'APA91bGaBZU13MNW6K3prFFiqiBwsaEdjSotQVPddRGUnomVNPfcImpA9gaGye63LHAH8j2InBEbra_9O9FvCYgVCuyjgIxzgQ8QbHQUQ6PPgIMfKz4sgLDrQDUDuXA8UCh6ZiwveRTN', '91925a7db6abfc46', NULL, NULL, NULL),
(140, NULL, NULL, 'APA91bFCZUEK2RjvXq0mC8gcoeEnRijF1wr_6MY9HbvCrCkdWgJyD_9YMcBvWl2VRzCHeZq0WzgcKpw3zKTSauF7g10enLDuPDlefJZ5N3mvhm0AOYKw512UmKbZOkuaSoE8g4Fw_HhK', '4b097d63057c7da7', NULL, NULL, NULL),
(141, 'Reema', 'Desai', 'APA91bHYLbm0yspvp_v9MZ-wQ7g0qilrz6dY75dSX7yPvOpiNoy-sCGYnz3zrXqpmCdI4HIDJ1JG5cOh06fGQqF-ZGWSZRB0nRgqlvxzC_KE5EkqOj7qO74gdS02PirNCWNuPMp77HaX', '4c9d9e2c377da956', NULL, '9712299922', 'female'),
(145, NULL, NULL, 'APA91bHlzeVkjI_KZSgioPTTKy7UZhic4otG4_Im53x-AGOWNS9KF-Jj1Az8zsLdDvHu5IJl4icrgy4NSn0gh8N4p4DsHKl5cekt_4zjXJ5qUYHD71kE0m2z8lUXIuIms6Uli_MnQZY3', '50e9adaadcdaf1b5', NULL, NULL, NULL),
(146, NULL, NULL, '', 'eaa03f8e44038e54-toc', NULL, NULL, NULL),
(147, NULL, NULL, '', 'f072bc1a4048ef64', NULL, NULL, NULL),
(148, NULL, NULL, 'APA91bGIOea6PITzuKhpnZ-UciFwd0-fRXD6AQ4H9aJZrXjha_uLYEAqdBgPmRISSK6qBgWyLaEFzVgreFgaDQTdhtU_wiOd0QEMe_fikmEpY0N4P-cevD5kAK7Dv7eYslwwlKeEZYOy', '559b01deb74323a5', NULL, NULL, NULL),
(149, NULL, NULL, 'APA91bFtIciNUPnyFfqPSZ1V0aJpAX_vNzLKkd5GV_zCzF365QlUvuZD7doBbOyCDoFVnsaLV8LwN5Wi9YzGbCGo8-8dB02rtdIqHZPot6cXoVCneUZJj6MVWjKmZvyaDnxaGpdAAF8n', 'de9a9877fb7e3b0b', NULL, NULL, NULL),
(150, NULL, NULL, 'APA91bGVFkEc8SgQZmyYqSohpMW4OYeFURjEZsUqEvxDlDM50HgCRlFIXw1cTRZa12Rd9CfVINFwIgCXtFZoFU7y9XpYXYNG8B7ZpJfiHxRtVfus7lQwXZl5vYWsivPxz0NiWloP8_gT', '62b99fc2e4c04445', NULL, NULL, NULL),
(153, NULL, NULL, 'APA91bGnskrsGMMtGgSbquAvzCny4WA9xkluZYDndmCeMsGg1HRkAKpFeutEZ9w6WP1JA-D99Y0waoIqM-4gSNX1hS30rxVYglqkDdqpUTs58uslYKF7cOdowQj1zEphmdyHRQV0cYx8', 'a83c05de8cc2517f', NULL, NULL, NULL),
(154, NULL, NULL, 'APA91bGo0qPb3uYv6YIsdLIqq3ApcJQHDjzTvqTQbpFXYLHgTR0MmKtJma0PTO0EaeaPkzgC6xCMi5OWobkcHmYdfXSBQenb476b1aghOqrbG8GAtMHljB-ARxFetBv75oxmHv4LpA1l', '398804afb7b3b816', NULL, NULL, NULL),
(155, NULL, NULL, 'APA91bGH3dB-8BI74NixTkKtGYyW7AT96J9t0DhoY_yEQovZjaye5uIIZ9P2SzkEHGqi-1hRbWZONVv42iJU8ChyEg6sjJ-0VWIXjpmvl20xsq_srKrRzd28cVigWvMv1TrcriKpjND0', 'b0da7cdb53166179', NULL, NULL, NULL),
(157, NULL, NULL, 'APA91bGQM8Mw9XNGN3URlBGC2jNhd8Ml1K1--OgYOSxoJycow5_jBQyHZn-Gnqhc5L2pRoUskES4iak9jI4THIdTmXpFB60KsYgMGc-mNF6rqQg1buvuWAKnm8EnKpbOip8z1_NGP5fN', '557dccf8da34bbfd', NULL, NULL, NULL),
(158, NULL, NULL, 'APA91bEv129Z3lm0tq3SEOpX0uGnrl9s1VOV0p43ewfkKPfgFDqrOZJM148DYnJIpbjkCwTH2MiC7UzM7pAWs04pacir34SA3yvObpcoA_70r3L-TiFgPMkRX6Ww81oqK5mpBNNmz_Ex', 'f792c75fc66e204f', NULL, NULL, NULL),
(159, NULL, NULL, '', '', NULL, NULL, NULL),
(160, NULL, NULL, 'APA91bGjDy8aGJ8l5XiAxWBNkjX4RQvryUNLbL688ChsudeLrAyVy_xqGMr3LQ0pfaFNVjzwPvtbwdbZwF2-0lEbKJgzCRjX9GDJlAbDpqX5KuWULNeRu79j8BRm_YNjbgoCrFmootbK', '248776c578fa099a', NULL, NULL, NULL),
(161, NULL, NULL, '', 'b1bdeb2582f68bd6', NULL, NULL, NULL),
(162, NULL, NULL, '', 'b108e9c2f4f15da0', NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`);

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
