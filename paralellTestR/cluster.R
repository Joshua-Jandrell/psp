# Simple script initended to test R with slurm
## TODO: Clean up messy code

# Load future library
library(future.apply)

# Find slurm cluster nodes
print("Workers = ")
print(nbrOfWorkers())
workers <- system('srun hostname', intern = TRUE)
plan(cluster, workers = workers)

tmp <- future_sapply(seq_len(nbrOfWorkers()), 
              function(i)
                cat("Worker running in process", Sys.getpid(),
                    "on", Sys.info()[['nodename']], "\n"))