
source("monty_hall_functions.R")

set.seed(741)
monty_hall(1000)
monty_hall(10000, display_progress_every_n = 250)

# dynamic plots of the simulation
monty_hall_animation(2000)
monty_hall_animation(300, display_plot_every_n = 10)
