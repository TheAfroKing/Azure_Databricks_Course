-- Databricks notebook source
USE f1_processed_db;

-- COMMAND ----------

CREATE TABLE f1_presentation_db.calculated_race_results
USING parquet
AS
SELECT races.race_year,
       constructors.name AS team_name,
       drivers.name AS driver_name,
       results.position,
       results.points,
       11 - results.position AS calculated_points
  FROM results 
  JOIN f1_processed_db.drivers ON (results.driver_id = drivers.driver_id)
  JOIN f1_processed_db.constructors ON (results.constructor_id = constructors.constructor_id)
  JOIN f1_processed_db.races ON (results.race_id = races.race_id)
 WHERE results.position <= 10

-- COMMAND ----------

SELECT * FROM f1_presentation.calculated_race_results

-- COMMAND ----------


