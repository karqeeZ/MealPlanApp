-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 04:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c237_ga_nutrinourish`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `about_id` int(11) NOT NULL,
  `section` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`about_id`, `section`, `title`, `content`) VALUES
(1, 'Our Story', 'Our Story', 'Nutrinourish began with a personal struggle that many of us can relate to: the desire to eat healthily without the time to prepare meals every day. As the founder, I found myself juggling a busy schedule with a determination to prioritize my health. I knew meal prepping was the answer — it is away to ensure that I always have wholesome meals ready to go. However, finding reliable recipes that were both nutritious and enjoyable proved challenging.\r\n\r\nDriven by this need and a passion for cooking, Nutrinourish was born. What started as a personal journey to make meal prepping easier quickly evolved into a platform dedicated to sharing my discoveries and creations with the world. Every recipe on Nutrinourish is crafted with care, focusing on fresh, wholesome ingredients that nourish the human body and delight the taste buds.'),
(2, 'Our Mission', 'Our Mission', 'At Nutrinourish, we are committed to revolutionizing the way people approach nutrition and healthy eating. We believe that eating well should never feel like a sacrifice. Whether you\'re striving to manage your weight, increase your energy levels, or simply adopt a healthier lifestyle, we are dedicated to supporting you every step of the way. \r\n\r\nOur mission is to provide you with more than just recipes. We aim to empower you with practical meal solutions that fit seamlessly into your busy life. Our curated collection of nutritious recipes is crafted with care, ensuring that each dish is not only delicious but also contributes to your overall well-being.'),
(3, 'Community', 'Community', 'We invite you to explore our collection of recipes, meal prep tips, and nutritional insights. Join our community of health-conscious food enthusiasts who are transforming the way they eat, one delicious recipe at a time. Together, we can make healthy eating not only achievable but enjoyable.\r\n\r\nJoin our vibrant community of health-conscious individuals at NutriNourish. We share a passion for good food and better living. Here, you\'ll discover more than just recipes – you\'ll find meal prep tips, nutritional insights, and expert guidance to help you navigate your wellness journey.\r\n\r\nAs a member of Nutrinourish, you become part of an interactive social platform where you can:\r\n\r\n                <ul class=\"ab-list\">\r\n                    <li>\r\n                        Share Your Culinary Creations: Post photos of your Nutrinourish meals,\r\n                        showcase your cooking skills, and inspire others with your culinary creativity.\r\n                    </li>\r\n                    <li>\r\n                        Exchange Recipes: Discover new recipes from fellow community members, and\r\n                        share your own healthy favorites.\r\n                    </li>\r\n                    <li>\r\n                        Engage in Discussions: Join conversations, ask questions, and share\r\n                        insights on nutrition, meal prep, and healthy living.\r\n                    </li>\r\n                    <li>\r\n                        Follow and Connect: Build your network by following other members,\r\n                        commenting on their posts, and fostering connections with like-minded individuals.\r\n                    </li>\r\n                    <li>\r\n                        Learn from Experts: Gain access to exclusive content, including nutritional advice\r\n                        and cooking tips from experts in the field.\r\n                    </li>\r\n                    <li>\r\n                        Celebrate Success: Share your progress, celebrate milestones, and offer support and\r\n                        encouragement to others in the community.\r\n                    </li>\r\n                </ul>\r\n\r\nTogether, we can transform the way we eat, one nourishing meal at a time. Join us on this journey to better health and discover the joy of wholesome eating with Nutrinourish. Share your stories, connect with others, and be part of a community that values health, happiness, and great food.\r\n'),
(4, 'Announcements', 'Announcements', 'Starting September 2024, NutriNourish will introduce its highly requested <a class=\"ab-link\" href=\"http://localhost:3000/plans\">Meal Plans!</a> This initiative represents our commitment to making healthy eating more accessible and enjoyable for everyone. Our Meal Plans will bring NutriNourish\'s carefully crafted recipes directly to your table, ensuring convenience without compromising on nutrition or taste.');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `article_id` int(8) NOT NULL,
  `article_name` varchar(8) NOT NULL,
  `web_url` varchar(500) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `caption` varchar(100) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `tagline` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `article_img` varchar(500) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`article_id`, `article_name`, `web_url`, `caption`, `tagline`, `article_img`) VALUES
(3, 'article1', 'https://www.medicalnewstoday.com/articles/322268', 'What are the Benefits of Eating Healthy?', 'Dive Into Health', 'grocery.jpeg'),
(4, 'article2', 'https://www.goodhousekeeping.com/food-recipes/a28377603/how-to-meal-prep/', 'What is Meal Prepping?', 'Eat Clean, Feel Great', 'mealprep4.png'),
(5, 'article3', 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9498169/', 'Health Benefits & Risks to Consuming Spices', 'Pure Nutrition, Pure Energy', 'seasoning3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `main`
--

CREATE TABLE `main` (
  `main_id` int(8) NOT NULL,
  `web_url` varchar(500) NOT NULL,
  `name` varchar(100) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `tagline` varchar(50) NOT NULL,
  `main_img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main`
--

INSERT INTO `main` (`main_id`, `web_url`, `name`, `caption`, `tagline`, `main_img`) VALUES
(1, 'https://www.healthhub.sg/live-healthy/build_healthy_food_foundation', 'mealPlan', 'Build a Healthy Diet', 'Dive Into Health', 'mealprep.jpg'),
(2, 'https://www.who.int/initiatives/behealthy/healthy-diet', 'Health', 'A healthy diet is essential for good health and nutrition.', 'Fuel Up with Freshness', 'grocery.webp');

-- --------------------------------------------------------

--
-- Table structure for table `meal_plan`
--

CREATE TABLE `meal_plan` (
  `plan_id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `plan_img` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `tagline` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_plan`
--

INSERT INTO `meal_plan` (`plan_id`, `name`, `plan_img`, `description`, `tagline`) VALUES
(1, 'Balanced', 'balanced_mp1.jpg', 'The balanced diet focuses on offering a wide variety of foods in the right proportions to schieve optimal nuitrition.', 'Dive Into Health'),
(2, 'Low-Carbo Diet', 'lowcarb_mp2.jpg', 'The Low-Carbo Diet limits intake of carbohydrates and takes on a stronger focus on protein, fats, and non-starchy vegetables.', 'Low-Carb, High Energy'),
(3, 'Plant-Based Diet', 'plantbased_mp3.jpg', 'The Plant-Based Diet will minimize or exclude animal products and emphasise fibre-rich ingredients.', 'Dive Into Health'),
(4, 'Calorie Defecit', 'defecit_mp4.jpg', 'The Calorie Defecit meal plan will focus on lowering calorie intakes without having any restrictions on ingredients.', 'Smart Eating, Steady Weight Loss');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `recipe_id` int(8) NOT NULL,
  `name` varchar(100) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `rating` varchar(6) NOT NULL,
  `ingredients` varchar(1000) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `calories` int(4) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `recipe_img` varchar(500) NOT NULL,
  `protein` int(3) NOT NULL,
  `carbs` int(3) NOT NULL,
  `fiber` int(2) NOT NULL,
  `created_by` varchar(12) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `plan_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`recipe_id`, `name`, `rating`, `ingredients`, `calories`, `link`, `recipe_img`, `protein`, `carbs`, `fiber`, `created_by`, `plan_id`) VALUES
