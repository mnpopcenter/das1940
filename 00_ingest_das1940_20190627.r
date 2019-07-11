## Census DAS preparation/read
# Handles full nationwide data files from Census DAS
# Factorizes some of the PER variables
# Writes out a Stata file for each PER and UNIT file

library(tidyverse)
library(foreign)

# set working directory to location of Census DAS output data
setwd("/pkg/ipums/misc/census-das/das_dp_data/raw_census_das_output/")

# CONSTANT FOR ALL FILES
# set column_delimiter to pipe
column_delimiter <- "|"

#output stata file path - where we will store analytical datasets
output_stata_path <- "/pkg/ipums/misc/census-das/das_dp_data/stata/"


# PERSON CONSTANTS
# create vector of column names for PER file, derived from Census Bureau technical spec 
# https://www2.census.gov/census_1940/2018-End-to-End-Test-Disclosure-Avoidance-System-Design-Specification.pdf
per_column_names = c("schema_type_code", "schema_build_id", "state", "county", "enumdist", "euid", "epnum", "rtype",
                 "qrel", "qsex", "qage", "cenhisp", "cenrace", "qspanx", "qrace1", "qrace2", "qrace3", "qrace4",
                 "qrace5", "qrace6", "qrace7", "qrace8", "cit")

# create vector of column types (char or integer)
per_column_types = c("ccccciiiiiiiiiiiiiiiiii")

#output file suffix for per 
per_out_file <- "_per.dta"

# UNIT CONSTANTS
# create vector of column names for UNIT file, derived from Census Bureau technical spec 
# https://www2.census.gov/census_1940/2018-End-to-End-Test-Disclosure-Avoidance-System-Design-Specification.pdf

unit_column_names <- c("schema_type_code", "schema_bulid_id", "state", "county", "enumdist", "euid", "rtype", "gqtype",
                       "tenure","vacancy", "final_pop", "hht", "hht2", "npf", "cplt", "upart", "multg", "hhldrage", 
                       "hhspan", "hhrace", "paoc", "p18", "p60", "p65", "p75")

# create vector of column types (char or integer) for UNIT file
unit_column_types <- c("ccccciiiiiiiiiiiiiiiiiiii")

# output file suffix for unit
unit_out_file <- "_unit.dta"


# GENERATE CENSUS DAS OUTPUT FILE NAMES
# looping vector inputs
epsilon_file_loop <- c("EXT1940USCB-EPSILON0.25", "EXT1940USCB-EPSILON0.50", "EXT1940USCB-EPSILON0.75", "EXT1940USCB-EPSILON1.0", "EXT1940USCB-EPSILON2.0", "EXT1940USCB-EPSILON4.0", "EXT1940USCB-EPSILON6.0", "EXT1940USCB-EPSILON8.0")
run_file_loop <- c("-RUN1.zip", "-RUN2.zip", "-RUN3.zip", "-RUN4.zip")

# create full set of file names
looping_files <- do.call(paste0,expand.grid(epsilon_file_loop,run_file_loop))


# Loop over all ZIP files in looping_files
# 1. Unzip file
# 2. Read in delimited PER file to a tbl 
# 3. Factorize qage, cenrace, rtype, and cenhisp
# 4. Write out to a stata file
# 5. rm tbl and garbage cleanup 
# 6. Repeat 2-5 with UNIT file 
# 7. Delete the MDF_PER.txt and MDF_UNIT.txt files    

for(i in looping_files){
  temp <- paste0("unzip ", i)
  
  # unzip i
  system(temp)
  
  # read in PER file 
  das <- read_delim("MDF_PER.txt", delim = column_delimiter, col_names = per_column_names, col_types = per_column_types, skip = 14)
  
  # create factors fro four vars in das_per
  das$rtype <- factor(das$rtype, labels=c("hu", "gq"))
  das$cenhisp <- factor(das$cenhisp, labels=c("non_hisp", "hisp"))
  das$qage <- factor(das$qage, labels=c("non_va", "va"))
  das$cenrace <- factor(das$cenrace, labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))
  
  # write out person file to DTA
  write.dta(das, paste0(output_stata_path,i,per_out_file))
  
  # remove DAS tbl 
  rm(das)
  #garbage clean up to free memory
  gc()
  
  # read in UNIT file
  das <- read_delim("MDF_UNIT.txt", delim = column_delimiter, col_names = unit_column_names, col_types = unit_column_types, skip = 14)
  
  #write out unit file to DTA
  write.dta(das, paste0(output_stata_path,i,unit_out_file))
  
  #remove das df
  rm(das)
  #garbage clean up to free memory
  gc()
  
  # use system command to delete MDF_PER.txt and MDF_unit.txt for ZIP archive 
  system("rm MDF_PER.txt")
  system("rm MDF_UNIT.txt")
}
