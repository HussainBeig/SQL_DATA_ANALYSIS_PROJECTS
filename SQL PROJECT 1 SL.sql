/* Business model Customer to Customer (C2C) allows customers to do business with each other. This model is growing fast with 
e-commerce platforms where sellers may be required to pay some amount and buyer can buy it without paying anything. 
E-Commerce website brings the seller and buyer to the same platform. 

Analyzing the user's database will lead to understanding the business perspective. 
Behaviour of the users can be traced in terms of business with exploration of the user’s database. 

Dataset: One .csv file with name users_data with 98913 rows and 24 columns

Tasks to be performed :- */
 
-- Q1]. Create new schema as ecommerce ?
				CREATE DATABASE ecommerce;

-- Q2]. Import .csv file users_data into MySQL ?
-- DONE.....
				use ecommerce;
				select count(*) from users_data;

-- Q3]. Run SQL command to see the structure of table ?
				USE ecommerce;
				SELECT
				  *
				FROM
				  INFORMATION_SCHEMA.COLUMNS
				WHERE
				  TABLE_NAME = 'users_data';
  
-- Q4]. Run SQL command to select first 100 rows of the database ?
				SELECT *
				FROM
					users_data
				LIMIT 100;

-- Q5]. How many distinct values exist in table for field country and language ?
				SELECT 
					COUNT(DISTINCT country) country,
					COUNT(DISTINCT language) language
				FROM
					users_data;
    
-- Q6]. Check whether male users are having maximum followers or female users ?
				USE ecommerce;
				SELECT 
					SUM(socialNbFollowers), gender
				FROM
					users_data
				GROUP BY gender;

/* Q7]. Calculate the total users those
           a. Uses Profile Picture in their Profile
           b. Uses Application for Ecommerce platform
           c. Uses Android app
           d. Uses ios app */
		
-- a. Uses Profile Picture in their Profile ?
				SELECT COUNT(*) hasProfilePicture FROM users_data WHERE hasProfilePicture = 'TRUE';

-- b. Uses Application for Ecommerce platform ?
				SELECT COUNT(*) hasAnyApp FROM users_data WHERE hasAnyApp = 'TRUE';

-- c. Uses Android app ?
				SELECT COUNT(*) hasAndroidApp FROM users_data WHERE hasAndroidApp = 'TRUE';

-- d. Uses ios app ?
				SELECT COUNT(*) hasIosApp FROM users_data WHERE hasIosApp = 'TRUE';

-- Q8]. Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers ?
				SELECT country , SUM(productsBought) FROM users_data GROUP BY country ORDER BY SUM(productsBought) DESC;

-- Q9]. Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers ?
				SELECT country , SUM(productsSold) FROM users_data GROUP BY country ORDER BY SUM(productsSold) ASC;
                
-- Q10]. Display name of top 10 countries having maximum products pass rate ?
				SELECT country,SUM(productsPassRate) FROM users_data GROUP BY country ORDER BY SUM(productsPassRate) DESC LIMIT 10;
--                                              ANOTHER METHOD ( OR )
                SELECT MAX(productsPassRate),country FROM users_data GROUP BY country LIMIT 10;

-- Q11]. Calculate the number of users on an ecommerce platform for different language choices ?
				SELECT language , COUNT(*) FROM users_data GROUP BY language;

-- Q12]. Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform ?
				SELECT gender,COUNT(productsWished) FROM users_data WHERE gender = 'F'
				UNION
				SELECT gender,COUNT(socialProductsLiked) FROM users_data WHERE gender = 'F';
--                                               OR
				SELECT gender,SUM(productsWished) FROM users_data WHERE gender = 'F'
				UNION
				SELECT gender,SUM(socialProductsLiked) FROM users_data WHERE gender = 'F';

				SELECT gender , COUNT(productsWished) , COUNT(socialProductsLiked) FROM users_data WHERE gender = 'F';
-- 												-: SUM & COUNT :-
                SELECT gender , SUM(productsWished),SUM(socialProductsLiked) FROM users_data WHERE gender='F';

-- Q13]. Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.) ?
				SELECT gender,COUNT(productsSold) FROM users_data WHERE gender = 'M'
				UNION
				SELECT gender,COUNT(productsBought) FROM users_data WHERE gender = 'M';
--                                               OR
				SELECT gender,SUM(productsSold) FROM users_data WHERE gender = 'M'
				UNION
				SELECT gender,SUM(productsBought) FROM users_data WHERE gender = 'M';

				SELECT gender , COUNT(productsSold) , COUNT(productsBought) FROM users_data WHERE gender = 'M';
-- 												-: SUM & COUNT :-
                SELECT gender , SUM(productsSold),SUM(productsBought) FROM users_data WHERE gender='M';
                
-- Q14]. Which country is having maximum number of buyers ?
				SELECT country , SUM(productsBought) FROM users_data GROUP BY country ORDER BY SUM(productsBought) DESC;
                
-- Q15]. List the name of 10 countries having zero number of sellers ?
				SELECT country , productsSold FROM users_data WHERE productsSold = 0 LIMIT 10;

-- Q16]. Display record of top 110 users who have used ecommerce platform recently ?
				SELECT daysSinceLastLogin FROM users_data ORDER BY daysSinceLastLogin ASC LIMIT 110;
-- OR
				SELECT * FROM users_data ORDER BY daysSinceLastLogin ASC LIMIT 110;
                
-- Q17]. Calculate the number of female users those who have not logged in since last 100 days ?
				SELECT gender , COUNT(daysSinceLastLogin) FROM users_data WHERE gender = 'F' AND daysSinceLastLogin > 100;

-- Q18]. Display the number of female users of each country at ecommerce platform ?
				SELECT country , COUNT(*) FROM users_data WHERE gender = "F" GROUP BY country;
                
-- Q19]. Display the number of male users of each country at ecommerce platform ?
				SELECT country , COUNT(*) FROM users_data WHERE gender = "M" GROUP BY country;

-- Q20]. Calculate the average number of products sold and bought on ecommerce platform by male users for each country ?
				SELECT gender , AVG(productsSold) , AVG(productsBought) FROM users_data WHERE gender = "M" GROUP BY country;
