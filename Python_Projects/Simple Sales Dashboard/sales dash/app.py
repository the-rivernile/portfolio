import streamlit as st
from google.oauth2 import service_account
from google.cloud import bigquery
import pandas as pd
from datetime import datetime
import numpy as np



st.markdown("""
<style>
.big-font {
    font-size:50px !important;
}
</style>
""", unsafe_allow_html=True)

credentials = service_account.Credentials.from_service_account_info(
    st.secrets["gcp_service_account"],
    scopes=["https://www.googleapis.com/auth/cloud-platform"]
)

st.title("Ael's Depop Dashboard")

client = bigquery.Client(credentials=credentials, project="data-learning-490201")

con = st.connection(
    "bigquery",
    type="sql",
    url="bigquery://data-learning-490201",
)

df = con.query("SELECT * FROM `data-learning-490201.depop.mart_depop` LIMIT 1000;")


def filterdata(df):
    pps = df['net_payout'].sum() / len(df)
    atf = df['total_fees'].sum()
    atp = df['net_payout'].sum()
    total_items_sold = len(df)
    avg_sale_price = df['item_price'].sum() / len(df)
    hpo = max(df['net_payout'])
    top_n = 3
    df_grouped = df.groupby("category")["net_payout"].sum().reset_index()
    df_top = df_grouped.nlargest(top_n, "net_payout")
    col1, col2, col3 = st.columns(3)
    col1.metric(label="Revenue", value=f"${atp:,.2f}", border=True)
    col1.metric(label="Average Profit Per Sale", value=f"${pps:,.2f}", border=True)
    col2.metric(label="Fees", value=f"${atf:,.2f}", border=True)
    col2.metric(label="Items Sold", value=total_items_sold, border=True)
    col3.metric(label="Highest Payout", value=f"${hpo:,.2f}", border=True)
    col3.metric(label="Average List/Sale Price", value=f"${avg_sale_price:,.2f}", border=True)
    return df




with st.sidebar:
     filt_year = st.selectbox("Filter Revenue by Year",['2023', '2024','2025','2026'])

   

df_filt_year = filterdata(df[(df['date_of_sale'] > pd.Timestamp(f'{filt_year}-01-01', tz='UTC')) & (df['date_of_sale'] < pd.Timestamp(f'{filt_year}-12-31', tz='UTC'))])
st.write(df_filt_year)


# st.markdown('<p class="big-font">Top Performers</p>', unsafe_allow_html=True)
# st.bar_chart(df_top, x="category", y="net_payout", x_label="Top 3 Categories", y_label="Pay", horizontal=False)

