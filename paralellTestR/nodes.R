# Finds nodes from a specified node list

# Load future library
library(future.apply)

# Find slurm cluster nodes
workers <- workers <- c(rep('jaguar3', 4), rep('jaguar4', 4))

plan(cluster, workers = workers)

print("Workers = ")
print(nbrOfWorkers())

tmp <- future_sapply(seq_len(nbrOfWorkers()), 
              function(i)
                cat("Worker running in process", Sys.getpid(),
                    "on", Sys.info()[['nodename']], "\n"))