# Customer Campaign Response Analysis

![Dashboard Showcase](dashboard.png)

## 📌 Project Background
The goal of this project is to analyze and understand customer behavior to identify which segments are most likely to respond to marketing campaigns for a fictional retail company. By uncovering the core characteristics associated with high campaign engagement, this analysis provides data-driven strategies to maximize future campaign response rates while minimizing marketing expenses.

The analysis is based on a Kaggle dataset containing **29 different attributes for approximately 2,240 unique customers**, tracking behavioral metrics, demographics, and performance across six distinct marketing campaigns.

---

## 🛠️ Tech Stack & Workflow
*   **Data Cleaning:** Microsoft Excel
*   **Exploratory Data Analysis & Transformation:** Microsoft SQL Server (T-SQL)
*   **Data Visualization & Reporting:** Microsoft Power BI

---

## 🔍 Key Data Insights

*   **Family Structure:** Customers **without children** demonstrated more than double the responsiveness of those with children (**44.7% vs. 20.2%**), indicating drastically different purchasing priorities.
*   **Age Demographics:** Younger customer segments (**Under 30**) showed the strongest engagement rates compared to older cohorts, suggesting high brand resonance with younger audiences.
*   **Purchasing Channels:** **Web Shoppers** yielded slightly higher response rates than catalog or traditional store shoppers, making online channels highly viable for targeted promotions.
*   **Customer Tenure:** Brand loyalty pays off—long-term customers who joined the company in **2012** exhibited the highest campaign response rates.
*   **Web Engagement Misconception:** Website visit frequency alone proved to be a poor predictor of campaign responsiveness; individuals who rarely visited the site actually recorded high response rates, while frequent visitors showed minimal engagement.

---

## 💡 Strategic Recommendations

1.  **Prioritize Youth-Centric Marketing:** Shift campaign focus and imagery toward demographics **under 30** to capitalize on their inherently higher response rates.
2.  **Optimize Digital Channels:** Increase budgetary allocation toward e-mail marketing and digital ad channels, given that online buyers interact more frequently with campaigns.
3.  **Deploy Loyalty Programs:** Create exclusive milestone promotions and personalized offers tailored specifically for long-term customer cohorts (tenure from 2012) to reward brand retention.
4.  **Adopt Multi-Factor Targeting:** Move away from single-metric targeting (like web traffic). Instead, utilize a composite target profile blending demographic properties, preferred purchasing channels, and tenure.

---

## 📂 SQL Snippets Showcase

### 1. Tracking Average Spending Profiles
```sql
SELECT 
    AVG(MntWines) AS wine_spend,
    AVG(MntFruits) AS fruit_spend,
    AVG(MntMeatProducts) AS meat_spend,
    AVG(MntFishProducts) AS fish_spend,
    AVG(MntSweetProducts) AS sweet_spend,
    AVG(MntGoldprods) AS gold_spend
FROM marketing_campaign;
