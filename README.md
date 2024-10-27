
<!-- README.md is generated from README.Rmd. Please edit that file -->

# REnergy

<!-- badges: start -->
<!-- badges: end -->

The REnergy package provides tools for exploring renewable energy trends
in Australia, with a focus on data from 2010 to 2023. This package
includes a Shiny app that allows users to visualize investment trends
and energy production breakdowns by year and energy type. The package
aims to help analysts, researchers, and policymakers gain insights into
renewable energy investment patterns and production in Australia.

## Installation

You can install the development version of REnergy like so:

``` r
#install.packages("remotes") # Uncomment if 'remotes' is not already installed
remotes::install_github("https://github.com/ETC5523-2024/assignment-4-packages-and-shiny-apps-akshatamhaski/tree/main/REnergy")
```

## Example

Example Here’s a basic example of how to use the REnergy package. First,
you can load the package and launch the Shiny app to explore renewable
energy data interactively:

``` r
library(REnergy)
launch_shiny_app()
```

This command will open a Shiny app in your default web browser. Within
the app, you can explore:

Investment Trends: Select an energy type to view the total investments
over time (2010-2023). Energy Production by Type: Select a year to view
a breakdown of renewable energy production by type. Alternatively, you
can access and manipulate the cleaned dataset directly if you prefer
working with raw data:

``` r
# Access the cleaned dataset for analysis
data <- REnergy::get_cleaned_data()

# View the first few rows of the dataset
head(data)
```

## Main Components

The REnergy package consists of the following key components:

Shiny App: The main feature of the package, providing an interactive
interface to explore renewable energy trends in Australia.

Investment Trends Plot: A line plot that displays total investments by
energy type over time.

Energy Production Plot: A bar plot that shows the production breakdown
by energy type for a selected year.

get_cleaned_data(): Loads and returns a cleaned version of the renewable
energy dataset.

introduction vignette: A comprehensive guide is available in the
vignette section, explaining how to use the Shiny app and work with the
data.

## Documentation

For detailed documentation, see the [REnergy pkgdown
site](https://etc5523-2024.github.io/assignment-4-packages-and-shiny-apps-akshatamhaski/).
