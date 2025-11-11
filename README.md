# My Project for the "Azure Databricks & Spark For Data Engineers" Course

This repository contains all my work, notebooks, and solutions for the hands-on Udemy course: **[Azure Databricks & Spark For Data Engineers](https://www.udemy.com/course/azure-databricks-spark-core-for-data-engineers)**.

This project was a deep dive into building a complete, end-to-end data engineering solution on the Azure platform.

## 🏎️ The Project: Formula 1 Racing Analytics

The core of this course was a real-world project to build a data platform analyzing historical Formula 1 racing data. My goal was to ingest data from an external source (the Ergast API) and build a scalable pipeline to transform it into clean, report-ready insights, such as "Dominant Drivers" and "Dominant Teams" over the decades.

## 📊 My Solution Architecture

I implemented a modern **Lakehouse architecture** using a multi-layered, or "Medallion," approach (Bronze, Silver, and Gold).
![Cloud Architecture](https://github.com/TheAfroKing/Azure_Databricks_Course/blob/master/Cloud%20Architecture.png)

Here is the data flow I built:

1.  **Ingestion (Bronze Layer):** I used **Azure Data Factory (ADF)** to create pipelines that fetch raw JSON and CSV data from the Ergast API. This raw data was landed in **Azure Data Lake Storage (ADLS) Gen2** in its original format.

2.  **Transformation (Silver Layer):** This is where **Azure Databricks** and **PySpark** came in. I created Spark notebooks to:
    * Read the raw Bronze data.
    * Apply schemas, clean data types, and perform transformations (e.g., handling nested JSON, joining datasets).
    * Save the cleaned, structured data as **Delta Lake tables**.

3.  **Presentation (Gold Layer):** I used **Spark SQL** on the Silver Delta tables to perform complex aggregations, window functions, and joins. The resulting tables were highly optimized and ready for business analysis and reporting.

4.  **Orchestration:** I used **ADF Triggers** to schedule my entire pipeline, automating the process from API ingestion to the creation of the final Gold tables.

5.  **Security:** All my credentials (like storage access keys and service principal secrets) were securely stored in **Azure Key Vault** and accessed safely within Databricks using secret scopes.

6.  **Reporting:** Finally, the Gold tables were connected to **Power BI**, where I could build interactive dashboards to visualize the project's findings.

## 💡 Key Skills & Concepts I Mastered

This project was more than just connecting services. I gained deep, practical skills in:

* **Apache Spark (Core & SQL):**
    * Writing complex transformations and aggregations using the **PySpark DataFrame API**.
    * Analyzing data and building business logic using **Spark SQL**.
    * Understanding Spark's architecture (Drivers, Executors, and Jobs).

* **The Lakehouse & Delta Lake:**
    * I learned *why* a standard data lake isn't enough (no ACID transactions, job failures leaving partial data).
    * I implemented a **Delta Lake** solution to get **ACID transactions**, data versioning (Time Travel), and improved performance.
    * I wrote code for **incremental data loading**, a critical skill for real-world data pipelines.

* **Data Governance with Unity Catalog:**
    * This was a key part of the course. I learned how to implement **Unity Catalog** for centralized data governance.
    * I set up the 3-level object model (Metastore, Catalogs, Schemas).
    * I managed data security using Access Control Lists (ACLs) with `GRANT` and `REVOKE`.
    * I also explored powerful features like **automated data lineage** and audit logging.

* **Azure Cloud Integration:**
    * I built and managed the entire solution within the Azure ecosystem.
    * I managed secure, service-to-service communication using **Service Principals** and **Azure Key Vault** to avoid exposing credentials in code.
    * I automated the whole process using **Azure Data Factory**.

---

### About the Course Instructor

* **Ramesh Retnasamy**
    * [LinkedIn Profile](https://www.linkedin.com/in/ramesh-retnasamy/)
    * [Udemy Profile](https://www.udemy.com/user/ramesh-retnasamy-4/)
