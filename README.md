# Data Science Biology Final Project

## App: https://annahmc.shinyapps.io/datasciencebiologyfinalproject/ 

## Report: https://docs.google.com/document/d/1vpHVDka_D544-L4ODfSnUrt5zdVx7GqS0fabhTs0xCE/edit?usp=sharing

## Authors and Contributions

- Nikhil:
  - Some of the initial data importing and cleaning
  - Processing the NDVI data
  - Interactive shiny plots (timeseries and NDVI)
  - Integrating all shiny plots together + debugging
  - Deploying the shiny app
- Anna:
  - Downloading the data
  - Also working on inital data importing and cleaning
  - Shiny plots for variables against each other and statistics about variables
  - Helping debugging combined app
  - Helping deploying the shiny app

## Repository Contents
- `Data/CA_NSx`: Directly-downloaded Fluxnet data for site CA_NSx (http://fluxnet.org, subset data product)
- `Data/MODIS_NDVI_data.csv`: Directly-downloaded NDVI data from AppEEARS MODIS Terra (https://appeears.earthdatacloud.nasa.gov/); 500m 16daily resolution for pixel matching latitude and longitude of each site from 2002 to 2005
- `nikhilexploration.qmd`: Fixes date object format for Fluxnet data
- `Anna_Exploratory_File.qmd`: Imports and cleans up all data, contains some experimental plotting
- `nikhilplots.qmd`: Initial Shiny plot exploration for Nikhil's plots
- `app1/`, `app2/`, `app3/`: Some preliminary shiny apps; experimentation by Nikhil
- `AnnaShinyExploration.qmd`: First iteration of the full shiny app, with initial version of Anna's plots
- `Integration.qmd`: Full integration of all shiny plots into final deployable app

