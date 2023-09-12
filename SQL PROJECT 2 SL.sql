/* Once a student is passed out from a Institute or College, he/she is known as Alumni of the Institute. 
Alumni’s career growth plays important role in Institute’s ranking and other networking activities. In this project, 
career choices of alumni of two Universities will be analyzed with respect to their passing year as well as the course they completed. 

Dataset: Six .csv file (Alumni record of College A and College B) Higher Studies, Self Employed and Service/Job record 

				College_A_HS ~ Higher Studies Record of College A
				College_A_SE ~ Self Employed Record of College A
				College_A_SJ ~ Service/Job Record of College A
				College_B_HS ~ Higher Studies Record of College B
				College_B_SE ~ Self-Employed Record of College B
				College_B_SJ ~ Service/Job respectively Record of College B
Tasks to be performed :-                                                                */

-- Q1. Create new schema as alumni
				create schema alumni;
                
-- Q2. Import all .csv files into MySQL
			USE alumni;
				SELECT * FROM college_a_hs;
				SELECT * FROM college_a_se;
				SELECT * FROM college_a_sj;
				SELECT * FROM college_b_hs;
				SELECT * FROM college_b_se;
				SELECT * FROM college_b_sj;

-- Q3. Run SQL command to see the structure of six tables
				DESC college_a_hs;
				DESC college_a_se;
				DESC college_a_sj;
				DESC college_b_hs;
				DESC college_b_se;
				DESC college_b_sj;

-- Q4. Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python ?
-- It Is Peroform On python(Jyupter Notebook) & .py file is attached Below.

/* Q5. Import all the records of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) 
into MS Excel. (submit Excel file for this question) ?                                                         */
-- It Is Peroform On MS Excel & File is attached Below.

-- Q6]. Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values ?
				CREATE OR REPLACE VIEW college_a_hs_V AS
					(SELECT 
						*
					FROM
						college_a_hs
					WHERE
						RollNo IS NOT NULL
							AND LastUpdate IS NOT NULL
							AND Name IS NOT NULL
							AND FatherName IS NOT NULL
							AND MotherName IS NOT NULL
							AND Batch IS NOT NULL
							AND Degree IS NOT NULL
							AND PresentStatus IS NOT NULL
							AND HSDegree IS NOT NULL
							AND EntranceExam IS NOT NULL
							AND Institute IS NOT NULL
							AND Location IS NOT NULL);
		SELECT * FROM college_a_hs_V;
        
-- Q7]. Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values ?
				CREATE OR REPLACE VIEW College_A_SE_V AS
					(SELECT 
						*
					FROM
						College_A_SE
					WHERE
						Rollno IS NOT NULL
							AND LastUpdate IS NOT NULL
							AND Name IS NOT NULL
							AND FatherName IS NOT NULL
							AND MotherName IS NOT NULL
							AND Batch IS NOT NULL
							AND Degree IS NOT NULL
							AND PresentStatus IS NOT NULL
							AND Organization IS NOT NULL
							AND Location IS NOT NULL);
				SELECT * FROM College_A_SE_V;
        
-- Q8]. Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values ?
				CREATE OR REPLACE VIEW College_a_sj_V AS
					(SELECT 
						*
					FROM
						college_a_sj
					WHERE
						RollNo IS NOT NULL
							AND LastUpdate IS NOT NULL
							AND Name IS NOT NULL
							AND FatherName IS NOT NULL
							AND MotherName IS NOT NULL
							AND Batch IS NOT NULL
							AND Degree IS NOT NULL
							AND PresentStatus IS NOT NULL
							AND Organization IS NOT NULL
							AND Designation IS NOT NULL
							AND Location IS NOT NULL);
			SELECT * FROM College_a_sj_V;
            
-- Q9]. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values ?
				CREATE OR REPLACE VIEW college_b_hs_V AS
					(SELECT 
						*
					FROM
						college_b_hs
					WHERE
						RollNo IS NOT NULL
							AND LastUpdate IS NOT NULL
							AND Name IS NOT NULL
							AND FatherName IS NOT NULL
							AND MotherName IS NOT NULL
							AND Branch IS NOT NULL
							AND Batch IS NOT NULL
							AND Degree IS NOT NULL
							AND PresentStatus IS NOT NULL
							AND HSDegree IS NOT NULL
							AND EntranceExam IS NOT NULL
							AND Institute IS NOT NULL
							AND Location IS NOT NULL);
			SELECT * FROM college_b_hs_V;
            
-- Q10]. Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values ?
				CREATE OR REPLACE VIEW college_B_SE_V AS
					(SELECT 
						*
					FROM
						college_b_se
					WHERE
						RollNo IS NOT NULL
							AND LastUpdate IS NOT NULL
							AND Name IS NOT NULL
							AND FatherName IS NOT NULL
							AND MotherName IS NOT NULL
							AND Branch IS NOT NULL
							AND Batch IS NOT NULL
							AND Degree IS NOT NULL
							AND PresentStatus IS NOT NULL
							AND Organization IS NOT NULL
							AND Location IS NOT NULL);
			SELECT * FROM college_B_SE_V;
            
