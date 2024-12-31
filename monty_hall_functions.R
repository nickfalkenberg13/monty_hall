
monty_hall <- function(n, display_progress_every_n = 50){
  
  trials <- 0 # number of runs
  switch_win <- 0 # number of wins if switching doors
  no_switch_win <- 0 # number of wins if no switching doors
  
  while (trials < n) {
    
    # assigning which doors have the car and goats
    car_door <- sample(c(1,2,3), 1)
    goat_doors <- c(1,2,3)[-car_door]
    
    # participant chooses door
    participant_door <- sample(c(1,2,3), 1)
    # host reveals door
    host_door <- goat_doors[goat_doors != participant_door][1]
    
    # the other door that would be chosen if the participant switched
    new_door <- c(1,2,3)[-c(participant_door, host_door)]
    
    # checking if the participant won
    if(new_door == car_door){
      switch_win <- switch_win + 1
    } else if (participant_door == car_door){
      no_switch_win <- no_switch_win + 1
    }
    
    trials <- trials + 1
    
    if(trials %% display_progress_every_n == 0){
      print(paste("Victories from switching (after", trials, "trials):", switch_win))
      print(paste("Victories from not switching (after", trials, "trials):", no_switch_win))
      print(paste("-------------------------------"))
    }
  }
  
  print(paste("----RESULTS----"))
  print(paste("Total trials:", trials))
  print(paste("Victories from switching: ", switch_win, " (", round(switch_win*100/trials, 1), "% win percentage)",
              sep = ""))
  print(paste("Victories from not switching: ", no_switch_win, " (", round(no_switch_win*100/trials, 1), "% win percentage)",
              sep = ""))
  print(paste("Switching doors results in", switch_win - no_switch_win, "more victories."))
}


monty_hall_animation <- function(n, display_plot_every_n = 50){
  #' Runs the simulations just like above, but creates
  #' a dynamic plot to visually display the results
  #' as the simulation is running.
  
  trials <- 0 # number of runs
  switch_win <- 0 # number of wins if switching doors
  no_switch_win <- 0 # number of wins if no switching doors
  
  while (trials < n) {
    
    # assigning which doors have the car and goats
    car_door <- sample(c(1,2,3), 1)
    goat_doors <- c(1,2,3)[-car_door]
    
    # participant chooses door
    participant_door <- sample(c(1,2,3), 1)
    # host reveals door
    host_door <- goat_doors[goat_doors != participant_door][1]
    
    # the other door that would be chosen if the participant switched
    new_door <- c(1,2,3)[-c(participant_door, host_door)]
    
    # checking if the participant won
    if(new_door == car_door){
      switch_win <- switch_win + 1
    } else if (participant_door == car_door){
      no_switch_win <- no_switch_win + 1
    }
    
    trials <- trials + 1
    
    if(trials %% display_plot_every_n == 0){
      
      # constructing dynamic bar plot
      bp <- barplot(height = c(switch_win, no_switch_win),
                    width = c(0.25, 0.25),
                    names.arg = c("Wins from switching", "Wins from not swiching"),
                    main = paste("Results after", trials, "trials"),
                    col = c("slateblue", "burlywood2"),
                    xlim = c(0,1),
                    ylim = c(0,n),
                    space = 0.6)
      
      # labels for the bars
      switch_lab <- paste(switch_win, " (", round(switch_win*100/trials, 1), "%)",
                          sep = "")
      no_switch_lab <- paste(no_switch_win, " (", round(no_switch_win*100/trials, 1), "%)",
                             sep = "")
      
      text(x = bp, 
           y = c(switch_win, no_switch_win), 
           labels = c(switch_lab, no_switch_lab),
           adj = c(0.5, -1.1))
      
      Sys.sleep(0.05)
      
    }
  }
  
}