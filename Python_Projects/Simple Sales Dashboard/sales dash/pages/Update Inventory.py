import streamlit as st
import pandas as pd
import uuid
from datetime import datetime
from google.oauth2 import service_account
from google.cloud import bigquery


creds = service_account.Credentials.from_service_account_info(
    st.secrets["gcp_service_account"],
    scopes= ["https://www.googleapis.com/auth/cloud-platform"]
)

client = bigquery.Client(credentials=creds, project="data-learning-490201")

# create df to input into bigquery


col1,col2,col3 = st.columns([1,10,1])
col2.title("Update Your Inventory")


# create form to create db
columns = ["SKU", "Category", "Brand", "Price Paid", "List Price"]
if "inven_df" not in st.session_state:
    st.session_state.inven_df = pd.DataFrame(columns=columns)

with st.form("add_item"):
    category = st.selectbox("Category", ["Tops","Bottoms","Shoes","Hats","Glasses"])
    paid_price = st.number_input("Price Paid For Item")
    init_list = st.number_input("Initial List Price")
    brand = st.text_input("Brand")
    source = st.selectbox("Source",["Garage/Yard Sale","Estate Sale", "racks", "bins", "online"])
    submitted = st.form_submit_button("Add Item")

if submitted:
    category_prefix = category[:4].upper()
    brand_prefix = brand[:4].upper()
    unique_suffix = str(uuid.uuid4())[:6].upper()
    sku = f"{category_prefix}-{brand_prefix}-{unique_suffix}"
        
    new_row = {"SKU": sku, "Category": category, "Brand": brand, "Price Paid": paid_price, "List Price": init_list,"Source": source}
    st.session_state.inven_df = pd.concat([st.session_state.inven_df, pd.DataFrame([new_row])], ignore_index=True)




st.caption(f"{len(st.session_state.inven_df)} items in inventory")

display_df = st.session_state.inven_df.copy()
display_df.insert(0, "Delete", False)

edited = st.data_editor(display_df, hide_index=True)

# Delete button after editor
if st.button("Delete Selected"):
    st.session_state.inven_df = edited[edited["Delete"] == False].drop(columns=["Delete"]).reset_index(drop=True)
    st.rerun()

project_id = "data-learning-490201"
dataset_id = "depop"
table_id = "Inventory"
if st.button("Save Updates to Database"):
    final_df = st.session_state.inven_df
    final_df.to_gbq(
        destination_table=f'{dataset_id}.{table_id}',
        if_exists='append',
        )
    st.toast("Data succesfully Saved")


# connect to bigquery for cloud compute
# cloud db