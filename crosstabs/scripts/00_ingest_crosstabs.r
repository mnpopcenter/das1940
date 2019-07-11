# 00_ingest_crosstabs.r
# this script ingests the crosstab CSVs to R data frames
# It then factorizes qage, cenhisp, cenrace, epsilon and run

library(tidyverse)

# set working directory to location of Census DAS output CSVs
setwd("/pkg/ipums/misc/census-das/das_dp_data/crosstabs/")

# create list of EXT files in crosstabs dir
temp <- list.files(pattern = "EXT*")

# DAS PERSON FILE INGEST
das025_1 <- read_csv(temp[1])
das025_2 <- read_csv(temp[2])
das025_3 <- read_csv(temp[3])
das025_4 <- read_csv(temp[4])
das050_1 <- read_csv(temp[5])
das050_2 <- read_csv(temp[6])
das050_3 <- read_csv(temp[7])
das050_4 <- read_csv(temp[8])
das075_1 <- read_csv(temp[9])
das075_2 <- read_csv(temp[10])
das075_3 <- read_csv(temp[11])
das075_4 <- read_csv(temp[12])
das10_1 <- read_csv(temp[13])
das10_2 <- read_csv(temp[14])
das10_3 <- read_csv(temp[15])
das10_4 <- read_csv(temp[16])
das20_1 <- read_csv(temp[17])
das20_2 <- read_csv(temp[18])
das20_3 <- read_csv(temp[19])
das20_4 <- read_csv(temp[20])
das40_1 <- read_csv(temp[21])
das40_2 <- read_csv(temp[22])
das40_3 <- read_csv(temp[23])
das40_4 <- read_csv(temp[24])
das60_1 <- read_csv(temp[25])
das60_2 <- read_csv(temp[26])
das60_3 <- read_csv(temp[27])
das60_4 <- read_csv(temp[28])
das80_1 <- read_csv(temp[29])
das80_2 <- read_csv(temp[30])
das80_3 <- read_csv(temp[31])
das80_4 <- read_csv(temp[32])

das025_1 <- das025_1 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "025",
         run = "1")

