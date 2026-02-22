CREATE DATABASE bank_case_study;
USE bank_case_study;

-- =====================================================
-- PROJECT TITLE: Bank Marketing Campaign Analysis
-- =====================================================

-- =====================================================
-- INTRODUCTION:
-- This case study analyzes bank marketing campaign data.
-- The dataset contains customer demographic and financial
-- information such as age, job, marital status, balance,
-- loans, and campaign details.
-- The goal is to understand which factors influence
-- customers to subscribe to a term deposit (y).
-- =====================================================


-- =====================================================
-- OBJECTIVE:
-- 1. Identify total customers in dataset.
-- 2. Analyze subscription (yes/no) rate.
-- 3. Study impact of balance and loans.
-- 4. Analyze campaign performance.
-- 5. Provide business insights to improve marketing strategy.
-- =====================================================



-- =====================================================
-- QUESTION 1: What is the total number of customers?
-- =====================================================
SELECT COUNT(*) AS total_customers 
FROM bank;

-- Insight:
-- The dataset contains 4521 customers.



-- =====================================================
-- QUESTION 2: What is the average age of customers?
-- =====================================================
SELECT AVG(age) AS average_age
FROM bank;

-- Insight:
-- The average age of customers is around 41 years.



-- =====================================================
-- QUESTION 3: How many customers subscribed to term deposit?
-- =====================================================
SELECT COUNT(*) AS subscribed_customers
FROM bank
WHERE y = 'yes';

-- Insight:
-- Around 521 customers subscribed to term deposit.



-- =====================================================
-- QUESTION 4: What is the highest account balance?
-- =====================================================
SELECT MAX(balance) AS highest_balance
FROM bank;

-- Insight:
-- The highest account balance is 71188.



-- =====================================================
-- QUESTION 5: Job-wise customer count
-- =====================================================
SELECT job, COUNT(*) AS total_customers
FROM bank
GROUP BY job
ORDER BY total_customers DESC;

-- Insight:
-- Management and blue-collar jobs have the highest number of customers.



-- =====================================================
-- QUESTION 6: Marital status wise subscription count
-- =====================================================
SELECT marital, COUNT(*) AS subscribed_count
FROM bank
WHERE y = 'yes'
GROUP BY marital;

-- Insight:
-- Married customers show higher subscription count.



-- =====================================================
-- QUESTION 7: Average balance by education level
-- =====================================================
SELECT education, AVG(balance) AS avg_balance
FROM bank
GROUP BY education
ORDER BY avg_balance DESC;

-- Insight:
-- Customers with tertiary education have higher average balance.



-- =====================================================
-- QUESTION 8: How many customers have housing loan?
-- =====================================================
SELECT COUNT(*) AS housing_loan_customers
FROM bank
WHERE housing = 'yes';

-- Insight:
-- Majority of customers have housing loans.



-- =====================================================
-- QUESTION 9: Customers with personal loan who subscribed
-- =====================================================
SELECT COUNT(*) AS loan_and_subscribed
FROM bank
WHERE loan = 'yes' AND y = 'yes';

-- Insight:
-- Very few customers with personal loans subscribed.



-- =====================================================
-- QUESTION 10: Month-wise subscription count
-- =====================================================
SELECT month, COUNT(*) AS subscription_count
FROM bank
WHERE y = 'yes'
GROUP BY month
ORDER BY subscription_count DESC;

-- Insight:
-- Certain months like May and August show higher subscriptions.



-- =====================================================
-- QUESTION 11: Average call duration for subscribed customers
-- =====================================================
SELECT AVG(duration) AS avg_call_duration
FROM bank
WHERE y = 'yes';

-- Insight:
-- Customers with longer call duration are more likely to subscribe.



-- =====================================================
-- QUESTION 12: Campaign-wise success analysis
-- =====================================================
SELECT campaign, COUNT(*) AS success_count
FROM bank
WHERE y = 'yes'
GROUP BY campaign
ORDER BY success_count DESC;

-- Insight:
-- Customers contacted fewer times show better success rate.



-- =====================================================
-- QUESTION 13: Previous campaign outcome analysis
-- =====================================================
SELECT poutcome, COUNT(*) AS outcome_count
FROM bank
GROUP BY poutcome;

-- Insight:
-- Most previous campaign outcomes were unknown.



-- =====================================================
-- QUESTION 14: Subscription rate (conversion percentage)
-- =====================================================
SELECT 
(COUNT(CASE WHEN y='yes' THEN 1 END) * 100.0 / COUNT(*)) 
AS conversion_rate_percentage
FROM bank;

-- Insight:
-- The overall conversion rate is around 11%.



-- =====================================================
-- QUESTION 15: Balance comparison between subscribed and non-subscribed
-- =====================================================
SELECT y, AVG(balance) AS avg_balance
FROM bank
GROUP BY y;

-- Insight:
-- Customers who subscribed have higher average balance compared to others.



-- =====================================================
-- CONCLUSION:
-- From the analysis, customers with higher balance and 
-- longer call duration are more likely to subscribe to 
-- term deposits. Marketing efforts should focus on 
-- high-balance customers and improve call engagement 
-- strategies to increase conversion rate.
-- =====================================================