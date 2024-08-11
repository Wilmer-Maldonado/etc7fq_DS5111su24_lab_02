# etc7fq_DS5111su24_lab_02
DBT and Snowflake Part 1 and Part 2 DS5111su24 Labs

A. Mermaid file code is in mermaid_on_markdown.md for easy viewing. The raw mermaid file is named db_design.mmd in repo. 

B. The ERD Diagram can also be viewed on part_1_questions.md which has the answers to part 1 of lab's questions. 
The png for the ERD is in design folder in repo. 


To recreate results:



First run 'make env' from root of repo, and run 'source env/bin/activate'.



1. run dbt init "project-name" and connect to snowflake

2. add csv files from clean_data folder in repo to 'seeds' folder in created dbt project directory from step 1. 

3. run 'dbt seed' to upload csv files to snowflake. In my case uploaded csvs to schema etc7fq.

4. use queries.sql file in repo to see the queries used to get results in repo's results folder.
The queries.sql file can also be used to produce the answers in part_2_questions.md file. 
