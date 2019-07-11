# test out some basic sums from ipums_das 
# 

# various constants 
# Box Plot Constants
box_plot_labels = c("0.25", "0.50", "0.75", "1.0", "2.0", "4.0", "6.0", "8.0")
scale_y_persons_name = "Persons"
scale_y_difference_name = "Difference (IPUMS - DAS)"
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

# ED total pop boxplot - RUN 1
ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, enumdist, epsilon, run) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot() + 
  geom_boxplot(mapping = aes(y = ipums), color = "darkred") +
  geom_boxplot(mapping = aes(x = epsilon, y = das)) +
  scale_y_continuous(labels = scales::comma, name = scale_y_persons_name) +
  scale_x_discrete(labels = box_plot_labels, name = scale_x_epsilon_name)  +
  labs(title = "Total population distribution for US enumeration districts under different levels of noise infusion (epsilon)") +
  theme_bw() + 
  theme(panel.border = element_rect(linetype =0))


# County total pop boxplot - RUN 1
ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, epsilon, run) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot() + 
  geom_boxplot(mapping = aes(x = epsilon, y = das)) +
  geom_boxplot(mapping = aes(y = ipums), color = "darkred") +
  scale_y_log10(labels = scales::comma, name = scale_y_persons_name) + 
  scale_x_discrete(labels = box_plot_labels, name = scale_x_epsilon_name) +
  labs(title = "Total population distribution for US counties under different levels of noise infusion (epsilon)") +
  theme_bw() + 
  theme(panel.border = element_rect(linetype =0))

