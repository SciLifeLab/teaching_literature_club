#!/bin/env Rscript
wide_t <- readr::read_csv(
  file = "hazari_et_al_2013_table_1.csv",
  show_col_types = FALSE
)
names(wide_t)

# I only care about the difference in means at the end, i.e. the
# control group at the end should be compared with.
t <- wide_t |>
  dplyr::select(intervention,covariate,treatment_mean,control_mean_after) |>
  tidyr::pivot_longer(cols = c(treatment_mean,control_mean_after))
names(t)

ggplot2::ggplot(
  t,
  ggplot2::aes(x = covariate, y = value, fill = name)
) + ggplot2::geom_col(position = "dodge") +
  ggplot2::facet_grid(rows = ggplot2::vars(intervention)) +
  ggplot2::theme(
    strip.text.y.right = ggplot2::element_text(angle = 0),
    axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)
  )

ggplot2::ggsave("hazari_et_al_2013_results_1.png", width = 7, height = 7)

# I only care to reproduce the paper
t <- wide_t |>
  dplyr::select(intervention,covariate,treatment_mean,control_mean_before) |>
  tidyr::pivot_longer(cols = c(treatment_mean,control_mean_before))
names(t)

ggplot2::ggplot(
  t,
  ggplot2::aes(x = covariate, y = value, fill = name)
) + ggplot2::geom_col(position = "dodge") +
  ggplot2::facet_grid(rows = ggplot2::vars(intervention)) +
  ggplot2::theme(
    strip.text.y.right = ggplot2::element_text(angle = 0),
    axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)
  )

ggplot2::ggsave("hazari_et_al_2013_results_2.png", width = 7, height = 7)

# Let's see the effect of the treatment
t <- wide_t |> dplyr::select(intervention,covariate,treatment_mean,control_mean_before,control_mean_after)
t
t$change_same_time <- (t$treatment_mean - t$control_mean_after) / t$control_mean_after
t$change_different_time <- (t$treatment_mean - t$control_mean_before) / t$control_mean_before
t$improved_same_time <- t$change_same_time > 0.0
t$improved_different_time <- t$change_different_time > 0.0

ggplot2::ggplot(
  t,
  ggplot2::aes(x = covariate, y = change_same_time, fill = improved_same_time)
) + ggplot2::geom_col(position = "dodge") +
  ggplot2::scale_y_continuous(labels = scales::percent) +
  ggplot2::facet_grid(rows = ggplot2::vars(intervention)) +
  ggplot2::theme(
    strip.text.y.right = ggplot2::element_text(angle = 0),
    axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)
  )

ggplot2::ggsave("hazari_et_al_2013_results_1_improvement.png", width = 7, height = 7)

ggplot2::ggplot(
  t,
  ggplot2::aes(x = covariate, y = change_different_time, fill = improved_different_time)
) + ggplot2::geom_col(position = "dodge") +
  ggplot2::scale_y_continuous(labels = scales::percent) +
  ggplot2::facet_grid(rows = ggplot2::vars(intervention)) +
  ggplot2::theme(
    strip.text.y.right = ggplot2::element_text(angle = 0),
    axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)
  )

ggplot2::ggsave("hazari_et_al_2013_results_2_improvement.png", width = 7, height = 7)
