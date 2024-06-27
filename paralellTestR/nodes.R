# Finds nodes from a specified node list

# Load future library
library(future.apply)

# get command line arguments
args <- commandArgs(TRUE)
if(length(args) != 1){
    print("Usage Rscript nodes.R <path-to-nodeList>")
    quit(save="no")
}

# Read in table of cluster nodes
nodeTable = read.table(file = args[1], header = FALSE, sep = " ")

# Assign nodes based on input list
# HACH: code could be cleaner and more efficent (but I do know R well )
workers <- apply(nodeTable, 1, function(row){
    # Node this panttern is from: https://berkeley-scf.github.io/tutorial-dask-future/R-future
    # Not 100% sure that it ensure cores are evenly used for the node
    rep(row[1],row[2])
})


plan(cluster, workers = workers)


# Test parallel code
tmp <- future_sapply(seq_len(nbrOfWorkers()), 
              function(i)
                cat("Worker running in process", Sys.getpid(),
                    "on", Sys.info()[['nodename']],"\n"))