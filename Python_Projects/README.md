## 📍 STOCK DATA ETL LIFECYCLE USING JNOTEBOOK

# 📈 Intraday Stock Data ETL Pipeline

A scheduled ETL pipeline built in Python that pulls hourly stock data from the 
stockdata.org API, preprocesses it, and loads it into a local PostgreSQL database 
automatically on market hours.

---

## 🔧 Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python | Core language |
| Jupyter Notebook | Development environment |
| Pandas | Data preprocessing |
| SQLAlchemy | Database connection |
| APScheduler | Cron job scheduling |
| PostgreSQL | Local data warehouse |
| stockdata.org API | Intraday stock data source |

---

## 🏗️ Pipeline Architecture
```
stockdata.org API → hourly_stock_data() → data_preprocessing() → PostgreSQL DB
                                                  ↑
                                    APScheduler (cron: Mon-Fri, 9AM-4PM)
```

---

## ⚙️ How It Works

1. **Extract** — Sends a GET request to the stockdata.org API for hourly OHLCV data on a given ticker
2. **Transform** — Normalizes the JSON response into a flat DataFrame and converts timestamps to US/Eastern time
3. **Load** — Writes the cleaned DataFrame to a PostgreSQL table named after the ticker symbol
4. **Schedule** — The full pipeline runs automatically every hour on weekdays during market hours via APScheduler

---

## 💡 Challenges

- Handling API responses that returned empty data for certain tickers/dates without breaking the pipeline
- Managing timezone-aware vs timezone-naive datetime objects in Pandas during preprocessing

---

## 🤖 Where I Used LLMs

- Debugging the timezone conversion stripping tz info unexpectedly
- Understanding the difference between `if_exists='replace'` vs `append` in `df.to_sql()`
  

---

## 🚀 Future Improvements

- Switch from `if_exists='replace'` to `append` with deduplication logic to preserve historical data
- Add error logging to a file instead of just printing to console
- Expand to pull daily historical data and build visualizations
- Containerize the pipeline with Docker for portability

---

## 📦 Requirements
```bash
pip install pandas requests sqlalchemy psycopg2 apscheduler
```

---

## ⚠️ Notes

API token and database credentials are stored as environment variables and not 
included in this repository.









