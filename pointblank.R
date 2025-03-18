install.packages("pointblank")
library(pointblank)

small_table

small_table |>
    col_vals_lt(a, value = 10) # stands for less than

small_table |>
    col_vals_lt(a, value = 10) |>
    col_vals_between(d, left = 0, right = 10000) |>
    col_vals_in_set(f, set = c("low", "mid", "high")) |>
    col_vals_regex(b, regex = "^[0-9]-[a-z]{3}-[0-9]{3}$")

agent <- small_table |>
    create_agent() |>
    col_vals_lt(a, value = 10) |>
    col_vals_between(d, left = 0, right = 5000) |>
    col_vals_in_set(f, set = c("low", "mid", "high")) |>
    col_vals_regex(b, regex = "^[0-9]-[a-z]{3}-[0-9]{3}$")

agent <- agent |>
    interrogate()

get_sundered_data(agent, type = "pass")

get_sundered_data(agent, type = "fail")

get_sundered_data(agent, type = "combined")

get_data_extracts(agent)

small_table %>%
    col_is_posix(date_time) %>%
    col_vals_in_set(f, set = c("low", "mid", "high")) %>%
    col_vals_lt(a, value = 10) %>%
    col_vals_regex(b, regex = "^[0-9]-[a-z]{3}-[0-9]{3}$") %>%
    col_vals_between(d, left = 0, right = 5000)
