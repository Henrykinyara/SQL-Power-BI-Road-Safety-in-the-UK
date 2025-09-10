--UK TRAFFIC ACCIDENTS PROJECT

Use HenryKinyaraDatabase;

Select*From Accidents_2015;
Select*From Vehicles_2015;
Select*From vehicle_types;

--Joining Tables for analysis
Select 
A.Accident_Index,A.Longitude,A.Latitude,A.Police_Force,A.Accident_Severity,A.Number_of_Vehicles,A.Number_of_Casualties,A.Date,A.Day_of_Week,A.Weather_Conditions,
A.Road_Surface_Conditions,A.Urban_or_Rural_Area,A.Did_Police_Officer_Attend_Scene_of_Accident, VT.label,
V.Vehicle_Type,V.Vehicle_Manoeuvre,V.Junction_Location,V.Skidding_and_Overturning,V.Hit_Object_in_Carriageway,V.Hit_Object_off_Carriageway,V.Vehicle_Leaving_Carriageway,
V._1st_Point_of_Impact,V.Was_Vehicle_Left_Hand_Drive,V.Journey_Purpose_of_Driver,V.Sex_of_Driver,V.Age_of_Driver,V.Propulsion_Code,V.Age_of_Vehicle
Into UK_Traffic_INFO From Accidents_2015 AS A full join Vehicles_2015 AS V
on A.Accident_Index=V.Accident_Index 
full join vehicle_types AS VT on V.Vehicle_Type=VT.code;

Select*From UK_Traffic_INFO;


--Creating view for power BI
GO 
Create view vw_UKtrafficInfo AS
Select*From UK_Traffic_INFO
GO;

--ANALYSIS OF DATA

-- Accident Severity and Total Accidents per Vehicle Type

Select COUNT(*) AS Total_Accidents,UK_Traffic_INFO.Accident_Severity,UK_Traffic_INFO.label--
From UK_Traffic_INFO
Group by UK_Traffic_INFO.Accident_Severity,UK_Traffic_INFO.label
Order by Total_Accidents Desc;

Select COUNT(*) AS Total_Accidents,UK_Traffic_INFO.label--Total Accidents per vehicle type
From UK_Traffic_INFO
Group by UK_Traffic_INFO.label
Order by Total_Accidents Desc; 

-- Average Severity and Total Accidents by Motorcycle

Select AVG(Cast( UK_Traffic_INFO.Accident_Severity as Float)) as Motorcycle_Average_Severity ,COUNT(*) AS Total_Accidents,UK_Traffic_INFO.label
From UK_Traffic_INFO
Where UK_Traffic_INFO.label like '%cycle%'
Group by UK_Traffic_INFO.label
Order by Total_Accidents Desc;

--Average Severity by vehicle type

Select AVG(cast(UK_Traffic_INFO.Accident_Severity as float)) AS Average_severity_by_vehicle_type, UK_Traffic_INFO.label
From UK_Traffic_INFO
Group by UK_Traffic_INFO.label
Order by Average_severity_by_vehicle_type Desc;


--Median severity value of accidents caused by various Motorcycles

Select PERCENTILE_CONT(0.5) within group (Order by UK_Traffic_INFO.Accident_Severity) OVER() AS Median_severity_accidents_by_Motorcycles,UK_Traffic_INFO.label
From UK_Traffic_INFO
Where label like '%Motorcycle%'
Group by UK_Traffic_INFO.Accident_Severity,UK_Traffic_INFO.label;