-- Q11]. Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values ?
				CREATE OR REPLACE VIEW College_B_SJ_V AS
					(SELECT 
						*
					FROM
						college_b_sj
					WHERE
						RollNo IS NOT NULL
							AND LastUpdate IS NOT NULL
							AND Name IS NOT NULL
							AND FatherName IS NOT NULL
							AND MotherName IS NOT NULL
							AND Branch IS NOT NULL
							AND Batch IS NOT NULL
							AND Degree IS NOT NULL
							AND PresentStatus IS NOT NULL
							AND Organization IS NOT NULL
							AND Designation IS NOT NULL
							AND Location IS NOT NULL);
			SELECT * FROM College_B_SJ_V;
            
/* Q12]. Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views 
(College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) ?                          */
				SELECT LOWER(Name) , LOWER(FatherName) , LOWER(MotherName) FROM College_A_HS_V;
				SELECT LOWER(Name) , LOWER(FatherName) , LOWER(MotherName) FROM College_A_SE_V;
				SELECT LOWER(Name) , LOWER(FatherName) , LOWER(MotherName) FROM College_A_SJ_V;
				SELECT LOWER(Name) , LOWER(FatherName) , LOWER(MotherName) FROM College_B_HS_V;
				SELECT LOWER(Name) , LOWER(FatherName) , LOWER(MotherName) FROM College_B_SE_V;
				SELECT LOWER(Name) , LOWER(FatherName) , LOWER(MotherName) FROM College_B_SJ_V;

/* Q13]. Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 
into MS Excel and make pivot chart for location of Alumni ?                                            */
-- 				It Is Perform On MS Excel & File is attached BELOW......

-- Q14]. Write a query to create procedure get_name_collegeA using the cursor to fetch names of all students from college A ?
				DROP PROCEDURE get_name_collegeA
				DELIMITER $$
				CREATE PROCEDURE get_name_collegeA 
				(
						 INOUT name1 TEXT(40000)
				)
				BEGIN 
					DECLARE na INT DEFAULT 0;
					DECLARE namelist VARCHAR(16000) DEFAULT "";
					
					DECLARE namedetail 
						   CURSOR FOR
								SELECT Name FROM college_a_hs UNION SELECT Name FROM college_a_se UNION SELECT Name FROM college_a_sj;
								
					DECLARE CONTINUE HANDLER 
							FOR NOT FOUND SET na =1;
							
					OPEN namedetail;
					
					getame :
						 LOOP
						 FETCH FROM namedetail INTO namelist;
						 IF na = 1 THEN
							  LEAVE getame;
						END IF;
						SET name1 = CONCAT(namelist,";",name1);
						
						END LOOP getame;
						CLOSE namedetail;
				END $$
				DELIMITER ;

				SET @Name = "";
				CALL get_name_collegeA(@Name);
				SELECT @Name Name;

-- Q.15 Write a query to create procedure get_name_collegeB using the cursor to fetch names of all students from college B.
				DROP PROCEDURE get_name_collegeB
				DELIMITER $$
				CREATE PROCEDURE get_name_collegeB 
				(
						 INOUT name1 TEXT(40000)
				)
				BEGIN 
					DECLARE na INT DEFAULT 0;
					DECLARE namelist VARCHAR(16000) DEFAULT "";
					
					DECLARE namedetail 
						   CURSOR FOR
								SELECT Name FROM college_b_hs UNION SELECT Name FROM college_b_se UNION SELECT Name FROM college_b_sj;
								
					DECLARE CONTINUE HANDLER 
							FOR NOT FOUND SET na =1;
							
					OPEN namedetail;
					
					getame :
						 LOOP
						 FETCH FROM namedetail INTO namelist;
						 IF na = 1 THEN
							  LEAVE getame;
						END IF;
						SET name1 = CONCAT(namelist,";",name1);
						
						END LOOP getame;
						CLOSE namedetail;
				END $$
				DELIMITER ;

				SET @Name = "";
				CALL get_name_collegeB(@Name);
				SELECT @Name Name;

/* Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)
Note: Approximate percentages are considered for career choices.
*/
				SELECT 
					'Higher Studies' Career_choice,
					(AVG(college_a_hs.RollNo) / (college_a_hs.RollNo)) * 100 College_A_Percentage,
					(AVG(college_b_hs.RollNo) / (college_b_hs.RollNo)) * 100 College_B_Percentage
				FROM
					college_a_hs
						CROSS JOIN
					college_b_hs 
				UNION SELECT 
					'Self Empolyment' Career_choice,
					(AVG(college_a_se.RollNo) / (college_a_se.RollNo)) * 100 College_A_Percentage,
					(AVG(college_b_se.RollNo) / (college_b_se.RollNo)) * 100 College_B_Percentage
				FROM
					college_a_se
						CROSS JOIN
					college_b_se 
				UNION SELECT 
					'Service Job' Career_choice,
					(AVG(college_a_sj.RollNo) / (college_a_sj.RollNo)) * 100 College_A_Percentage,
					(AVG(college_b_sj.RollNo) / (college_b_sj.RollNo)) * 100 College_B_Percentage
				FROM
					college_a_sj
						CROSS JOIN
					college_b_sj;
