library(tidyverse)

sim_rep <- function(x) {
  # assuming you place x dollars on game 1
  g1_win <- (100 + x)
  g1_loss <- (100 - x)
  
  return(
    data.frame(best = max(c(g1_win, g1_loss*2)),
               worst = min(c(g1_win, g1_loss*2)))
  )
}

res <-  seq(from = 0, to = 100, by = 0.0001) |>
  map_dfr(.f = sim_rep)


res |> 
  mutate(bet = seq(from = 0, to = 100, by = 0.0001)) |>
  ggplot() +
  geom_point(aes(x = bet, y = worst), color = "red") +
  geom_point(aes(x = bet, y = best), color = "blue")

