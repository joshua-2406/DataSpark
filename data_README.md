# 📂 Dataset Information

This folder contains the datasets used in the **DataSpark: Illuminating Insights for Global Electronics** project.

> ⚠️ **Note:** The raw CSV files are not uploaded to this repository due to file size limitations.  
> Please download the datasets from the link below and place them in this `data/` folder before running the notebook.

---

## 📥 Download Dataset

🔗 **[Click here to download the datasets]([https://your-drive-link-here](https://drive.google.com/drive/folders/1Ag9pAbXmPtBVz6pDHa_yGI_wzK61TTao))**

## 📋 Dataset Files

Once downloaded, your `data/` folder should contain these 5 files:

| File Name | Description | Key Columns |
|---|---|---|
| `customers.csv` | Customer demographic information | CustomerKey, Gender, Birthday, City, State, Country, Continent |
| `products.csv` | Product catalog with pricing | ProductKey, Product Name, Category, Subcategory, Unit Cost, Unit Price |
| `sales.csv` | Transaction / order records | Order Number, Order Date, CustomerKey, StoreKey, ProductKey, Quantity |
| `stores.csv` | Store location and size info | StoreKey, Country, State, Square Meters, Open Date |
| `currency_exchange.csv` | Daily currency exchange rates | Date, Currency, Exchange Rate |

---

## 📊 Dataset Summary

| Dataset | Approx. Rows | Approx. Columns |
|---|---|---|
| customers.csv | 15,000+ | 8 |
| products.csv | 2,500+ | 8 |
| sales.csv | 60,000+ | 7 |
| stores.csv | 67 | 6 |
| currency_exchange.csv | 5,000+ | 3 |

---

## 🔗 How Datasets Are Linked

```
sales.csv
   ├── ProductKey  ──────────► products.csv
   ├── CustomerKey ──────────► customers.csv
   ├── StoreKey    ──────────► stores.csv
   └── Order Date  ──────────► currency_exchange.csv (via Date)
```

---

## ⚙️ How to Use

After downloading, place all CSV files inside the `data/` folder:

```
DataSpark/
└── data/
    ├── customers.csv
    ├── products.csv
    ├── sales.csv
    ├── stores.csv
    └── currency_exchange.csv
```

Then open and run the main notebook:

```bash
jupyter notebook "The Final Project.ipynb"
```
