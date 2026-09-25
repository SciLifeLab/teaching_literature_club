
create_table <- function(n_tests) {
  t <- tibble::tibble(
    i = seq(1, n_tests),
    alpha = 0.05
  )

  t$alpha_corrected <- t$alpha / (n_tests + 1 - t$i)
  t
}
list_of_tables <- list()

for (n_tests in seq(2, 10)) {
  t <- create_table(n_tests)
  t$n_tests <- n_tests
  list_of_tables[[n_tests]] <- t
}

t <- dplyr::bind_rows(list_of_tables)
t$n_tests <- as.factor(t$n_tests)

ggplot2::ggplot(t, ggplot2::aes(x = i, y = alpha_corrected, color = n_tests)) +
  ggplot2::geom_line() +
  ggplot2::scale_y_continuous("Corrected alpha value", limits = c(0, NA)) +
  ggplot2::scale_x_continuous("Test index", breaks = seq(0, 10), limits = c(0, NA)) +
  ggplot2::labs(title = "Adjusted alpha values for the Holm-Bonferroni correction")

ggplot2::ggsave("holm_bonferroni_correction.png", width = 7, height = 7)
