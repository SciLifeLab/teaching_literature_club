#!/bin/env Rscript
wide_t <- readr::read_csv(
  file = "stout_et_al_2013_table_2.csv",
  show_col_types = FALSE
)
names(wide_t)

wide_means <- wide_t |> dplyr::select(
sex,
se_mean,
#se_stdev
b_mean,
#b_stdev
uv_mean,
#uv_stdev
score_mean,
#score_stde
sat_mean
#sat_stdev
)

names(wide_means) <- stringr::str_remove(names(wide_means), "_mean")

means <- wide_means |> tidyr::pivot_longer(cols = c(se, b, uv, score, sat))

wide_stdevs <- wide_t |> dplyr::select(
sex,
#se_mean
se_stdev,
#b_mean
b_stdev,
#uv_mean
uv_stdev,
#score_mean
score_stdev,
#sat_mean
sat_stdev
)

names(wide_stdevs) <- stringr::str_remove(names(wide_stdevs), "_stdev")

stdevs <- wide_stdevs |> tidyr::pivot_longer(cols = c(se, b, uv, score, sat))

testthat::expect_equal(means$sex, stdevs$sex)
testthat::expect_equal(means$name, stdevs$name)
t <- stdevs
t$mean <- means$value
t$stdev <- stdevs$value
t$ymin <- t$mean - t$stdev
t$ymax <- t$mean + t$stdev

ggplot2::ggplot(data = t, ggplot2::aes(x = name, y = mean, fill = sex)) +
  ggplot2::geom_col(position = "dodge") +
  ggplot2::geom_errorbar(ggplot2::aes(ymin = ymin, ymax = ymax), position = "dodge", width = 0.5)

ggplot2::ggsave("stout_et_al_2013_table_2.png", width = 7, height = 7)
