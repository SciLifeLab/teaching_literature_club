#!/bin/env Rscript
# Question:
# In table 5 it is shown that the application
# is thought of as more useful and they
# give statistics. Can this be reproduced?

before_mean <- 4.78
before_sd <- 0.67

after_mean <- 5.67
after_sd <- 0.50

expected_p_value <- 0.011
n_people <- 9
n_p_values <- 100
n_experiments <- 10

simulate_p_values <- function(
  before_mean = 4.78,
  before_sd = 0.67,
  after_mean = 5.67,
  after_sd = 0.50,
  n_people = 9,
  n_p_values = 100
) {
  testthat::expect_equal(before_mean, 4.78)
  testthat::expect_equal(before_sd, 0.67)
  testthat::expect_equal(after_mean, 5.67)
  testthat::expect_equal(after_sd, 0.5)
  testthat::expect_equal(n_people, 9)
  testthat::expect_equal(n_p_values, 100)

  p_values <- rep(NA, n_p_values)
  for (i in seq_len(n_p_values)) {
    dist_before <- rnorm(n = n_people, mean = before_mean, sd = before_sd)
    dist_after <- rnorm(n = n_people, mean = after_mean, sd = after_sd)
    stat_results <- t.test(x = dist_before, y = dist_after)
    p_values[i] <- stat_results$p.value
  }
  testthat::expect_equal(0, sum(is.na(p_values)))
  p_values
}


all_data <- list()
for (i in seq_len(n_experiments)) {
  t <- tibble::tibble(
    p = simulate_p_values(n_p_values = n_p_values)
  )
  t$i <- i
  all_data[[i]] <- t
}
t <- dplyr::bind_rows(all_data)


ggplot2::ggplot(t, ggplot2::aes(x = p)) +
  ggplot2::geom_histogram() +
  ggplot2::facet_wrap(ggplot2::vars(i), ncol = 2) +
  ggplot2::scale_x_continuous(limits = c(0.0, 0.06)) +
  ggplot2::geom_vline(xintercept = expected_p_value) +
  ggplot2::geom_vline(xintercept = 0.05, lty = "dashed") +
  ggplot2::geom_vline(xintercept = mean(t$p), color = "red") +
  ggplot2::labs(
    title = "Distribution of simulated p-values, multiple times",
    caption = paste0(
        "Black vertical line: reported in paper. \n",
        "Black dashed vertical line: 0.05%. \n",
        "Red vertical line: mean p value from ", n_p_values, " simulations. "
      )
    )

ggplot2::ggsave("20241016_tabel_5_sim.png", width = 4, height = 7)