# county total pops for run 1 by epsilon vs. IPUMS true counts
ipums_das %>%
 filter(run == "1") %>%
  group_by(state, county, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.2) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "Total population for US counties under different levels of noise infusion") +
  theme_bw() +
  theme(legend.position="none",
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# ED total pops for run 1 by epsilon vs. IPUMS true counts
ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, enumdist, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.2) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "Total population for US enumeration districts under different levels of noise infusion") +
  theme_bw() +
  theme(legend.position="none",
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# County voting age pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  group_by(qage, state, county, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das, color = qage)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.5) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  scale_color_discrete(breaks = age_breaks, labels = age_labels) +
  labs(title = "Voting age population population for US counties under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# ED voting age pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  group_by(qage, state, county, enumdist, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das, color = qage)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.5) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  scale_color_discrete(breaks = age_breaks, labels = age_labels) +
  labs(title = "Voting age population for US enumeration districts under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# County voting age pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  group_by(cenhisp, state, county, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das, color = cenhisp)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.5) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  scale_color_discrete(breaks = hisp_breaks, labels = hisp_labels) +
  labs(title = "Hispanic population for US counties under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# ED voting age pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  group_by(cenhisp, state, county, enumdist, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das, color = cenhisp)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.5) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  scale_color_discrete(breaks = hisp_breaks, labels = hisp_labels) +
  labs(title = "Hispanic population for US enumeration districts under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0)) 

# Af-Am County pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "black") %>%
  group_by(cenrace, state, county, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "African American population for US counties under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# Af-Am ED pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "black") %>%
  group_by(cenrace, state, county, enumdist, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "African American population for US enumeration districts under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0)) 

# Af-Am voting age county pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "black") %>%
  filter(qage == "va") %>%
  group_by(cenrace, qage, state, county, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "African American voting age population for US counties under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# Af-Am Voting Age ED pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "black") %>%
  filter(qage == "va") %>%
  group_by(cenrace, qage, state, county, enumdist, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "African American voting age population for US enumeration districts under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0)) 

# Aian County pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "aian") %>%
  group_by(cenrace, state, county, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "American Indian population for US counties under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# Aian ED pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "aian") %>%
  group_by(cenrace, state, county, enumdist, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "American Indian population for US enumeration districts under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0)) 

# Aian voting age county pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "aian") %>%
  filter(qage == "va") %>%
  group_by(cenrace, qage, state, county, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "American Indian voting age population for US counties under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0))  

# Aian Voting Age ED pop for run 1 by epsilon vs. IPUMS
ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "aian") %>%
  filter(qage == "va") %>%
  group_by(cenrace, qage, state, county, enumdist, epsilon) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  ggplot(mapping = aes(x = ipums, y = das)) + 
  geom_abline(slope = 1, intercept = 0, color = "gray75") +
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_x_log10(labels = scales::comma, name = ipums_x_name) + 
  scale_y_log10(labels = scales::comma, name = das_y_name) +
  labs(title = "American Indian voting age population for US enumeration districts under different levels of noise infusion") +
  theme_bw() + 
  theme(legend.title=element_blank(),
        panel.border = element_rect(linetype = 0),
        strip.background = element_rect(linetype = 0)) 

# Total difference box plot - county (IPUMS - das)
# Step 1-create county df with geolvl == "county"
ipums_das_county_diff <- ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, epsilon, run) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  mutate(diff = ipums - das,
         geolvl = "county")

# Total difference box plot - ED (IPUMS - das)
# Step 2-create ED df with geolvl == "ED"
ipums_das_ed_diff <- ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, enumdist, epsilon, run) %>%
  summarize(ipums = sum(ipums),
            das = sum(das)) %>%
  mutate(diff = ipums - das,
         geolvl = "ed")

# bind rows to create a single tbl 
ipums_das_tot_diff <- bind_rows(ipums_das_county_diff, ipums_das_ed_diff)

# plot county diff as box plot
ipums_das_tot_diff %>%
  ggplot(mapping = aes(x = epsilon, y = diff, color = geolvl)) +
  geom_boxplot() +
  scale_y_continuous(name = scale_y_difference_name) +
  scale_x_discrete(labels = box_plot_labels, name = scale_x_epsilon_name) + 
  labs(title = "Difference between IPUMS and Census DAS total population counts for US counties and EDs under different levels of noise infusion") +
  theme_bw() + 
  theme(panel.border = element_rect(linetype =0),
        legend.title = element_blank())

# IPUMS county population rank vs. absolute value of diff 
# total pop (y axis) vs. abs(diff) plot, faceted by epsilon - y axis ordered by IPUMS pop of geoglvl
ipums_das_county_diff %>%
  group_by(epsilon) %>%
  mutate(rank = dense_rank(ipums)) %>%
  ggplot() +
  geom_point(aes(x = abs(diff), y = rank)) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  labs(title = "Population rank vs. abs difference between IPUMS and Census DAS total population counts for US counties under different levels of noise infusion")

# IPUMS ED population rank vs. absolute value of diff 
# total pop (y axis) vs. abs(diff) plot, faceted by epsilon - y axis ordered by IPUMS pop of geoglvl
ipums_das_ed_diff %>%
  group_by(epsilon) %>%
  mutate(rank = dense_rank(ipums)) %>%
  ggplot() +
  geom_point(aes(x = abs(diff), y = rank)) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  labs(title = "Population rank vs. abs difference between IPUMS and Census DAS total population counts for US enumeration districts under different levels of noise infusion")

# PERCENTAGES OF COUNTY AND ED SUBPOPS
ipums_das_voting_county_proportions <- ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, epsilon, qage, run) %>%
  summarize(ipums_sub = sum(ipums),
         das_sub = sum(das)) %>%
  right_join(ipums_das_county_diff, by=c("state", "county", "epsilon", "run")) %>%
  mutate(perc_ipums = (ipums_sub / ipums) * 100,
         perc_das = (das_sub / das) * 100)

ipums_das_voting_ed_proportions <- ipums_das %>%
  filter(run == "1") %>%
  group_by(state, county, enumdist, epsilon, qage, run) %>%
  summarize(ipums_sub = sum(ipums),
            das_sub = sum(das)) %>%
  right_join(ipums_das_ed_diff, by=c("state", "county", "enumdist", "epsilon", "run")) %>%
  mutate(perc_ipums = (ipums_sub / ipums) * 100,
         perc_das = (das_sub / das) * 100)

# scatterplot IPUMS non-voting age proportions vs. DAS non-voting age proportions by county, faceted by epsilon
ipums_das_voting_county_proportions %>%
  filter(qage == "non_va") %>%
  ggplot(mapping = aes(x = perc_ipums, y = perc_das)) + 
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_y_continuous(name = das_percentage_y_name) +
  scale_x_continuous(name = ipums_percentage_x_name) + 
  scale_color_discrete(labels = age_labels) +
  labs(title = "Census DAS vs. IPUMS non-voting age percentages for US counties under different levels of noise infusion") +
  theme_bw() + 
  theme(panel.border = element_rect(linetype =0),
        legend.title = element_blank(),
        strip.background = element_rect(linetype = 0))

# scatterplot IPUMS non-voting age proportions vs. DAS non-voting age proportions by ED, faceted by epsilon
ipums_das_voting_ed_proportions %>%
  ungroup() %>%
  filter(qage == "non_va") %>%
#  filter(epsilon == "025" | epsilon == "1" | epsilon == "4" | epsilon == "8") %>%
  ggplot(mapping = aes(x = perc_ipums, y = perc_das)) + 
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_y_continuous(name = das_percentage_y_name) +
  scale_x_continuous(name = ipums_percentage_x_name) + 
  scale_color_discrete(labels = age_labels) +
  labs(title = "Census DAS vs. IPUMS non-voting age percentages for US enumeration districts under different levels of noise infusion") +
  theme_bw() + 
  theme(panel.border = element_rect(linetype =0),
        legend.title = element_blank(),
        strip.background = element_rect(linetype = 0))


# PERCENTAGES OF COUNTY AND ED BLACK POPS
ipums_das_black_county_proportions <- ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "black") %>%
  group_by(state, county, epsilon, cenrace, run) %>%
  summarize(ipums_sub = sum(ipums),
            das_sub = sum(das)) %>%
  right_join(ipums_das_county_diff, by=c("state", "county", "epsilon", "run")) %>%
  mutate(perc_ipums = (ipums_sub / ipums) * 100,
         perc_das = (das_sub / das) * 100)

ipums_das_black_ed_proportions <- ipums_das %>%
  filter(run == "1") %>%
  filter(cenrace == "black") %>%
  group_by(state, county, enumdist, epsilon, cenrace, run) %>%
  summarize(ipums_sub = sum(ipums),
            das_sub = sum(das)) %>%
  right_join(ipums_das_ed_diff, by=c("state", "county", "enumdist", "epsilon", "run")) %>%
  mutate(perc_ipums = (ipums_sub / ipums) * 100,
         perc_das = (das_sub / das) * 100)

# scatterplot IPUMS non-voting age proportions vs. DAS black proportions by county, faceted by epsilon
ipums_das_black_county_proportions %>%
#  filter(qage == "non_va") %>%
  ggplot(mapping = aes(x = perc_ipums, y = perc_das)) + 
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_y_continuous(name = das_percentage_y_name) +
  scale_x_continuous(name = ipums_percentage_x_name) + 
#  scale_color_discrete(labels = age_labels) +
  labs(title = "African American percentage for US counties under different levels of noise infusion") +
  theme_bw() + 
  theme(panel.border = element_rect(linetype =0),
        legend.title = element_blank(),
        strip.background = element_rect(linetype = 0))

# scatterplot IPUMS non-voting age proportions vs. DAS non-voting age proportions by ED, faceted by epsilon
ipums_das_black_ed_proportions %>%
  ungroup() %>%
#  filter(qage == "non_va") %>%
  #  filter(epsilon == "025" | epsilon == "1" | epsilon == "4" | epsilon == "8") %>%
  ggplot(mapping = aes(x = perc_ipums, y = perc_das)) + 
  geom_point(alpha = 0.3) + 
  facet_wrap(~epsilon, nrow = 2, labeller=labeller(epsilon = epsilon_labels)) +
  scale_y_continuous(name = das_percentage_y_name) +
  scale_x_continuous(name = ipums_percentage_x_name) + 
#  scale_color_discrete(labels = age_labels) +
  labs(title = "African American percentage for US enumeration districts under different levels of noise infusion") +
  theme_bw() + 
  theme(panel.border = element_rect(linetype =0),
        legend.title = element_blank(),
        strip.background = element_rect(linetype = 0))


###############
# ED 4-group diversity index
# Asian isn't part of the cenrace factor, so R is complaining at me after the recode
# 
tol = .Machine$double.eps

#ipums_das_diversity <- ipums_das_proportions
# create ED-level sums for four race groups
ipums_das_diversity_summarize <- ipums_das %>%
  filter(run == "1") %>%
  mutate(cenrace = replace(cenrace, cenrace == "chinese", "asian"),
         cenrace = replace(cenrace, cenrace == "japanese", "asian"),
         cenrace = replace(cenrace, cenrace == "other_asian", "asian")) %>%
  group_by(state, county, enumdist, epsilon, cenrace) %>%
  summarise(ipums_race = sum(ipums),
            das_race = sum(das))

# use fct_explicit_na to create the "asian" factor level in ipums_das_diversity_summarize$cenrace
ipums_das_diversity_summarize$cenrace <- fct_explicit_na(ipums_das_diversity_summarize$cenrace, na_level = "asian")

# join ED total pop to each record in ipums_das_diversity_summarize
# for each race category, compute the input to the diversity index by multiplying prop by log(1 / prop)
ipums_das_diversity_summarize <- ipums_das_diversity_summarize %>%
  left_join(ipums_das_ed_diff, by=c("state", "county", "enumdist", "epsilon")) %>%
  mutate(prop_ipums_race = ipums_race / ipums,
         prop_das_race = das_race / das,
         diversity_ipums = ((prop_ipums_race + tol) * log(1 / (prop_ipums_race + tol))),
         diversity_das = ((prop_das_race + tol) * log(1 / (prop_das_race + tol))))

# compute the diversity index for each ED by summing the race-specific diversity values and dividing by log(4)
ipums_das_diversity_index <- ipums_das_diversity_summarize %>%
  group_by(state, county, enumdist, epsilon) %>%
  summarise(diversity_index_ipums = sum(diversity_ipums) / log(4),
            diversity_index_das = sum(diversity_das) / log(4))

# plot output
ipums_das_diversity_index %>%
  ggplot(mapping = aes(x = diversity_index_ipums, y = diversity_index_das)) +
  geom_point(alpha = 0.1) + 
  facet_wrap(~epsilon, nrow=2) + 
  labs(title = "Four-group diversity index under different epsilons",
       x = "IPUMS",
       y = "Census DAS") + 
  theme(legend.position="none")
