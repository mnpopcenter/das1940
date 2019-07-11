# load in IPUMS 1940 data

library(tidyverse)

# initial garbage collection
gc()

# read in IPUMS orig data
# 
# CONSTANTS
#create vectors for fwf_widths (names and widths) for household and person files
ipums_col_names_h <- c("RECTYPE","YEAR","DATANUM","SERIAL","NUMPREC","SUBSAMP","HHWT","NUMPERHH","HHTYPE","DWELLING","SLPERNUM","CPI99","REGION","STATEICP","STATEFIP","COUNTY","URBAN","METRO","METAREA","METAREAD","CITY","CITYPOP","SIZEPL","URBPOP","SEA","WARD","CNTRY","GQ","GQTYPE","GQTYPED","GQFUNDS","FARM","OWNERSHP","OWNERSHPD","RENT","VALUEH","NFAMS","NSUBFAM","NCOUPLES","NMOTHERS","NFATHERS","MULTGEN","MULTGEND","ENUMDIST","SUPDIST","RESPOND","SPLIT","SPLITHID","SPLITNUM","SPLIT40","SERIAL40","NUMPREC40","EDMISS")
ipums_col_widths_h <- c(1,4,2,8,2,2,10,4,1,8,2,5,2,2,2,4,1,1,3,4,4,5,2,5,3,3,3,1,1,3,2,1,1,2,4,7,2,1,1,1,1,1,2,4,3,1,1,8,4,1,8,4,1)
ipums_col_names_p <- c("RECTYPEP","YEARP","DATANUMP","SERIALP","PERNUM","PERWT","SLWT","SLREC","RESPONDT","FAMUNIT","FAMSIZE","SUBFAM","SFTYPE","SFRELATE","MOMLOC","STEPMOM","MOMRULE_HIST","POPLOC","STEPPOP","POPRULE_HIST","SPLOC","SPRULE_HIST","NCHILD","NCHLT5","NSIBS","ELDCH","YNGCH","RELATE","RELATED","SEX","AGE","AGEMONTH","MARST","MARRNO","AGEMARR","CHBORN","RACE","RACED","HISPAN","HISPAND","BPL","BPLD","MBPL","MBPLD","FBPL","FBPLD","NATIVITY","CITIZEN","MTONGUE","MTONGUED","SPANNAME","HISPRULE","SCHOOL","HIGRADE","HIGRADED","EDUC","EDUCD","EMPSTAT","EMPSTATD","LABFORCE","OCC","OCC1950","IND","IND1950","CLASSWKR","CLASSWKRD","WKSWORK1","WKSWORK2","HRSWORK1","HRSWORK2","DURUNEMP","UOCC","UOCC95","UIND","UCLASSWK","INCWAGE","INCNONWG","OCCSCORE","SEI","PRESGL","ERSCOR50","EDSCOR50","NPBOSS50","MIGRATE5","MIGRATE5D","MIGPLAC5","MIGMET5","MIGTYPE5","MIGCITY5","MIGSEA5","SAMEPLAC","SAMESEA5","MIGCOUNTY","VETSTAT","VETSTATD","VET1940","VETWWI","VETPER","VETCHILD","HISTID","SURSIM","SSENROLL")
ipums_col_widths_p <- c(1,4,2,8,4,10,10,1,1,2,2,1,1,1,2,1,1,2,1,1,2,1,1,1,1,2,2,2,4,1,3,2,1,1,2,2,1,3,1,3,3,5,3,5,3,5,1,1,2,4,1,1,1,2,3,2,3,1,2,1,4,3,4,3,1,2,2,1,2,1,3,3,3,3,1,6,1,2,2,3,4,4,4,1,2,3,4,1,4,3,1,1,4,1,2,1,1,1,1,36,2,1)

# create fwf_widths to pass into read_fwf
ipums_widths_h <- fwf_widths(ipums_col_widths_h, col_names = ipums_col_names_h)
ipums_widths_p <- fwf_widths(ipums_col_widths_p, col_names = ipums_col_names_p)

# create column types for household and person files 
ipums_coltypes_h <- c("ciiiiiiiiiiicccciiccciiiccciiiiiiiiiiiiiiiicciiiiiiii")
ipums_coltypes_p <- c("ciiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiicii")

# READ IN FILES
# read in the subsetted H and P files
ipums1940_h <- read_fwf("/Users/vanriper/Documents/scratch/dp/census_runs/ORIG_IPUMS_DATA/EXT1940_USCB_H_test.dat", ipums_widths_h, col_types = ipums_coltypes_h)
ipums1940_p <- read_fwf("/Users/vanriper/Documents/scratch/dp/census_runs/ORIG_IPUMS_DATA/EXT1940_USCB_P_test.dat", ipums_widths_p, col_types = ipums_coltypes_p)

# JOIN HH and P
# merge H onto P on serialp = serial 
ipums1940 <- left_join(ipums1940_p, ipums1940_h, by=c("SERIALP" = "SERIAL"))

# remove h and p df and do garbage cleanup 
rm(ipums1940_h)
rm(ipums1940_p)
gc()

# MODIFY THIS QUERY TO ADD ADDITIONAL STATES TO THE DATASET
# select out records for subset of states 
ipums1940 <- ipums1940 %>%
  filter(STATEFIP == "27") 

# remove ipums1940 and garbage cleanup 
#rm(ipums1940)
gc()

# RECODES
# rename RACE to cenrace (which is what DAS calls variable)
# recode age into two bins (below 18 and 18 and over)
# recode cenhisp into two bins 
# recode GQ into two bins
ipums1940 <- ipums1940 %>%
  rename(cenrace = RACE) %>%
  mutate(qage = case_when((AGE < 18) ~ 17,
                          (AGE >= 18) ~ 18),
         cenhisp = case_when((HISPAN == 0) ~ 0,
                             (HISPAN > 0) ~ 1),
         rtype = case_when((GQ <= 2) ~ 0,
                           (GQ > 2) ~ 1))

# FACTORS
# factorize cenhisp and rtype for comparison to DAS output
ipums1940$rtype <- factor(ipums1940$rtype, labels=c("hu", "gq"))
ipums1940$cenhisp <- factor(ipums1940$cenhisp, labels=c("non_hisp", "hisp"))
ipums1940$qage <- factor(ipums1940$qage, labels=c("non_va", "va"))
ipums1940$cenrace <- factor(ipums1940$cenrace, labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

