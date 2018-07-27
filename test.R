```# Load required libraries
library(SparkR)

# Measure execuation time
start_time <- Sys.time()

# Establish file connection to redirect output to a file
conn <- file("log.txt")

#=============================Main Program Start===========================
sc <- sparkR.session()

writeLines("spark session was created", conn)

local_path <- "/Users/Jeremy/Desktop/sd_hedonics.csv"
s3_path <- "s3://bdeep-netshare-sync/projects/Zillow_Housing/stores/Hedonics/new_csv_hedonics_by_states/ca_hedonics.csv"
aforge_path <- "Zehao/sd_hedonics.csv"
main <- read.df(s3_path, source = "csv", header = "true", inferSchema = "true")

columns <- c("rowid", "importparcelid")
head(select(main, columns))

writeLines("main dataframe was read", conn)

#=============================Main Program End===========================
# Measure execuation time
end_time <- Sys.time()
time_taken <- end_time - start_time
print(time_taken)
writeLines(paste("Time difference is:", time_taken), conn)

# Close output file connection
close(conn)```
Message Input

Message @zehaoc2
