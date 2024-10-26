# R/launch_app.R
#' Launch the Shiny App
#'
#' This function launches the REnergy Shiny app for data exploration.
#' @export
launch_shiny_app <- function() {
  shiny::runApp(system.file("shiny", package = "REnergy"))
}
