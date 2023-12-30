# Ecommerce-Analysis

![Dashboard](https://github.com/dataliew/Ecommerce-Analysis/blob/main/Ecommerce_Dashboard.png?raw=true)


## **Overview**

The goal of this project is to analyze Electronic Ecommerce sales data (09/2020-02/2021) to extract insights and find opportunities to increase net revenue.
- Tools: MySQL, DBeaver, Tableau Desktop

Business Problem: Increase Net Revenue of Ecommerce business

Analysis
- Setting and Tracking KPIs (Purchase Conversion Rate, Average Order Value, Total Purchases)
- Conduct Event Type Funnel Analysis
- Conduct Repeat Purchase Cohort Analysis 

## **Potential Stakeholders**

- Data Analyst, Product Manager aiming for growth in revenue. Especially interested in identifying patterns in sales data
- Senior business stakeholders who makes core business decisions 

## **Dataset Description**

Source: https://www.kaggle.com/datasets/mkechinov/ecommerce-events-history-in-electronics-store

Shape: 885,129 x 9

event_time: When the event occurred  
event_type: One of [view, cart, purchase]  
product_id: Product ID  
category_id: Product Category ID  
categroy_code: Category name (e.g. computer.desktop)  
brand: Product Brand  
price: Product Price  
user_id: Permenant User ID  
user_session: Permenant Session ID  

## **How to use (Video Explanation)**



## **Conclusion**
- Purhcase Conversion Rate gradually increased by 1% 09/2020 through 02/2021
- Average Order Value also gradually increased by $4.82 09/2020 through 02/2021
- Increase in the number of purchases is slowing down
- Repeat Purchase rate is significnatly low, average 1% which is critical in growth in business

Actionable insights
- Increase the number of purchases by focusing on increasing Repeat Purchase Rate
- Send returning users coupons to encourage repeat purchase
- Send push notification to encourage repeat purchase and optimize those push notification by conducting A/B tests
  
Limitation
- Dataset is not complex enough to conduct deep analysis
- No information about ecosystem of the ecommerce business
- No information about the history of business (e.g. error, strategy)

## **Future Work**
- Identify a dataset that contains more complex user logs and extract more insights
- Add more numerical details on Tableau Dashboard
