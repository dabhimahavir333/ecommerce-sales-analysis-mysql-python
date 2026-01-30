# E-commerce Sales Analysis (MySQL & Python)

## Project Overview
This project analyses online retail transaction data containing over 540,000 records.
The goal is to clean raw data, apply business rules, and extract meaningful business insights
using Python and MySQL.

## Tools Used
- Python (data loading and preparation)
- MySQL (data cleaning and analysis)
- SQL (business analysis queries)

## Dataset
- Online retail transactional data
- Over 540,000 sales records
- Includes product, customer, pricing, and date information

## Key Steps Performed
- Loaded large CSV data using Python with proper encoding handling
- Cleaned data by removing cancelled transactions and invalid prices
- Converted and normalised date formats
- Created clean analytical tables using business logic
- Performed revenue, product, customer, and country-level analysis

## Key Business Insights
- Total revenue: approximately £10.6 million
- Strong end-of-year sales pattern with peak in November 2011
- Revenue driven mainly by gift and seasonal products
- Small group of high-value customers contributes a large share of revenue
- Business is primarily UK-focused

## Repository Structure
    

## Example Analysis Queries
- Total revenue calculation
- Monthly revenue trend
- Top products by revenue
- Top customers by revenue
- Country-wise revenue analysis

## How to Run This Project
1. Create tables using SQL scripts in the `sql` folder
2. Load data using `python/load_data.py`
3. Run analysis queries from `sql/03_analysis_queries.sql`

## Author
Mahavirsinh Dabhi
