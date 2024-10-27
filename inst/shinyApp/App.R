# Load necessary libraries
library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)

# Load the pre-cleaned dataset from the package data directory
data("cleaned_data", package = "REnergy")

# Define UI for the Shiny app with a theme
ui <- fluidPage(
  theme = shinytheme("flatly"),  # Set a predefined theme "flatly"
  titlePanel("Australia's Renewable Energy Trends (2010-2023)"),

  sidebarLayout(
    sidebarPanel(
      helpText("Explore Australia's renewable energy data from 2010 to 2023."),

      # Dropdown for the first plot (Investment Trends)
      selectInput("investment_energy_type", "Select Energy Type for Investments:",
                  choices = unique(cleaned_data$energy_type),
                  selected = "Solar"),
      br(),
      helpText("The 'Energy Type' filter allows you to select a renewable energy type to explore investment trends."),

      # Slider for the second plot (Energy Production by Type)
      sliderInput("production_year", "Select Year:",
                  min = min(cleaned_data$year),
                  max = max(cleaned_data$year),
                  value = max(cleaned_data$year),
                  step = 1,
                  sep = ""),

      br(),

      # Help text below the inputs
      helpText("The 'Year' slider allows you to explore energy production for the selected year.")
    ),

    mainPanel(
      # First plot: Investment Trends (line plot)
      plotOutput("investmentPlot"),
      helpText("This line plot shows the total investments made in the selected renewable energy type over time (2010-2023)."),

      br(),

      # Second plot: Energy Production by Type (bar plot)
      plotOutput("typePlot"),
      helpText("This bar plot displays the energy production breakdown by type for the selected year.")
    )
  )
)

# Server logic for Shiny app
server <- function(input, output, session) {

  # Reactive filtering data by the selected energy type for investment plot
  filtered_data_investment <- reactive({
    cleaned_data %>%
      filter(energy_type == input$investment_energy_type & country == "Australia")
  })

  # Investment Trends Plot - shows investment for the selected energy type over all years (line plot)
  output$investmentPlot <- renderPlot({
    ggplot(filtered_data_investment(), aes(x = year, y = investments_usd / 1e9)) +
      geom_line(color = "blue", size = 1) +
      geom_point(color = "blue", size = 2) +
      labs(
        title = paste("Total Investments for", input$investment_energy_type, "(2010-2023)"),
        x = "Year",
        y = "Investments (Billion USD)"
      ) +
      theme_minimal()
  })

  # Energy Production by Type Plot - for the selected year
  output$typePlot <- renderPlot({
    production_by_type <- cleaned_data %>%
      filter(year == input$production_year & country == "Australia") %>%
      group_by(energy_type) %>%
      summarize(total_production_gwh = sum(production_g_wh, na.rm = TRUE))

    ggplot(production_by_type, aes(x = reorder(energy_type, -total_production_gwh),
                                   y = total_production_gwh / 1e3)) +
      geom_bar(stat = "identity", fill = "steelblue") +  # Uniform color
      geom_text(aes(label = round(total_production_gwh / 1e3, 1)),
                vjust = -0.5, color = "black", size = 3.5) +
      labs(
        title = paste("Energy Production by Type in", input$production_year),
        x = "Energy Type",
        y = "Total Production (TWh)"
      ) +
      theme_minimal()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
