#!/bin/env Rscript
read_data <- function() {
  readr::read_csv(file = "suppl6.csv", show_col_types = FALSE)
}
read_data()

get_satisfactions <- function() {
  t <- read_data()

  t <- t |> dplyr::select(1, 8:ncol(t))

  names(t) <- c("Edition", "Course grade", "Relative course grade", names(t)[-3:-1])

  t <- t |>
    tidyr::pivot_longer(!Edition, names_to = "course")
  names(t) <- c("edition", "course", "satisfaction")

  t$starting_year <- t$edition |>
    stringr::str_sub(3, 4) |> as.numeric()
  t$iteration <- t$starting_year -
    min(t$starting_year)
  t
}
get_satisfactions()

calc_tests_courses <- function() {
  satisfactions <- get_satisfactions()
  tests_courses <- tibble::tibble(
    course = unique(satisfactions$course),
    p_value = NA,
    is_changing = NA
  )
  for (i in seq_len(nrow(tests_courses))) {
    this_course_satisfactions <- satisfactions |> dplyr::filter(course == tests_courses$course[i])
    tests_courses$p_value[i] <- cor.test(
      x = this_course_satisfactions$starting_year,
      y = this_course_satisfactions$satisfaction,
      method = "kendall" # Kendall can handle ties
    )$p.value
    tests_courses$is_changing[i] <- tests_courses$p_value[i] < 0.05
  }
  tests_courses
}
calc_tests_courses()

calc_tests_course_combined <- function() {
  satisfactions <- get_satisfactions()
  satisfactions <- satisfactions |>
    dplyr::filter(course != "Course grade") |>
    dplyr::filter(course != "Relative course grade")
  test_all <- tibble::tibble(
    course = "Courses combined",
    p_value = NA,
    is_changing = NA
  )

  test_all$p_value <- cor.test(
    x = satisfactions$starting_year,
    y = satisfactions$satisfaction,
    method = "kendall" # Kendall can handle ties
  )$p.value
  test_all$is_changing <- test_all$p_value < 0.05
  test_all
}
calc_tests_course_combined()
names(t)

calc_tests_course_and_all <- function() {
  dplyr::bind_rows(
    calc_tests_courses(),
    calc_tests_course_combined()
  )
}
calc_tests_course_and_all()
satisfactions <- get_satisfactions()

ggplot2::ggplot(
  satisfactions,
  ggplot2::aes(x = edition, y = satisfaction)
) + ggplot2::geom_boxplot() +
  ggplot2::facet_grid(rows = ggplot2::vars(course)) +
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0),
    axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)
  )

ggplot2::ggsave("satisfactions.png", width = 4, height = 7)

satisfactions <- get_satisfactions()

satisfactions_with_stats <- merge(
  get_satisfactions(),
  calc_tests_courses()
)

create_course_satisfaction_changes_test_csv <- function() {
  t <- calc_tests_course_and_all()
  t$p_value <- round(t$p_value, digits = 3)
  readr::write_csv(
    x = t,
    file = "course_satisfaction_changes_test.csv"
  )
}
create_course_satisfaction_changes_test_csv()

create_course_satisfaction_changes_test_md <- function() {
  t <- calc_tests_course_and_all()
  t$p_value <- round(t$p_value, digits = 3)

  readr::write_lines(
    x = knitr::kable(t),
    file = "course_satisfaction_changes_test.md"
  )
}
create_course_satisfaction_changes_test_csv()


appender <- function(
    courses_label
) {
  tests_courses <- calc_tests_courses()
  # message("Length: " , length(string), ", String:", string)
  #row_index <- which(string == tests_courses$course)
  t <- tibble::tibble(
    course = courses_label
  )
  t <- merge(t, tests_courses)
  t$label <- paste0(
    t$course,
    ", p_value: " ,
    round(t$p_value, digits = 2)
  )
  t$label
}


names(satisfactions_with_stats)

ggplot2::ggplot(
  satisfactions_with_stats,
  ggplot2::aes(x = iteration, y = satisfaction)
) + ggplot2::geom_point() +
  ggplot2::geom_smooth(
    formula = y ~ x,
    method = "lm",
    color = "blue",
    lty = "dashed",
    se = TRUE
  ) +
  ggpmisc::stat_poly_eq(
    parse = TRUE,
    ggplot2::aes(
      label = ggplot2::after_stat(eq.label)
    ),
    formula = y ~ x
  ) +
  ggplot2::facet_grid(
    rows = ggplot2::vars(course),
    labeller = ggplot2::as_labeller(appender)
  ) +
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0)
    # axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)
  )

ggplot2::ggsave("satisfactions_with_stats.png", width = 7, height = 7)
