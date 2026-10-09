#!/bin/env Rscript
t <- readr::read_csv(file = "data_request.csv", show_col_types = FALSE)
t$status <- as.factor(t$status)

## Check data: all data must have an email
for (date in t$request_date) {
  filename <- paste0("email_", date, ".txt")
  if (!file.exists(filename)) {
    stop("File 'filename' does not exist. Please add it")
  }
}

status_tally <- dplyr::count(t, status)

ggplot2::ggplot(
  status_tally,
  ggplot2::aes(x = status, y = n)
) + ggplot2::geom_col() +
  ggplot2::labs(
    title = "Frequency of statuses"
  )

ggplot2::ggsave("data_request_status_frequency.png", width = 3, height = 4)
