# NBA Data Warehouse

This project delivers a complete NBA Data Warehouse solution, including a Galaxy schema, ETL pipelines, and an interactive BI report. It allows for efficient integration, transformation, and analysis of NBA-related data.

## 🛠️ Setup Instructions

Follow these steps to set up and run the project:

### 1. Create the Data Warehouse Schema

- Open **SQL Server Management Studio (SSMS)**.
- Run the script `schema.sql` to create the data warehouse schema and tables.

### 2. Populate the `dimDate` Dimension

- In SSMS, run the script `populate_date.sql` to insert a full date range into the `dimDate` table.

### 3. Run the ETL Pipeline

- Navigate to the `ETL` folder.
- Open `prepare_warehouse.sln` using **Visual Studio**.
- Before running the pipeline, update the `BaseDir` parameter in the Project.params in Solution Explorer to point to your local repository path.
- Run the SSIS pipeline to extract, transform, and load the data into the warehouse.

### 4. Explore the BI Report

- Go to the `BI` folder.
- Open the Power BI report file to explore and analyze the loaded data.

---

🎉 **Enjoy your NBA data exploration**
