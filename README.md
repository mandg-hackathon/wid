This repo contains the outputs from the M&G team for the WiD hackathon hosted on 7th March 2024 at the InterContinental Hotel in London.
 
Our team opted for Theme 2 Option 1 - Vulnerability and Risk Assessment: VAWG impacts women differently based on their individual circumstances. We looked through and profiled the survey data as well as other suggested datasets on the snowflake marketplace. We opted to focus predominantly on the survey results as the other datasets were difficult to link back to it and we felt the survey on its own would give us a good base to build analysis from. 
 
Upon our data deep dive we thought we noticed there was a large number of questions asked relating to what type of abuse women had experienced and in which setting eg in public or private. Despite this being useful for understanding this topic at a more granular level, when we aggregated the dataset at this level along with key demographics such as region, ethnicity, religion etc, it gave us few results in each category particular in regions that were under represented in the survey. To combat this we grouped types of abuse into 4 categories;
 
•	PRIVATE_CONTACT
•	PRIVATE_NON_CONTACT
•	PUBLIC_CONTACT
•	PUBLIC_NON_CONTACT
 
This gave us a greater number of results to work with to compare against the UK demographic composition. We also used the representation weighting as a factor after aggregation. Thus the 4 categories contained either 0 for had not experienced this form of attack or the value equivalent to the respondents demographic weighting if they had experienced this form of attack.  The code for this is in the SQL script in this repo.
 
We cleaned the dataset further and grouped some of the demographic markers further eg social status. We also added a flag if the respondent had a health related vulnerability. 
 
Our data analysts then produced a Power BI showing various views that helped visualise the data to spot clear disparities in ethnic and religious groups experience in different UK regions. The first 4 pages focus each on an attack category and shows bar charts firstly based on the UK composition of ethnicity and religion by region, and then the UK composition of ethnicity and religion that experienced that form of attack by region. We wanted to create the demographic composition views based on census data but struggled to get up to date data at the level we required. 

Some key insights we seen from these visualisations were as follows:
 
•	Despite making up 3.6% of the UK population, 9.5% of women that experienced private contact abuse were Black, Caribbean or African women.
•	Asian women make up 8.2% of the UK population but 13.1% women that experienced public contact abuse were Asian.
•	Muslim women make up 3.1% of the UK population yet account for 7% of women that experienced a public contact attack. 
 
 
 
We believe this tool can be used as a good start point for highlighting difference of experience for women of different ethnic and religious backgrounds. With more respondents we would get a more accurate representation of the UK populations experience, and thus more accurate results. 

