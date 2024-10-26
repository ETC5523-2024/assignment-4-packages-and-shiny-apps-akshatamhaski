## code to prepare `energy_data` dataset goes here


# Load necessary libraries
library(tidyverse)
library(janitor)
library(usethis)

# Load the raw data from data-raw folder
raw_data <- read_csv("data-raw/complete_renewable_energy_dataset.csv")

# Clean the data
cleaned_data <- raw_data %>%
  clean_names() %>%                           # Standardize column names
  filter(country == "Australia") %>%           # Filter for Australia only
  select(year, country, energy_type,           # Select relevant columns
         investments_usd, production_g_wh) %>%
  mutate(
    year = as.integer(year),                   # Ensure year is an integer
    investments_usd = as.numeric(investments_usd),  # Ensure numeric format
    production_g_wh = as.numeric(production_g_wh)   # Ensure numeric format
  )

# Save the cleaned data in the 'data' directory for the package
usethis::use_data(cleaned_data, overwrite = TRUE)



