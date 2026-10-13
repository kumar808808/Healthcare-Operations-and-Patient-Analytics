# 🏥 Healthcare Operations & Patient Care Analytics (End-to-End Data Analytics Project)


##  Project Overview
This end-to-end data analytics project examines **Emergency Room (ER) operations and patient management** over a **19-month period**. Using a hybrid tech stack of **Power BI (DAX), SQL, and Python (Pandas & Seaborn)**, the project evaluates key performance metrics such as patient wait times, admission patterns, department referrals, peak operational hours, and satisfaction scores to optimize resource allocation and improve patient care.

---

##  Key Business Insights & Highlights
* **Total Patient Volume:** **9,216 unique patients** recorded across 19 months.
* **Patient Wait Time:** Average wait time is **35.3 minutes**, highlighting operational bottlenecks during peak hours.
* **Patient Satisfaction:** Average satisfaction score stands at **4.99 / 10**, indicating moderate satisfaction and a need for experience improvement.
* **Admission Patterns:** Nearly half of the visitors (**4,612 patients / 50.04%**) were admitted, while **4,604 patients (49.96%)** were treated and released.
* **Departmental Referrals:** **5,400 patients** required no referral. Among those referred, **General Practice (1,840 cases)** and **Orthopedics (995 cases)** were the highest, followed by **Physiotherapy (276 cases)** and **Cardiology (248 cases)**.
* **Peak Busy Periods:**
  * **Busiest Days:** Sundays (**1,377 patients**), Saturdays (**1,322 patients**), and Tuesdays (**1,318 patients**).
  * **Busiest Hours:** Peak patient arrivals occur at **11:00 AM, 1:00 PM (13:00), 7:00 PM (19:00), and 11:00 PM (23:00)**.
* **Demographics:**
  * **Age Distribution:** Adults aged **30–39 (1,200 patients)** and young adults aged **20–29 (1,188 patients)** represent the largest age brackets.
  * **Racial Breakdown:** **White (2,571)**, **African American (1,951)**, **Multi-racial (1,557)**, and **Asian (1,060)**. **1,030 patients** declined to state.

---

## Tech Stack & Implementation Details

| Layer | Technology | Key Deliverables & Responsibilities |
| :--- | :--- | :--- |
| **Business Intelligence** | **Power BI / DAX** | Interactive dashboard, custom measures, time intelligence, and dynamic slicers. |
| **Database Querying** | **SQL (PostgreSQL/MySQL)** | Recreated DAX measures as SQL Views (`v_hospital_er_enriched`) and analytical queries. |
| **Data Science / Automation** | **Python (Colab / Jupyter)** | Feature engineering in Pandas, DAX logic replication, statistical EDA, and plotting. |

---

##  DAX to SQL & Python Logic Mapping

| DAX Measure / Column | SQL Equivalent | Python Pandas Equivalent |
| :--- | :--- | :--- |
| **`Admission status`** | `CASE WHEN "Patient Admission Flag" = TRUE THEN 'Admitted' ELSE 'Not Admitted' END` | `np.where(df['Patient Admission Flag'] == True, 'Admitted', 'Not Admitted')`|
| **`Waittime status`** | `CASE WHEN "Patient Waittime" <= 30 THEN 'Within Target' ELSE 'Target missed' END` | `np.where(df['Patient Waittime'] <= 30, 'Within Target', 'Target missed')` |
| **`Age group`** | `CASE WHEN "Patient Age" >= 70 THEN '70-79' ... END` | Custom `apply()` function binning age into 10-year ranges|
| **`No of Patient Referred`** | `COUNT(CASE WHEN "Department Referral" <> 'None' THEN 1 END)| `df[df['Department Referral'] != 'None']['Patient Id'].count()` |

---
## 1. Consolidated View
Monitors overall patient volume, admission split, wait times, and satisfaction scores at a glance.
<img src="Dashboard/Dashboard_consolidatedview.png" width="100%">

## 2. Monthly View
Explores monthly arrival trends, peak operational days, and temporal demand patterns.
<img src="Dashboard/Dashboard_monthlyview.png" width="100%">

## 3. Patient Details
Provides individual patient records, department referrals, and demographic breakdowns.
<img src="Dashboard/Dashboard_patinetdetails.png" width="100%">

## 4. Insights & Metrics
Summarizes key operational findings, wait-time bottlenecks, and actionable recommendations.
<img src="Dashboard/Dashboard_insights.png" width="100%">
##  Recommendations & Actionable Next Steps
1. **Optimize Staffing Schedules:** Allocate additional nursing and medical staff during peak surge windows (**11 AM, 1 PM, 7 PM, and 11 PM**) and weekends (Saturdays and Sundays) to reduce average wait times below 30 minutes.
2. **Fast-Track Referrals for General Practice & Orthopedics:** Streamline triage processes for GP and Orthopedic referrals, which account for over **74% of all total referrals**.
3. **Enhance Patient Triage Communication:** Implement real-time wait-time displays in ER reception to manage expectations and improve satisfaction ratings from the current **4.99 baseline*.

---
