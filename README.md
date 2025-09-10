# SQL-Power-BI-Road-Safety-in-the-UK
# Dataset Overview

This project uses a dataset containing three relational tables:

Accident
Contains accident-level information:

Location (longitude, latitude, junctions, carriageways)

Temporal details (date, time)

Number of casualties

Weather and road conditions

Vehicle
Provides details about vehicles and drivers:

Vehicle identifiers (linked to accidents)

Driver characteristics (gender, journey purpose, etc.)

Vehicle behavior and circumstances

Vehicle_Type
A lookup table with descriptive information about each vehicle category (e.g., Cars, Motorcycles, Bicycles, Heavy Goods Vehicles).

# Project Idea

The goal of this project is to perform accident data analysis using SQL aggregate functions and Power BI visualizations to uncover insights.

Key analytical objectives:

Median Severity of Motorcycle Accidents

Evaluate the median accident severity value for accidents involving motorcycles.

Severity & Total Accidents per Vehicle Type

Group accidents by vehicle type.

Compare severity distribution and accident counts.

Average Severity by Vehicle Type

Calculate average severity scores across all vehicle categories.

Motorcycle Accident Focus

Calculate both average severity and total number of accidents involving motorcycles specifically.

# Tools & Technologies

SQL Server: Data cleaning, joins, and aggregate queries.

Power BI: Dashboard creation and visualization.

GitHub: Version control and project documentation.

# Sample Visualizations

Accident severity trend by vehicle type.

Distribution of accident severity (fatal, serious, slight).

Motorcycle-specific accident analysis.

Heatmap of accident locations (if latitude/longitude available).

# How to Use

Import the dataset into SQL Server.

Run SQL scripts to prepare analytical tables.

Load results into Power BI via SQL connection.

Explore visual dashboards for insights.
