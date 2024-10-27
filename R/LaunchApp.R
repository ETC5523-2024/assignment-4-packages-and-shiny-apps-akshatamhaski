# R/launch_app.R
#' Launch the Shiny App
#'
#' This function launches the REnergy Shiny app for data exploration.
#' @export
launch_shiny_app <- function() {
  # Locate the Shiny app directory within the package
  appDir <- system.file("shinyApp", package = "REnergy")

  # Check if the path is valid
  if (appDir == "") {
    stop("Could not find the Shiny app directory. Try reinstalling the `REnergy` package.", call. = FALSE)
  }

  # Launch the Shiny app
  shiny::runApp(appDir, display.mode = "normal")
}
