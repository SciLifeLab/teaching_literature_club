haag_references <- readr::read_csv(
  "haag_et_al_references_table.csv",
  show_col_types = FALSE
)
vembye_references <- readr::read_csv(
  "vembye_references_table.csv",
  show_col_types = FALSE
)

t_refs <- tibble::tibble(
  title = sort(unique(c(haag_references$Title, vembye_references$Title)))
)
t_refs$cited_by_haag <- t_refs$title %in% haag_references$Title
t_refs$cited_by_vembye <- t_refs$title %in% vembye_references$Title
nrow(t_refs)
n_unique_haag <- sum(
  t_refs$cited_by_haag == TRUE &
  t_refs$cited_by_vembye == FALSE
)
n_unique_vembye <- sum(
  t_refs$cited_by_haag == FALSE &
  t_refs$cited_by_vembye == TRUE
)
n_both <- sum(
  t_refs$cited_by_haag == TRUE &
  t_refs$cited_by_vembye == TRUE
)
n_neither <- sum(
  t_refs$cited_by_haag == FALSE &
  t_refs$cited_by_vembye == FALSE
)
testthat::expect_equal(n_neither, 0)

# Visualize
testthat::expect_equal(n_both, 1)
testthat::expect_equal(n_unique_haag, 69)
testthat::expect_equal(n_unique_vembye, 112)
