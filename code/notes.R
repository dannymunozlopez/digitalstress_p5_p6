#Peru 5 and 6 filtering notes 
Relevant data: 
  Peru 5 and 6: Group 3
  DSS: session 3
  PROMIS Anx & Dep: session 1
  
Used "Peru5_6_relevant_measures_filtered_copy.csv" in dss_anx_dep_plots_DML
  CSV contains P5 & P6 with relelvant measures
  Used grepl to get data from each wave within DF
  ***used this DF and RMD to plot and model longitudinal analyses
  

IMPORTANT FOR DSS P6: 
  DID NOT INCLUDE 20 ITEMS, DROPPED 6 AND 18 SO FULL DSS ONLY HAS 18 ITEMS, therefore DSS 19 and 20 are NA for all of Peru 6 data
FOR PERU 5:
  We administered all 20 items, but after EFA dropped items 6 and 18 out of the 20 items were dropped

#make DF with only Peru 6 data 
p6 <- peru6_relevant_clean[grepl("6_", peru6_relevant_clean$wave_ID),] #N = 782
#drop items 19 and 20 since there is no data for this
p6 <- p6[, !(names(p6) %in% c("dss19", "dss20"))]

#Relabel responses to match Peru 5 DSS (no dss 6 or 18)
p6 <- p6 %>%
  rename("dss7" = "dss6",
         "dss8" = "dss7",
         "dss9" = "dss8",
         "dss10" = "dss9",
         "dss11" = "dss10",
         "dss12" = "dss11",
         "dss13" = "dss12",
         "dss14" = "dss13",
         "dss15" = "dss14",
         "dss16" = "dss15",
         "dss17" = "dss16",
         "dss19" = "dss17",
         "dss20" = "dss18")
*review filter_p6_relevant_measures RMD in digitalstress_p5

UPDATE AS OF 10/02/2024: CHANGED ORIGINAL DATA FILE TO PULL DATA. Now using peru56_DSS_PROMIS_(PSS)_RT_2023Jan25.csv (this data was preprocessed by RT and includes complete cases of DSS and PROMIS data)