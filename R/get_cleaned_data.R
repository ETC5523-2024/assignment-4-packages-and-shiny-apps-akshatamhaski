#' Get Cleaned Data
#'
#' This function retrieves the cleaned dataset for analysis.
#' @return A data frame with the cleaned renewable energy data.
#' @export
get_cleaned_data <- function() {
  # Path to the .rda file within the package
  data_path <- system.file("data", "cleaned_data.rda", package = "REnergy")

  # Create an environment to load the data into
  env <- new.env()
  load(data_path, envir = env)

  # Retrieve the data from the environment
  return(env$cleaned_data)
}

