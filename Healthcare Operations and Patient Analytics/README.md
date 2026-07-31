# 🏥 Healthcare Operations & Patient Care Analytics (End-to-End Data Analytics Project)


##  Project Overview
This end-to-end data analytics project examines **Emergency Room (ER) operations and patient management** over a **19-month period**. Using a hybrid tech stack of **Power BI (DAX), SQL, and Python (Pandas & Seaborn)**, the project evaluates key performance metrics such as patient wait times, admission patterns, department referrals, peak operational hours, and satisfaction scores to optimize resource allocation and improve patient care.

---

##  Key Business Insights & Highlights
* **Total Patient Volume:** **9,216 unique patients** recorded across 19 months.
* **Patient Wait Time:** Average wait time is **35.3 minutes**, highlighting operational bottlenecks during peak hours[cite: 1].
* **Patient Satisfaction:** Average satisfaction score stands at **4.99 / 10**, indicating moderate satisfaction and a need for experience improvement[cite: 1].
* **Admission Patterns:** Nearly half of the visitors (**4,612 patients / 50.04%**) were admitted, while **4,604 patients (49.96%)** were treated and released[cite: 1].
* **Departmental Referrals:** **5,400 patients** required no referral[cite: 1]. Among those referred, **General Practice (1,840 cases)** and **Orthopedics (995 cases)** were the highest, followed by **Physiotherapy (276 cases)** and **Cardiology (248 cases)**[cite: 1].
* **Peak Busy Periods:**
  * **Busiest Days:** Sundays (**1,377 patients**), Saturdays (**1,322 patients**), and Tuesdays (**1,318 patients**)[cite: 1].
  * **Busiest Hours:** Peak patient arrivals occur at **11:00 AM, 1:00 PM (13:00), 7:00 PM (19:00), and 11:00 PM (23:00)**[cite: 1].
* **Demographics:**
  * **Age Distribution:** Adults aged **30–39 (1,200 patients)** and young adults aged **20–29 (1,188 patients)** represent the largest age brackets[cite: 1].
  * **Racial Breakdown:** **White (2,571)**, **African American (1,951)**, **Multi-racial (1,557)**, and **Asian (1,060)**[cite: 1]. **1,030 patients** declined to state[cite: 1].

---

## Tech Stack & Implementation Details

| Layer | Technology | Key Deliverables & Responsibilities |
| :--- | :--- | :--- |
| **Business Intelligence** | **Power BI / DAX** | Interactive dashboard, custom measures, time intelligence, and dynamic slicers[cite: 1]. |
| **Database Querying** | **SQL (PostgreSQL/MySQL)** | Recreated DAX measures as SQL Views (`v_hospital_er_enriched`) and analytical queries[cite: 1]. |
| **Data Science / Automation** | **Python (Colab / Jupyter)** | Feature engineering in Pandas, DAX logic replication, statistical EDA, and plotting[cite: 1]. |

---

##  DAX to SQL & Python Logic Mapping

| DAX Measure / Column | SQL Equivalent | Python Pandas Equivalent |
| :--- | :--- | :--- |
| **`Admission status`** | `CASE WHEN "Patient Admission Flag" = TRUE THEN 'Admitted' ELSE 'Not Admitted' END`[cite: 1] | `np.where(df['Patient Admission Flag'] == True, 'Admitted', 'Not Admitted')`[cite: 1] |
| **`Waittime status`** | `CASE WHEN "Patient Waittime" <= 30 THEN 'Within Target' ELSE 'Target missed' END`[cite: 1] | `np.where(df['Patient Waittime'] <= 30, 'Within Target', 'Target missed')`[cite: 1] |
| **`Age group`** | `CASE WHEN "Patient Age" >= 70 THEN '70-79' ... END`[cite: 1] | Custom `apply()` function binning age into 10-year ranges[cite: 1] |
| **`No of Patient Referred`** | `COUNT(CASE WHEN "Department Referral" <> 'None' THEN 1 END)`[cite: 1] | `df[df['Department Referral'] != 'None']['Patient Id'].count()`[cite: 1] |

---

##  Recommendations & Actionable Next Steps
1. **Optimize Staffing Schedules:** Allocate additional nursing and medical staff during peak surge windows (**11 AM, 1 PM, 7 PM, and 11 PM**) and weekends (Saturdays and Sundays) to reduce average wait times below 30 minutes[cite: 1].
2. **Fast-Track Referrals for General Practice & Orthopedics:** Streamline triage processes for GP and Orthopedic referrals, which account for over **74% of all total referrals**[cite: 1].
3. **Enhance Patient Triage Communication:** Implement real-time wait-time displays in ER reception to manage expectations and improve satisfaction ratings from the current **4.99 baseline**[cite: 1].

---