(1, 'Tuna Melt Quesadillas', '★★★★★', '145g tin tuna chunks in spring water,\r\n1 tbsp lighter mayonnaise,\r\n40g tinned sweetcorn in water,\r\n4 plain tortilla wraps,\r\n40g 50% reduced-fat mature cheese,\r\n20g baby spinach,\r\n2 tsp olive oil', 422, 'https://realfood.tesco.com/recipes/tuna-melt-quesadillas.html', '1721139253694-melt_1.jpg', 26, 47, 2, 'TESCO', 4),
(2, 'Roasted Salmon w/ Garlic Mash', '★★★★★', '2 Salmon Fillets,\r\n1 Dill,\r\n1 Echalion Shallot,\r\n150g Closed Cup Mushroom,\r\n1 Garlic Clove,\r\n1/2 Lemon,\r\n150g Sour Cream,\r\n1 tsp Vegetable Stock Powder,\r\n450g of Potatoes\r\n', 549, 'https://www.hellofresh.co.uk/recipes/lemony-roasted-salmon-with-garlicky-mash-5f59fac23e99136b97547137', '1721139263839-salmon_2.avif', 30, 48, 24, 'HELLO FRESH', 4),
(3, 'Pesto Chicken with Roasted Potatoes and Green Beans\r\n', '★★★★★', '340g ounce Yukon Gold Potatoes,\r\n1/2 cup Panko Breadcrumbs (Contains Wheat),\r\n1/2 cup Mozzarella Cheese (Contains Dairy),\r\n340g ounce Chicken Breasts,\r\n4 tbsp Pesto,\r\n1 Lemon,\r\n170g Green Beans,\r\n28g Almonds\r\n', 650, 'https://www.hellofresh.com/recipes/presto-pesto-panko-chicken-5cf804df4e84a700166021d8', 'chicken_3.avif', 49, 54, 18, 'HELLO FRESH', 1),
(4, 'Korean Beef Bimbimbap', '★★★★★', '1 Zucchni,\r\n115g Button Mushrooms,\r\n2 Scallions,\r\n1 Carrot,\r\n1 thumb of Ginger,\r\n2 Cloves of Garlic,\r\n3/4 cup Jasmine Rice,\r\n5 tsp White Wine Vinegar,\r\n1 tbsp Sesame Oil,\r\n1 tbsp Siracha,\r\n3 tbsp Soy Sauce,\r\n285g Grund Beef', 660, 'https://www.hellofresh.com/recipes/korean-beef-bibimbap-59baf01eae702a32c8227d82', '1721139292501-bimbimbap_4.jpg', 37, 78, 12, 'HELLO FRESH', 1),
(34, 'Feta, Egg & Spinach Breakfast Taco', '★★★★★', '1 teaspoon avocado oil or canola oil,\r\n1 corn tortilla,\r\n1 cup lightly packed baby spinach,\r\n1 large egg,\r\n2 tablespoons crumbled feta cheese,\r\nHot sauce for garnish (optional)', 255, 'https://www.eatingwell.com/feta-egg-spinach-breakfast-taco-8608285', '1721139302044-breakfast.webp', 12, 13, 3, 'EatingWell', 2),
(35, 'Peach Pie Overnight Oats', '★★★★★', '4 fresh peaches, peeled and chopped (3 cups),\r\n1/4 cup water,\r\n1 tablespoon light brown sugar,\r\n1 teaspoon ground cinnamon,\r\n1/2 teaspoon salt,\r\n2 cups old-fashioned rolled oats,\r\n1 3/4 cups reduced-fat milk,\r\n1 cup nonfat peach strained (Greek-style) yogurt,\r\n2 tablespoons chia seeds,\r\n2 tablespoons vanilla extract', 354, 'https://www.eatingwell.com/peach-pie-overnight-oats-8668392', '1721139310380-peach.webp', 16, 58, 9, 'EatingWell', 3),
(36, 'Crispy Baked Chicken Cutlets', '★★★★★', 'Cooking spray,\r\n4 (4-ounce) chicken cutlets,\r\n1/2 teaspoon ground pepper,\r\n1/2 teaspoon salt, divided,\r\n1/4 teaspoon cayenne pepper,\r\n1 1/2 cups panko breadcrumbs,\r\n1/4 cup all-purpose flour,\r\n1 large egg, beaten,\r\n1 1/4 teaspoons garlic powder,\r\n1 1/4 teaspoons onion powder,\r\n1/4 teaspoon dry mustard', 275, 'https://www.eatingwell.com/crispy-baked-chicken-cutlets-8668359', '1721139321730-baked chicken.webp', 31, 23, 2, 'EatingWell', 2),
(37, 'Harira (Moroccan Tomato, Lentil & Beef Soup)', '★★★★★', '2 tablespoons extra-virgin olive oil,\r\n1 pound beef stew meat, cut into bite-size pieces,\r\n1 medium onion, diced,\r\n2 stalks celery, chopped,\r\n3/4 cup minced fresh cilantro,\r\n3/4 cup minced fresh parsley,\r\n8 cups water,\r\n1 28-ounce can crushed tomatoes,\r\n1 cup dry brown or green lentils,\r\n1 cup no-salt-added canned chickpeas,\r\n1 tablespoon ground pepper,\r\n2 teaspoons ground ginger,\r\n1 1/2 teaspoons salt,\r\n1/2 teaspoon ground turmeric,\r\n1/2 teaspoon ground cinnamon,\r\n1 cup fideo noodles or broken vermicelli', 318, 'https://www.eatingwell.com/harira-moroccan-tomato-lentil-beef-soup-8599909', '1721139329861-stew.webp', 24, 41, 10, 'EatingWell', 4),
(38, 'The Best Grilled Chicken Breasts', '★★★★★', '6 (6 ounce) skinless boneless chicken breasts,\r\n1/4 cup olive oil,\r\n3 tablespoons Dijon mustard,\r\n3 tablespoons honey,\r\n2 tablespoons soy sauce,\r\n2 tablespoons lemon juice,\r\n3 cloves garlic, finely minced,\r\n1 1/2 teaspoons onion powder,\r\n1/2 teaspoon ground ginger,\r\noil or cooking spray,\r\n2 teaspoons kosher salt', 406, 'https://www.allrecipes.com/best-grilled-chicken-breasts-recipe-8648903', '1721139340108-grilledChick.webp', 54, 11, 1, 'allrecipes', 2),
(39, 'Homemade Crispy Hash Browns', '★★★★★', '2 medium russet potatoes, shredded,\r\n1/2 medium onion, finely chopped,\r\n1/4 cup all-purpose flour,\r\n1 large egg,\r\n1 cup oil for frying,\r\nsalt and pepper to taste', 183, 'https://www.allrecipes.com/recipe/57783/emilys-famous-hash-browns/', '1721139355605-hashy.webp', 5, 26, 3, 'allrecipes', 3),
(40, 'Pesto Pasta with Chicken', '★★★★★', '1 (16 ounce) package bow tie pasta,\r\n1 teaspoon olive oil,\r\n2 cloves garlic, minced,\r\n1 pinch crushed red pepper flakes, or to taste,\r\n1/2 cup pesto sauce,\r\n1/3 cup oil-packed sun-dried tomatoes', 328, 'https://www.allrecipes.com/recipe/46982/pesto-pasta-with-chicken/', '1721139363552-pasta.webp', 17, 43, 3, 'allrecipes', 3),
(41, 'Creamy Lemon Shrimp Pasta', '★★★★★', '3/4 (16 ounce) package spaghetti,\r\n1 pound uncooked medium shrimp peeled and deveined,\r\nsalt and ground black pepper to taste,\r\n2 tablespoons finely chopped shallots,\r\n1 tablespoon crushed garlic,\r\n1/4 cup chicken broth,\r\n1 medium lemon, zested and juiced,\r\n1/2 cup heavy cream,\r\n5 large basil leaves chopped,\r\n1 pinch red pepper flakes', 248, 'https://www.allrecipes.com/creamy-lemon-shrimp-pasta-recipe-8642461', '1721139370890-pasta2.webp', 21, 20, 1, 'allrecipes', 1),
(43, 'qwe', '★★★★★', 'qwe,qwe,qwe', 123, 'https://www.eatingwell.com/peach-pie-overnight-oats-8668392', '1721139593086-monkey_1st_lr_edit (1 of 1).jpg', 123, 123, 123, 'Johnson', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(8) NOT NULL,
  `image` varchar(500) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `rating` varchar(5) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `image`, `caption`, `comment`, `rating`, `created_at`) VALUES
(16, '1721139229733-sh-1.webp', 'My new favourite meal prep recipe', 'So tasty :)', '★★★★★', '2024-07-16'),
(19, '1721139237003-sh-2.jpg', 'Light and Healthy Breakfast :)', 'What a way to kickstart the day!', '★★★★★', '2024-07-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`main_id`);

--
-- Indexes for table `meal_plan`
--
ALTER TABLE `meal_plan`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `main`
--
ALTER TABLE `main`
  MODIFY `main_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meal_plan`
--
ALTER TABLE `meal_plan`
  MODIFY `plan_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipe_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
