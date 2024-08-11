## Lab: Database Design and Build Part 1

## Wilmer Maldonado (etc7fq) DS5111su24

## PART 1

Part 1 of the assignment is to understand the problem and design the database. You will then answer the following Design Questions and submit your responses.

**Part 1 Total Points: 20**

### Design Questions

1. **(3 PTS)** What tables should you build?

**Answer:** Courses, Instructors, LearningOutcomes, Semesters should be the tables.

2. **(2 PTS)** For each table, what field(s) will you use for the primary key?

**Answer:** 

a. For table, Courses, primary key should be mnemonic, ie (stat6021)

b. For table, Instructors, primary key should be insructor(name), ie (Jeffrey Woo).

c. For table, LearningOutcomes, primary key should be mnemonic and learning_outcome, ie (stat6021, "Use the statistical software R for regression analysis")

d. For table, Semesters, primary key should be mnemonic and semester, ie (stat6021, Summer2021).

3. **(2 PTS)** For each table, what foreign keys will you use?

**Answer:** 

a. For table, Courses, foreign key(s) should be name, and active.

b. For table, Instructors, foreign key(s) should be employee_status.

c. For table, LearningOutcomes, foreign key(s) should be active.

d. For table, Semesters, foreign key(s) should be instructors. 

4. **(2 PTS)** Learning outcomes, courses, and instructors need a flag to indicate if they are currently active or not. How will your database support this feature? In particular:

   a. If a course will be taught again, it will be flagged as active. If the course won’t be taught again, it will be flagged as inactive.
   b. It is important to track if an instructor is a current employee or not.
   c. Learning outcomes for a course can change. You’ll want to track if a learning outcome is currently active or not.

**Answer:**

a. Courses table has active column so it's value will just need to be changed to True if active, otherwise False for inactive.

b. Instructors Table has employee_status column, it can be renamed to employee active column, so it's value will just need to be changed to True if active(current employee), otherwise False for inactive(not a current employee).

c. Add active column to Learning Outcomes Table so it can be initially set to all True for now. If a learning outcome changes for a course in the future it can be reverted to False for inactive, and new learning outcome can be set to active. 


5. **(1 PT)** Is there anything to normalize in the database, and if so, how will you normalize it? Recall the desire to eliminate redundancy.

**Answer:**
description_short should be removed from Courses table since it's redundant with course name, and unnecessary (doesn't provide additional insight)

6. **(1 PT)** Are there indexes that you should build? Explain your reasoning.

**Answer:** As of now I see building indexes for tables that have composite keys like Semesters Table and Learning Outcomes to optimize queries, by having the relationship between the composite keys organized when querying.

7. **(2 PTS)** Are there constraints to enforce? Explain your answer and strategy. For example, these actions should not be allowed:
   - Entering learning objectives for a course not offered by the School of Data Science
   - Assigning an invalid instructor to a course

**Answer:**

   Additional constraints, if a course is added to semesters table it should be added to courses table. If an instructor is added for a row in Semesters that instructor must be present in instructors table. Lastly add a professor with the same name as another professor, maybe add a middle initial, number or their unique uva id instead, will not do for this project but it is something to consider.

8. **(5 PTS)** Draw and submit a Relational Model for your project. For an example, see _Beginning Database Design Solutions_ page 115, Figure 5-28.

![db_design_DS5111_final.png](<./design/db_design_DS5111_final.png>)

9. **(2 PTS)** Suppose you were asked if your database could also support the UVA SDS Residential MSDS Program. Explain any issues that might arise, changes to the database structure (schema), and new data that might be needed. Note you won’t actually need to support this use case for the project.

**Answer:**

a. A professor could be on leave (paternity/maternity leave, bereavement, research) and the binary current employee or not does not provide a good representation of the status of the employee. Might need to increase the number of possible values for employee status column to account for this possibility.

b. Learning Objectives can have significant overlap but not exact matches, ideally an initial bank of learning objectives should be made for each course. If an instructor changes the learning objective they should assess if it's different enough than the other existing learning objectives to add to database. Otherwise you might end up with extremely similar learning objectives for a course but with one or two words different that prevents them from being duplicates. This defeats the purpose of maintaining track of LO's and how they change since a one word change can sometimes be insignificant, ie Construct machine learning pipelines and Build machine learning end-to-end pipelines, these should not be different LOs.