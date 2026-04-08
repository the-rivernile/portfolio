
# Sales Dashboard and Inventory Management Proof of Concept


## 🔴 Project Overview

This project showcases data given to me secondhand and how I transformed, cleaned, loaded, and manipulated said data to provide meaningful insights on sales history for a small online retailer.

The overall flow goes as follows

 jupyternotebook --> bigquery --> dbt--> VSCODE(streamlit) 
 
## 🧰 Tools and Skills 
- jupyternotebook/python(extraction/manipulation/exporting).
- dbt/SQL(Data Cleaning/Aggregating).
- bigquery(datawarehousing/querying)
- Small Business insight reporting.

## 📅 Dataset 
While the raw dataset contains critical info which I am unable to share the following are attributes:
Date of sale,Time of sale,Date of listing,Bundle,Bundle - amount of items,Buyer,Brand,Description,Size,Item price,Buyer shipping cost,Total,USPS Cost,Depop fee,Depop Payments fee,Buyer Marketplace Fee,Boosting fee,Payment type,Estimated payout date,Payout arrival date,Category,Name,Address Line 1,Address Line 2,City,State,Post Code,Country,US Sales tax,Refunded to buyer amount,Fees refunded to seller.

<sub>the data came to me in a structured format as a csv but consisted of multiple null and duplicate values </sub>

## The Scripts for each section of the workflow can be found below

- [jnotebook load](https://github.com/the-rivernile/portfolio/blob/main/Python_Projects/Simple%20Sales%20Dashboard/sales%20dash/ael_data.ipynb)
- [dbt models](https://github.com/the-rivernile/portfolio/tree/main/Python_Projects/Simple%20Sales%20Dashboard/sales%20dash/models)
- [UI script](https://github.com/the-rivernile/portfolio/blob/main/Python_Projects/Simple%20Sales%20Dashboard/sales%20dash/app.py)
- [Inventory Proof of Concept](https://github.com/the-rivernile/portfolio/blob/main/Python_Projects/Simple%20Sales%20Dashboard/sales%20dash/pages/Update%20Inventory.py)

📺 UI Video Overview
[Video](https://youtu.be/HkW-UmOG6I4)
  