das025_1$cenhisp <- factor(das025_1$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das025_1$qage <- factor(das025_1$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das025_1$cenrace <- factor(das025_1$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das025_2 <- das025_2 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "025",
         run = "2")

das025_2$cenhisp <- factor(das025_2$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das025_2$qage <- factor(das025_2$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das025_2$cenrace <- factor(das025_2$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das025_3 <- das025_3 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "025",
         run = "3")

das025_3$cenhisp <- factor(das025_3$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das025_3$qage <- factor(das025_3$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das025_3$cenrace <- factor(das025_3$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das025_4 <- das025_4 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "025",
         run = "4")

das025_4$cenhisp <- factor(das025_4$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das025_4$qage <- factor(das025_4$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das025_4$cenrace <- factor(das025_4$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das050_1 <- das050_1 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "050",
         run = "1")

das050_1$cenhisp <- factor(das050_1$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das050_1$qage <- factor(das050_1$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das050_1$cenrace <- factor(das050_1$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das050_2 <- das050_2 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "050",
         run = "2")

das050_2$cenhisp <- factor(das050_2$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das050_2$qage <- factor(das050_2$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das050_2$cenrace <- factor(das050_2$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das050_3 <- das050_3 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "050",
         run = "3")

das050_3$cenhisp <- factor(das050_3$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das050_3$qage <- factor(das050_3$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das050_3$cenrace <- factor(das050_3$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das050_4 <- das050_4 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "050",
         run = "4")

das050_4$cenhisp <- factor(das050_4$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das050_4$qage <- factor(das050_4$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das050_4$cenrace <- factor(das050_4$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das075_1 <- das075_1 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "075",
         run = "1")

das075_1$cenhisp <- factor(das075_1$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das075_1$qage <- factor(das075_1$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das075_1$cenrace <- factor(das075_1$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das075_2 <- das075_2 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "075",
         run = "2")

das075_2$cenhisp <- factor(das075_2$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das075_2$qage <- factor(das075_2$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das075_2$cenrace <- factor(das075_2$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das075_3 <- das075_3 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "075",
         run = "3")

das075_3$cenhisp <- factor(das075_3$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das075_3$qage <- factor(das075_3$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das075_3$cenrace <- factor(das075_3$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das075_4 <- das075_4 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "075",
         run = "4")

das075_4$cenhisp <- factor(das075_4$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das075_4$qage <- factor(das075_4$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das075_4$cenrace <- factor(das075_4$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das10_1 <- das10_1 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "1",
         run = "1")

das10_1$cenhisp <- factor(das10_1$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das10_1$qage <- factor(das10_1$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das10_1$cenrace <- factor(das10_1$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das10_2 <- das10_2 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "1",
         run = "2")

das10_2$cenhisp <- factor(das10_2$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das10_2$qage <- factor(das10_2$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das10_2$cenrace <- factor(das10_2$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das10_3 <- das10_3 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "1",
         run = "3")

das10_3$cenhisp <- factor(das10_3$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das10_3$qage <- factor(das10_3$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das10_3$cenrace <- factor(das10_3$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das10_4 <- das10_4 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "1",
         run = "4")

das10_4$cenhisp <- factor(das10_4$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das10_4$qage <- factor(das10_4$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das10_4$cenrace <- factor(das10_4$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das20_1 <- das20_1 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "2",
         run = "1")

das20_1$cenhisp <- factor(das20_1$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das20_1$qage <- factor(das20_1$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das20_1$cenrace <- factor(das20_1$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das20_2 <- das20_2 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "2",
         run = "2")

das20_2$cenhisp <- factor(das20_2$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das20_2$qage <- factor(das20_2$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das20_2$cenrace <- factor(das20_2$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das20_3 <- das20_3 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "2",
         run = "3")

das20_3$cenhisp <- factor(das20_3$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das20_3$qage <- factor(das20_3$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das20_3$cenrace <- factor(das20_3$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das20_4 <- das20_4 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "2",
         run = "4")

das20_4$cenhisp <- factor(das20_4$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das20_4$qage <- factor(das20_4$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das20_4$cenrace <- factor(das20_4$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das40_1 <- das40_1 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "4",
         run = "1")

das40_1$cenhisp <- factor(das40_1$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das40_1$qage <- factor(das40_1$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das40_1$cenrace <- factor(das40_1$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das40_2 <- das40_2 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "4",
         run = "2")

das40_2$cenhisp <- factor(das40_2$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das40_2$qage <- factor(das40_2$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das40_2$cenrace <- factor(das40_2$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das40_3 <- das40_3 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "4",
         run = "3")

das40_3$cenhisp <- factor(das40_3$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das40_3$qage <- factor(das40_3$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das40_3$cenrace <- factor(das40_3$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das40_4 <- das40_4 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "4",
         run = "4")

das40_4$cenhisp <- factor(das40_4$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das40_4$qage <- factor(das40_4$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das40_4$cenrace <- factor(das40_4$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das60_1 <- das60_1 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "6",
         run = "1")

das60_1$cenhisp <- factor(das60_1$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das60_1$qage <- factor(das60_1$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das60_1$cenrace <- factor(das60_1$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das60_2 <- das60_2 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "6",
         run = "2")

das60_2$cenhisp <- factor(das60_2$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das60_2$qage <- factor(das60_2$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das60_2$cenrace <- factor(das60_2$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das60_3 <- das60_3 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "6",
         run = "3")

das60_3$cenhisp <- factor(das60_3$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das60_3$qage <- factor(das60_3$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das60_3$cenrace <- factor(das60_3$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das60_4 <- das60_4 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "6",
         run = "4")

das60_4$cenhisp <- factor(das60_4$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das60_4$qage <- factor(das60_4$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das60_4$cenrace <- factor(das60_4$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das80_1 <- das80_1 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "8",
         run = "1")

das80_1$cenhisp <- factor(das80_1$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das80_1$qage <- factor(das80_1$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das80_1$cenrace <- factor(das80_1$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das80_2 <- das80_2 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "8",
         run = "2")

das80_2$cenhisp <- factor(das80_2$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das80_2$qage <- factor(das80_2$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das80_2$cenrace <- factor(das80_2$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das80_3 <- das80_3 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "8",
         run = "3")

das80_3$cenhisp <- factor(das80_3$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das80_3$qage <- factor(das80_3$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das80_3$cenrace <- factor(das80_3$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

das80_4 <- das80_4 %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = "8",
         run = "4")

das80_4$cenhisp <- factor(das80_4$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
das80_4$qage <- factor(das80_4$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
das80_4$cenrace <- factor(das80_4$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))


# IPUMS DATA INGEST
ipums <- read_csv("ipums_orig.csv")

# rename columns in IPUMS df 
ipums <- ipums %>%
  rename(state = st,
         county = cty,
         enumdist = ed,
         ipums = `_freq`)

# factorize ipums qage, cenhisp, race
ipums$cenhisp <- factor(ipums$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
ipums$qage <- factor(ipums$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
ipums$cenrace <- factor(ipums$cenrace, levels = c(1, 2, 3, 4, 5, 6) , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

# PAIRWISE JOINS
# join ipums to each ep indepdently so I can handle missing epsilon values
# add zeroes and epsilon values to NA cells after pairwise joins
ipums_025_1 <- ipums %>%
  full_join(das025_1, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "025", run = "1"))

ipums_025_2 <- ipums %>%
  full_join(das025_2, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "025", run = "2"))

ipums_025_3 <- ipums %>%
  full_join(das025_3, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "025", run = "3"))

ipums_025_4 <- ipums %>%
  full_join(das025_4, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "025", run = "4"))

ipums_050_1 <- ipums %>%
  full_join(das050_1, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "050", run = "1"))

ipums_050_2 <- ipums %>%
  full_join(das050_2, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "050", run = "2"))

ipums_050_3 <- ipums %>%
  full_join(das050_3, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "050", run = "3"))

ipums_050_4 <- ipums %>%
  full_join(das050_4, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "050", run = "4"))

ipums_075_1 <- ipums %>%
  full_join(das075_1, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "075", run = "1"))

ipums_075_2 <- ipums %>%
  full_join(das075_2, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "075", run = "2"))

ipums_075_3 <- ipums %>%
  full_join(das075_3, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "075", run = "3"))

ipums_075_4 <- ipums %>%
  full_join(das075_4, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "075", run = "4"))

ipums_10_1 <- ipums %>%
  full_join(das10_1, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "1", run = "1"))

ipums_10_2 <- ipums %>%
  full_join(das10_2, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "1", run = "2"))

ipums_10_3 <- ipums %>%
  full_join(das10_3, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "1", run = "3"))

ipums_10_4 <- ipums %>%
  full_join(das10_4, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "1", run = "4"))

ipums_20_1 <- ipums %>%
  full_join(das20_1, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "2", run = "1"))

ipums_20_2 <- ipums %>%
  full_join(das20_2, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "2", run = "2"))

ipums_20_3 <- ipums %>%
  full_join(das20_3, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "2", run = "3"))

ipums_20_4 <- ipums %>%
  full_join(das20_4, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "2", run = "4"))

ipums_40_1 <- ipums %>%
  full_join(das40_1, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "4", run = "1"))

ipums_40_2 <- ipums %>%
  full_join(das40_2, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "4", run = "2"))

ipums_40_3 <- ipums %>%
  full_join(das40_3, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "4", run = "3"))

ipums_40_4 <- ipums %>%
  full_join(das40_4, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "4", run = "4"))

ipums_60_1 <- ipums %>%
  full_join(das60_1, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "6", run = "1"))

ipums_60_2 <- ipums %>%
  full_join(das60_2, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "6", run = "2"))

ipums_60_3 <- ipums %>%
  full_join(das60_3, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "6", run = "3"))

ipums_60_4 <- ipums %>%
  full_join(das60_4, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "6", run = "4"))

ipums_80_1 <- ipums %>%
  full_join(das80_1, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "8", run = "1"))

ipums_80_2 <- ipums %>%
  full_join(das80_2, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "8", run = "2"))

ipums_80_3 <- ipums %>%
  full_join(das80_3, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "8", run = "3"))

ipums_80_4 <- ipums %>%
  full_join(das80_4, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  replace_na(list(ipums = 0, das = 0, epsilon = "8", run = "4"))

ipums_das <- bind_rows(ipums_025_1,
                       ipums_025_2,
                       ipums_025_3,
                       ipums_025_4,
                       ipums_050_1,
                       ipums_050_2,
                       ipums_050_3,
                       ipums_050_4,
                       ipums_075_1, 
                       ipums_075_2,
                       ipums_075_3,
                       ipums_075_4,
                       ipums_10_1,
                       ipums_10_2,
                       ipums_10_3,
                       ipums_10_4,
                       ipums_20_1,
                       ipums_20_2,
                       ipums_20_3,
                       ipums_20_4,
                       ipums_40_1, 
                       ipums_40_2, 
                       ipums_40_3, 
                       ipums_40_4, 
                       ipums_60_1,
                       ipums_60_2,
                       ipums_60_3,
                       ipums_60_4,
                       ipums_80_1,
                       ipums_80_2,
                       ipums_80_3,
                       ipums_80_4) %>%
  mutate(diff = ipums - das)
  

# create list of EXT files in crosstabs dir
temp <- list.files(pattern = "EXT*")
t <- i
for(i in temp){
  assign(t, i)
  t <- read_csv(i)
  
}

file_start <- "EXT1940USCB-EPSILON"
file_epsilon <- c("025", "050", "075", "10", "20", "40", "60", "80")
file_run_constant <- "-RUN"
file_runs <- c("1", "2", "3", "4")
file_end <- "_per.csv"

# create initial df from run 1 025 csv 
temp_filename <- "EXT1940USCB-EPSILON025-RUN1_per.csv"
init_das <- read_csv(temp_filename)

#rename _freq to das - use backticks around _freq because _ is a special character
#add epsilon value and run value to df to differentiate later on
init_das <- init_das %>%
  rename(das = `_freq`) %>%
  mutate(epsilon = file_epsilon[1],
         run = file_runs[1])

for(i in file_epsilon){
  for(j in file_runs){
    temp_filename <- paste0(file_start, i, file_run_constant, j, file_end)
    
    if(temp_filename != "EXT1940USCB-EPSILON025-RUN1_per.csv"){
      init_das_temp <- read_csv(temp_filename)
      
      #rename _freq to das - use backticks around _freq because _ is a special character
      #add epsilon value and run value to df to differentiate later on
      init_das_temp <- init_das_temp %>%
        rename(das = `_freq`) %>%
        mutate(epsilon = i,
               run = j)
      
      init_das <- bind_rows(init_das, init_das_temp)
    }
  }
}

# remove final init_das_temp df
rm(init_das_temp)

# generate factors from output file
init_das$cenhisp <- factor(init_das$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
init_das$qage <- factor(init_das$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
init_das$cenrace <- factor(init_das$cenrace, levels = c("white", "black", "aian", "chinese", "japanese", "other_asian") , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))
init_das$epsilon <- factor(init_das$epsilon, levels = file_epsilon, labels = file_epsilon)
init_das$run <- factor(init_das$run, levels = file_runs, labels = file_runs)

# IPUMS DATA INGEST
init_ipums <- read_csv("ipums_orig.csv")

# clean up attribute names 
init_ipums <- init_ipums %>%
  rename(ipums = `_freq`,
         state = st,
         county = cty,
         enumdist = ed)

# factorize qage, cenhisp and cenrace
init_ipums$cenhisp <- factor(init_ipums$cenhisp, levels=c("non_hisp", "hisp"), labels=c("non_hisp", "hisp"))
init_ipums$qage <- factor(init_ipums$qage, levels= c("non_va", "va"), labels=c("non_va", "va"))
init_ipums$cenrace <- factor(init_ipums$cenrace, levels = c(1, 2, 3, 4, 5, 6) , labels=c("white", "black", "aian", "chinese", "japanese", "other_asian"))

# full join of ipums to das 
# if ipums count is NA, replace with a 0
das_ipums <- init_ipums %>%
  full_join(init_das, by = c("state" = "state", "county" = "county", "enumdist" = "enumdist", "qage" = "qage", "cenhisp" = "cenhisp", "cenrace" = "cenrace")) %>%
  mutate(ipums = replace_na(ipums, 0))

# handle das == NA values
# select out missing DAS counts to new temp df
# duplicate temp df 32 times and assign epsilon and run appropriately
# append 32 dfs together
# append to full join df 

# create df containing only records with missing DAS count
temp_das_missing <- das_ipums %>%
  filter(is.na(das))

# init a df to store the looped output
temp_das_missing_final = temp_das_missing[FALSE,]

# dupe temp_das_missing 32 times and append to temp_das_missing_final df
for(i in file_epsilon){
  for(j in file_runs){
    t_df <- temp_das_missing %>%
      mutate(epsilon = i,
             run = j,
             das = 0)
    
    temp_das_missing_final <- bind_rows(temp_das_missing_final, t_df)
  }
}

#remove final t_df and temp_das_missing
rm(t_df)
rm(temp_das_missing)

# factorize epsilon and run in temp_das_missing_final 
temp_das_missing_final$epsilon <- factor(temp_das_missing_final$epsilon, levels = file_epsilon, labels = file_epsilon)
temp_das_missing_final$run <- factor(temp_das_missing_final$run, levels = file_runs, labels = file_runs)

# CREATE FINAL DF
# remove is.na(das) records from the das_ipums and bind_rows in temp_das_missing_final df 
ipums_das <- das_ipums %>%
  filter(!is.na(das)) %>%
  bind_rows(temp_das_missing_final)


#########
# Analysis code 
#########

# various constants 
# Box Plot Constants
box_plot_labels = c("0.25", "0.50", "0.75", "1.0", "2.0", "4.0", "6.0", "8.0", "IPUMS")
scale_y_persons_name = "Persons"
scale_y_difference_name = "Difference"
scale_y_perc_difference_name = "Percent Difference"
scale_x_epsilon_name = "Epsilon"
age_breaks = c("non_va", "va")
age_labels = c("Under 18", "18+")
hisp_breaks = c("hisp", "non_hisp")
hisp_labels = c("Hispanic", "Non-Hispanic")

# Scatter plot constants
ipums_x_name = "IPUMS"
das_y_name = "Census Bureau DAS"
ipums_percentage_x_name = "Percentage, IPUMS"
das_percentage_y_name = "Percentage, DAS"

# Facet constants
epsilon_labels <- c("025" = "0.25", "050" = "0.50", "075" = "0.75", "1" = "1.0", "2" = "2.0", "4" = "4.0", "6" = "6.0", "8" = "8.0")

# county pop dist
p_county_totpop <- ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, epsilon) %>%
  summarize(tot_ipums = sum(ipums),
            tot_das = sum(das)) %>%
  ggplot() +
  geom_boxplot(mapping = aes(x = epsilon, y = tot_das)) + 
  geom_boxplot(mapping = aes(y = tot_ipums), color = "darkred") +
  scale_y_log10(labels = scales::comma, name = scale_y_persons_name) + 
  scale_x_discrete(labels = box_plot_labels, name = scale_x_epsilon_name) + 
  labs(title = "Total population distribution for counties under different epsilons") +
  theme(legend.position = "none")
  

# checking county tot pops
county_pops <- ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, epsilon) %>%
  summarize(tot_ipums = sum(ipums),
            tot_das = sum(das))
