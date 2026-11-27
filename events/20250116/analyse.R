
grades_excel_filename <- "GradeData.xlsx"
ratings_excel_filename <- "RatingsData.xlsx"

grades_csv_filename <- "GradeData.csv"
ratings_csv_filename <- "RatingsData.csv"


if (1 == 2) {
  # All fails
  grade_data_url <- "https://datadryad.org/stash/downloads/file_stream/116111"
  ratings_data_url <- "https://datadryad.org/stash/downloads/file_stream/116108"
  download.file(url = grade_data_url, grades_filename)
  curl::curl_download(grade_data_url, destfile = grades_filename)
}

if (1 == 2) {
  # Cannot get this to work
  remotes::install_github("ropensci/rdryad")
  rdryad::dryad_download("https://doi.org/10.6078/D1MW2K")
  rdryad::dryad_download(grade_data_url)
  rdryad::dryad_files_download(grade_data_url)
}

if (1 == 2) {
  # No support of dataDryad
  remotes::install_github ("mpadge/deposits")
  cli <- deposits::depositsClient$new(service = "datadryad")
  cli$deposit_download_file(grade_data_url)
  print(cli)
}

if (1 == 2) {
  testthat::expect_true(file.exists(ratings_csv_filename))
  testthat::expect_true(file.exists(grades_csv_filename))
  ratings <- readr::read_csv(ratings_csv_filename)
  grades <- readr::read_csv(grades_csv_filename)
}

testthat::expect_true(file.exists(ratings_excel_filename))
testthat::expect_true(file.exists(grades_excel_filename))
ratings <- readxl::read_excel(ratings_excel_filename)
grades <- readxl::read_excel(grades_excel_filename)

n_ratings <- nrow(ratings)
n_grades <- nrow(grades)
n <- min(n_ratings, n_grades)

names(grades) <- c("group", "grade")


average_ratings_per_group <- ratings |>
  dplyr::select(group, overall) |>
  dplyr::group_by(group) |> dplyr::summarise(mean_overall = mean(overall))
average_grade_per_group <- grades |>
  dplyr::select(group, grade) |>
  dplyr::group_by(group) |>
  dplyr::summarise(mean_grade = mean(grade))
t <- merge(average_ratings_per_group, average_grade_per_group)
t

ggplot2::ggplot(
  t,
  ggplot2::aes(x = mean_overall, y = mean_grade)
) + ggplot2::geom_point() +
  ggplot2::scale_x_continuous(limits = c(1, 5)) +
  ggplot2::scale_y_continuous(limits = c(0, 100)) +
  ggplot2::geom_smooth(method = "lm") +
  ggplot2::labs(caption = paste0("n: ", n))

ggplot2::ggsave(filename = "macnell.png", width = 7, height = 7)
