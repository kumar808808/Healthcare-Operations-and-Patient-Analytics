
----------------------------------------------------------------------
-- 1. OVERALL METRICS (Unique Patients, Avg Wait Time, Avg Satisfaction)

----------------------------------------------------------------------
SELECT 
    COUNT(DISTINCT "Patient Id") AS total_unique_patients,
    ROUND(AVG("Patient Waittime"), 1) AS avg_wait_time_minutes,
    ROUND(AVG("Patient Satisfaction Score"), 2) AS avg_satisfaction_score
FROM hospital_er_data;

-- Insights: 9,216 unique patients | Avg Wait: 35.3 min | Avg Score: 4.99/10
----------------------------------------------------------------------
-- 2. ADMISSION PATTERNS

----------------------------------------------------------------------
SELECT 
    CASE 
        WHEN "Patient Admission Flag" = TRUE THEN 'Admitted'
        ELSE 'Treated & Released (Not Admitted)'
    END AS admission_status,
    COUNT("Patient Id") AS patient_count,
    ROUND(COUNT("Patient Id") * 100.0 / SUM(COUNT("Patient Id")) OVER(), 2) AS percentage
FROM hospital_er_data
GROUP BY "Patient Admission Flag";

-- Insights: 4,612 Admitted vs 4,604 Treated & Released
----------------------------------------------------------------------
-- 3. DEPARTMENTAL REFERRALS BREAKDOWN

----------------------------------------------------------------------
SELECT 
    COALESCE("Department Referral", 'No Referral Required') AS department_referral,
    COUNT("Patient Id") AS total_patients
FROM hospital_er_data
GROUP BY "Department Referral"
ORDER BY total_patients DESC;

-- Insights: 5,400 No Referral | General Practice: 1,840 | Orthopedics: 995
----------------------------------------------------------------------
-- 4. PEAK BUSY PERIODS - BUSIEST DAYS OF THE WEEK

----------------------------------------------------------------------
SELECT 
    TO_CHAR("Patient Admission Date"::timestamp, 'Day') AS day_of_week,
    COUNT("Patient Id") AS total_patients
FROM hospital_er_data
GROUP BY TO_CHAR("Patient Admission Date"::timestamp, 'Day'), EXTRACT(DOW FROM "Patient Admission Date"::timestamp)
ORDER BY total_patients DESC;

-- Insights: Sundays (1,377), Saturdays (1,322), Tuesdays (1,318)
----------------------------------------------------------------------
-- 5. PEAK BUSY PERIODS - BUSIEST HOURS OF THE DAY

----------------------------------------------------------------------
SELECT 
    EXTRACT(HOUR FROM "Patient Admission Date"::timestamp) AS admission_hour,
    TO_CHAR("Patient Admission Date"::timestamp, 'HH AM') AS hourly_slot,
    COUNT("Patient Id") AS total_patients
FROM hospital_er_data
GROUP BY admission_hour, hourly_slot
ORDER BY total_patients DESC
LIMIT 5;

-- Insights: Peak arrival hours at 11 AM, 7 PM (19:00), 1 PM (13:00), and 11 PM (23:00)
----------------------------------------------------------------------
-- 6. DEMOGRAPHICS - AGE GROUPS
-- Insights: Adults 30-39 (1,200), Young Adults 20-29 (1,188), Middle-aged 40-49
----------------------------------------------------------------------
SELECT 
    CASE
        WHEN "Patient Age" >= 100 THEN '100+'
        WHEN "Patient Age" >= 90  THEN '90-99'
        WHEN "Patient Age" >= 80  THEN '80-89'
        WHEN "Patient Age" >= 70  THEN '70-79'
        WHEN "Patient Age" >= 60  THEN '60-69'
        WHEN "Patient Age" >= 50  THEN '50-59'
        WHEN "Patient Age" >= 40  THEN '40-49'
        WHEN "Patient Age" >= 30  THEN '30-39'
        WHEN "Patient Age" >= 20  THEN '20-29'
        WHEN "Patient Age" >= 10  THEN '10-19'
        ELSE '0-9'
    END AS age_group,
    COUNT("Patient Id") AS total_patients
FROM hospital_er_data
GROUP BY age_group
ORDER BY total_patients DESC;


----------------------------------------------------------------------
-- 7. DEMOGRAPHICS - RACIAL DISTRIBUTION
-- Insights: White (2,571), African American (1,951), Multi-racial (1,557), Asian (1,060)
----------------------------------------------------------------------
SELECT 
    "Patient Race",
    COUNT("Patient Id") AS total_patients,
    ROUND(COUNT("Patient Id") * 100.0 / SUM(COUNT("Patient Id")) OVER(), 2) AS percentage
FROM hospital_er_data
GROUP BY "Patient Race"
ORDER BY total_patients DESC;