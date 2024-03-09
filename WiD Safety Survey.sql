SELECT R.ID,
       R.DEMOG_AGE,
       R.DEMOG_REGION,
       R.DEMOG_ETHNICITY,
       R.DEMOG_RELIGION,
       W.RESPONDENT_WEIGHT,
       CASE WHEN R.DEMOG_SOCIAL_GRADE LIKE 'Higher%' 
            THEN 'Higher managerial/professional/administrative'
            WHEN R.DEMOG_SOCIAL_GRADE LIKE'Intermediate%' 
            THEN 'Intermediate managerial/ professional/ administrative'
            WHEN R.DEMOG_SOCIAL_GRADE LIKE'Retired%' 
            THEN 'Retired and living on state pension only'
            WHEN R.DEMOG_SOCIAL_GRADE LIKE'Semi%' 
            THEN 'Semi or unskilled manual worker'
            WHEN R.DEMOG_SOCIAL_GRADE LIKE'Skilled%' 
            THEN 'Skilled manual worker'
            WHEN R.DEMOG_SOCIAL_GRADE LIKE'Student%'
            THEN 'Student'
            WHEN R.DEMOG_SOCIAL_GRADE LIKE'Supervisory%' 
            THEN 'Supervisory or clerical/ junior managerial/ professional/ administrator'
            WHEN R.DEMOG_SOCIAL_GRADE LIKE'Unemployed%' 
            THEN 'Unemployed (for over 6 months) or not working due to long term sickness'
            WHEN R.DEMOG_SOCIAL_GRADE IS NULL 
            THEN 'NOT COLLECTED'
       END AS DEMOG_SOCIAL_GRADE,
       CASE WHEN R.DEMOG_HEALTH_NONE IS NOT NULL
            THEN 0
            ELSE 1 * W.RESPONDENT_WEIGHT 
            END AS HEALTH_VULNERABILITY,
       CASE WHEN (R.EXPERIENCED_PRIVATE_CATCALLS IS NULL AND 
                 R.EXPERIENCED_PRIVATE_COERCIVECONTROL IS NULL AND
                 R.EXPERIENCED_PRIVATE_FINANCIALCONTROL IS NULL AND
                 R.EXPERIENCED_PRIVATE_HOMOPHOBIC IS NULL AND
                 R.EXPERIENCED_PRIVATE_INDECENTEXPOSURE IS NULL AND
                 R.EXPERIENCED_PRIVATE_PHYSICALTHREAT IS NULL AND
                 R.EXPERIENCED_PRIVATE_RACIAL IS NULL AND
                 R.EXPERIENCED_PRIVATE_RELIGIOUS IS NULL AND
                 R.EXPERIENCED_PRIVATE_SEXUALCOMMENTS IS NULL AND
                 R.EXPERIENCED_PRIVATE_SHOUTEDATDRIVING IS NULL AND
                 R.EXPERIENCED_PRIVATE_STARING IS NULL)
            THEN 0
            ELSE 1 * W.RESPONDENT_WEIGHT 
            END AS PRIVATE_NON_CONTACT,
       CASE WHEN (R.EXPERIENCED_PRIVATE_SEXUALTOUCHING IS NULL AND
                 R.EXPERIENCED_PRIVATE_PHYSICALASSAULT IS NULL AND
                 R.EXPERIENCED_PRIVATE_RAPE IS NULL AND
                 R.EXPERIENCED_PRIVATE_FORCESEX IS NULL AND
                 R.EXPERIENCED_PRIVATE_FGM IS NULL)
            THEN 0
            ELSE 1 * W.RESPONDENT_WEIGHT 
            END AS PRIVATE_CONTACT,
       CASE WHEN (R.EXPERIENCED_PUBLIC_CATCALLS IS NULL AND 
                 --EXPERIENCED_PUBLIC_COERCIVECONTROL OR
                 --EXPERIENCED_PUBLIC_FINANCIALCONTROL OR
                 R.EXPERIENCED_PUBLIC_HOMOPHOBIC IS NULL AND
                 R.EXPERIENCED_PUBLIC_INDECENTEXPOSURE IS NULL AND
                 R.EXPERIENCED_PUBLIC_PHYSICALTHREAT IS NULL AND
                 R.EXPERIENCED_PUBLIC_RACIAL IS NULL AND
                 R.EXPERIENCED_PUBLIC_RELIGIOUS IS NULL AND
                 R.EXPERIENCED_PUBLIC_SEXUALCOMMENTS IS NULL AND
                 R.EXPERIENCED_PUBLIC_SHOUTEDATDRIVING IS NULL AND
                 R.EXPERIENCED_PUBLIC_STARING IS NULL)
            THEN 0
            ELSE 1 * W.RESPONDENT_WEIGHT 
            END AS PUBLIC_NON_CONTACT,
       CASE WHEN --EXPERIENCED_PUBLIC_SEXUALTOUCHING OR
                 (R.EXPERIENCED_PUBLIC_PHYSICALASSAULT IS NULL AND
                 R.EXPERIENCED_PUBLIC_RAPE IS NULL AND
                 R.EXPERIENCED_PUBLIC_FORCESEX IS NULL)
                 --EXPERIENCED_PUBLIC_FGM
            THEN 0
            ELSE 1 * W.RESPONDENT_WEIGHT 
            END AS PUBLIC_CONTACT
FROM RAW_SAFETY_SURVEY_DATA R
JOIN SAFETY_SURVEY_DATA_WEIGHTED W
ON R.ID = W.ID