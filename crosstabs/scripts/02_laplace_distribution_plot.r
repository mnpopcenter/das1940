# 02_laplace_distribution_plot.r
# 
# Author: David Van Riper
# 
# The Census Bureau uses either the Laplace or the Geometric mechanism to infuse noise into cells. The
# Laplace mechanism is best used for non-integer values, and the Geometric mechanism works best for integer
# values. Most DP literature uses the Laplace distribution when discuss noise infusion, and I find the Laplace
# distribution aesthetically pleasing. Thus, I'm using it for the plots that describe the distribution from
# which noise values are drawn. 
# 
# This script generates plots of Laplace distributions that have different dispersion parameters. I base the
# dispersion parameters on actual values include in the config file (1940) of the 2018 E2E code. 

# PACKAGES 
library(tidyverse)
library(gridExtra)

# CONSTANTS 
# directory for storing output plots
plot_dir <- "/pkg/ipums/misc/census-das/das_dp_data/crosstabs/plots/"
#plot_dir <- "/Users/vanriper/Documents/scratch/dp/census_runs/plots/"

# generate Laplace distribution lines using dispersion parameters from 1940 test data
# GLOBAL PRIVACY BUDGET = 0.25
# VHR has a beta of 47.401
# HHGQ has a beta of 142.222
# DETAILED has a beta of 320
background.distr.x <- seq(-550, 550, length=550)
background.distr.y_vhr025 <- rmutil::dlaplace(background.distr.x, m = 0, s = 47.401)
background.distr.y_hhgq025 <- rmutil::dlaplace(background.distr.x, m = 0, s = 142.222)
background.distr.y_detailed025 <- rmutil::dlaplace(background.distr.x, m = 0, s = 320)

# compute the 50th, 90th, and 99th percentiles of the VHR 0.25 value
y_vhr025_50th <- rmutil::qlaplace(0.50, m = 0, s = 47.401)
y_vhr025_90th <- rmutil::qlaplace(0.90, m = 0, s = 47.401)
y_vhr025_99th <- rmutil::qlaplace(0.99, m = 0, s = 47.401)

# compute the 90thpercentiles of the hhgq and detailed 0.25 value
y_hhgq025_90th <- rmutil::qlaplace(0.90, m = 0, s = 142.222)
y_detailed025_90th <- rmutil::qlaplace(0.90, m = 0, s = 320)


# compute the probabilities for the 50th, 90th, and 99th percentiles of vhr025
# these probabilities are used to generate the vertical lines on the plot depicting them
y_p_vhr025_50th <- rmutil::dlaplace(y_vhr025_50th, m = 0, s = 47.401)
y_p_vhr025_90th <- rmutil::dlaplace(y_vhr025_90th, m = 0, s = 47.401)
y_p_vhr025_99th <- rmutil::dlaplace(y_vhr025_99th, m = 0, s = 47.401)


# compute the probabilities for the 90thpercentiles of hhgq and detailed
y_p_hhgq025_90th <- rmutil::dlaplace(y_hhgq025_90th, m = 0, s = 142.222)
y_p_detailed025_90th <- rmutil::dlaplace(y_detailed025_90th, m = 0, s = 320)


# GLOBAL PRIVACY BUDGET = 1.0
# VHR has a beta of 11.851
# HHGQ has a beta of 35.555
# DETAILED has a beta of 80
background.distr.y_vhr1 <- rmutil::dlaplace(background.distr.x, m = 0, s = 11.851)
background.distr.y_hhgq1 <- rmutil::dlaplace(background.distr.x, m = 0, s = 35.555)
background.distr.y_detailed1 <- rmutil::dlaplace(background.distr.x, m = 0, s = 80)

# GLOBAL PRIVACY BUDGET = 4.0
# VHR has a beta of 2.96
# HHGQ has a beta of 8.888
# DETAILED has a beta of 20
background.distr.y_vhr4 <- rmutil::dlaplace(background.distr.x, m = 0, s = 2.96)
background.distr.y_hhgq4 <- rmutil::dlaplace(background.distr.x, m = 0, s = 8.888)
background.distr.y_detailed4 <- rmutil::dlaplace(background.distr.x, m = 0, s = 20)

# 90th percentile values for tables under s values (epsilon of 4.0)
y_vhr4_90th <- rmutil::qlaplace(0.90, m = 0, s = 2.96)
y_hhgq4_90th <- rmutil::qlaplace(0.90, m = 0, s = 8.888)
y_detailed4_90th <- rmutil::qlaplace(0.90, m = 0, s = 20)



# General Laplace shapes, betas of 50, 10, and 2
# background.distr.x <- seq(-250, 250, length=1000)
# background.distr.y_50 <- rmutil::dlaplace(background.distr.x, m = 0, s = 50)
# background.distr.y_10 <- rmutil::dlaplace(background.distr.x, m = 0, s = 10)
# background.distr.y_2 <- rmutil::dlaplace(background.distr.x, m = 0, s = 2)

# GENERATE PLOTS
# orig/50th/90th/99th percentile vertical lines on plot based on VHR 0.25 dispersion parameter
p_no_percentiles <- ggplot() + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") +
  scale_x_continuous(limits = c(-550,550), breaks = c(-600, -300, 0, 300, 600)) +
  labs(title = "Laplace distribution", x = 'x', y = 'p(x)') +
  theme_bw() + 
  theme(legend.position="none",
        plot.title = element_text(size = 24),
        panel.grid.minor.x = element_blank())
  
p_50th <- ggplot() + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") +
  geom_segment(aes(x = y_vhr025_50th, y = 0, xend = y_vhr025_50th, yend = y_p_vhr025_50th)) +
  geom_segment(aes(x = 0 - y_vhr025_50th, y = 0, xend = 0 - y_vhr025_50th, yend = y_p_vhr025_50th)) +
#  geom_segment(aes(x = y_vhr025_90th, y = 0, xend = y_vhr025_90th, yend = y_p_vhr025_90th)) +
#  geom_segment(aes(x = 0 - y_vhr025_90th, y = 0, xend = 0 - y_vhr025_90th, yend = y_p_vhr025_90th)) +
#  geom_segment(aes(x = y_vhr025_99th, y = 0, xend = y_vhr025_99th, yend = y_p_vhr025_99th)) +
#  geom_segment(aes(x = 0 - y_vhr025_99th, y = 0, xend = 0 - y_vhr025_99th, yend = y_p_vhr025_99th)) +
  scale_x_continuous(limits = c(-550,550), breaks = c(-600, -300, 0, 300, 600)) +
  labs(title = "Percentiles for Laplace distribution", x = 'x', y = 'p(x)') +
#  annotate("text", x = 145, y = 0.0022, size = 6, label = "90th = 76") +
  annotate("text", x = 65, y = 0.0105, size = 6, label = "50th = 0") +
#  annotate("text", x = 255, y = 0.000395, size = 6, label = "99th = 185") +
#  annotate("text", x = 45, y = 0.008, color = "red", size = 4, label = "VHR") + 
  theme_bw() + 
  theme(legend.position="none",
        plot.title = element_text(size = 24),
        panel.grid.minor.x = element_blank())

p_50th_90th <- ggplot() + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") +
  geom_segment(aes(x = y_vhr025_50th, y = 0, xend = y_vhr025_50th, yend = y_p_vhr025_50th)) +
  geom_segment(aes(x = 0 - y_vhr025_50th, y = 0, xend = 0 - y_vhr025_50th, yend = y_p_vhr025_50th)) +
  geom_segment(aes(x = y_vhr025_90th, y = 0, xend = y_vhr025_90th, yend = y_p_vhr025_90th)) +
  geom_segment(aes(x = 0 - y_vhr025_90th, y = 0, xend = 0 - y_vhr025_90th, yend = y_p_vhr025_90th)) +
  #  geom_segment(aes(x = y_vhr025_99th, y = 0, xend = y_vhr025_99th, yend = y_p_vhr025_99th)) +
  #  geom_segment(aes(x = 0 - y_vhr025_99th, y = 0, xend = 0 - y_vhr025_99th, yend = y_p_vhr025_99th)) +
  scale_x_continuous(limits = c(-550,550), breaks = c(-600, -300, 0, 300, 600)) +
  labs(title = "Percentiles for Laplace distribution", x = 'x', y = 'p(x)') +
  annotate("text", x = 150, y = 0.0022, size = 6, label = "90th = 76") +
  annotate("text", x = 65, y = 0.0105, size = 6, label = "50th = 0") +
  #  annotate("text", x = 255, y = 0.000395, size = 6, label = "99th = 185") +
  #  annotate("text", x = 45, y = 0.008, color = "red", size = 4, label = "VHR") + 
  theme_bw() + 
  theme(legend.position="none",
        plot.title = element_text(size = 24),
        panel.grid.minor.x = element_blank())

p_50th_90th_99th <- ggplot() + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") +
  geom_segment(aes(x = y_vhr025_50th, y = 0, xend = y_vhr025_50th, yend = y_p_vhr025_50th)) +
  geom_segment(aes(x = 0 - y_vhr025_50th, y = 0, xend = 0 - y_vhr025_50th, yend = y_p_vhr025_50th)) +
  geom_segment(aes(x = y_vhr025_90th, y = 0, xend = y_vhr025_90th, yend = y_p_vhr025_90th)) +
  geom_segment(aes(x = 0 - y_vhr025_90th, y = 0, xend = 0 - y_vhr025_90th, yend = y_p_vhr025_90th)) +
  geom_segment(aes(x = y_vhr025_99th, y = 0, xend = y_vhr025_99th, yend = y_p_vhr025_99th)) +
  geom_segment(aes(x = 0 - y_vhr025_99th, y = 0, xend = 0 - y_vhr025_99th, yend = y_p_vhr025_99th)) +
  scale_x_continuous(limits = c(-550,550), breaks = c(-600, -300, 0, 300, 600)) +
  labs(title = "Percentiles for Laplace distribution", x = 'x', y = 'p(x)') +
  annotate("text", x = 150, y = 0.0022, size = 6, label = "90th = 76") +
  annotate("text", x = 65, y = 0.0105, size = 6, label = "50th = 0") +
  annotate("text", x = 265, y = 0.000395, size = 6, label = "99th = 185") +
  #  annotate("text", x = 45, y = 0.008, color = "red", size = 4, label = "VHR") + 
  theme_bw() + 
  theme(legend.position="none",
        plot.title = element_text(size = 24),
        panel.grid.minor.x = element_blank())

# # VHR with 90th percentile vertical lines, which depict the range that 90% of all random draws will fall within   
# p_vhr025_90th <- ggplot() + 
#   geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") +
#   geom_segment(aes(x = y_vhr025_90th, y = 0, xend = y_vhr025_90th, yend = y_p_vhr025_90th)) +
#   geom_segment(aes(x = 0 - y_vhr025_90th, y = 0, xend = 0 - y_vhr025_90th, yend = y_p_vhr025_90th)) +
#   scale_x_continuous(limits = c(-550,550), breaks = c(-600, -300, -76, 0, 76, 300, 600)) +
#   labs(title = "Laplace distribution for 1940 VHR under a global privacy budget of 0.25", x = 'x', y = 'p(x)') +
#   annotate("text", x = 45, y = 0.008, color = "red", size = 4, label = "VHR") + 
#   theme_bw() + 
#   theme(legend.position="none")
# 
# # HHGQ with 90th percentile vertical lines, which depict the range that 90% of all random draws will fall within   
# p_hhgq025_90th <- ggplot() + 
#   geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_hhgq025), aes(x, y), color = "blue") +
#   geom_segment(aes(x = y_hhgq025_90th, y = 0, xend = y_hhgq025_90th, yend = y_p_hhgq025_90th)) +
#   geom_segment(aes(x = 0 - y_hhgq025_90th, y = 0, xend = 0 - y_hhgq025_90th, yend = y_p_hhgq025_90th)) +
#   scale_x_continuous(limits = c(-550,550), breaks = c(-600, -300, -229, 0, 229, 300, 600)) +
#   labs(title = "Laplace distribution for 1940 HHGQ under a global privacy budget of 0.25", x = 'x', y = 'p(x)') +
#   annotate("text", x = 155, y = 0.0017, color = "blue", size = 4, label = "HHGQ") + 
#   theme_bw() + 
#   theme(legend.position="none")
# 
# # Detailed with 90th percentile vertical lines, which depict the range that 90% of all random draws will fall within   
# p_detailed025_90th <- ggplot() + 
#   geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_detailed025), aes(x, y), color = "black") +
#   geom_segment(aes(x = y_detailed025_90th, y = 0, xend = y_detailed025_90th, yend = y_p_detailed025_90th)) +
#   geom_segment(aes(x = 0 - y_detailed025_90th, y = 0, xend = 0 - y_detailed025_90th, yend = y_p_detailed025_90th)) +
#   scale_x_continuous(limits = c(-550,550), breaks = c(-600,-515, -300, 0, 300, 515, 600)) +
#   labs(title = "Laplace distribution for 1940 Detailed under a global privacy budget of 0.25", x = 'x', y = 'p(x)') +
#   annotate("text", x = 190, y = 0.00105, color = "black", size = 4, label = "Detailed") + 
#   theme_bw() + 
#   theme(legend.position="none")

# VHR + HHGQ + Detailed on one plot 
# - DUPLICATE SLIDE OF P_DIFF_EPSILONS, BUT WITH VHR/HHGQ/DETAILED LABELS
p_all025 <- ggplot() + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") +
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_hhgq025), aes(x, y), color = "blue") +
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_detailed025), aes(x, y), color = "black") +
  labs(title = "Laplace distributions for 1940 tables (epsilon = 0.25)", x = 'x', y = 'p(x)') +
  annotate("text", x = 45, y = 0.008, color = "red", size = 6, label = "VHR") + 
  annotate("text", x = 165, y = 0.0017, color = "blue", size = 6,  label = "HHGQ") + 
  annotate("text", x = 375, y = 0.00085, color = "black", size = 6,  label = "Detailed") + 
  theme_bw() + 
  theme(plot.title = element_text(size = 24))

# different epsilons - demos how noise increases as dispersion parameter increases 
# - CONSIDER CHANGING LABELS TO MORE ACCURATE/LESS ACCURATE? RATHER THAN USING NUMBERS
p_diff_epsilons <- ggplot() + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") +
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_hhgq025), aes(x, y), color = "blue") +
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_detailed025), aes(x, y), color = "black") +
  labs(title = "Laplace distributions for different epsilons", x = 'x', y = 'p(x)') +
  annotate("text", x = 110, y = 0.008, color = "red", size = 6, label = "More accurate") + 
  annotate("text", x = 350, y = 0.001, color = "black", size = 6,  label = "Less accurate") +
  theme_bw() + 
  theme(legend.position="none",
        plot.title = element_text(size=24))



# # plot laplace distribution with different dispersion parameters for VHR table (0.25, 1.0, 4.0)
# p_plot_vhr <- ggplot() +
#   geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") +
#   geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr1), aes(x, y), color = "blue") +
#   geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr4), aes(x, y), color = "black") +
#   scale_x_continuous(limits = c(-250, 250)) +
#   labs(title = "Laplace distributions for VHR table under different global privacy budgets", x = 'x', y = 'p(x)') +
#   theme_bw() +
#   annotate("text", x = 45, y = 0.008, color = "red", size = 4, label = "0.25") +
#   annotate("text", x = -30, y = 0.0145, color = "blue", size = 4,  label = "1.0") +
#   annotate("text", x = 20, y = 0.052, color = "black", size = 4,  label = "4.0")

# write out PNG files for N plot objects
out_file <- paste0(plot_dir, "laplace_distribution_curve_no_percentiles.png")
png(out_file, width = 12, height = 7.5, units = "in", res = 300)
grid.arrange(p_no_percentiles)
dev.off()

out_file <- paste0(plot_dir, "laplace_distribution_curve_50th.png")
png(out_file, width = 12, height = 7.5, units = "in", res = 300)
grid.arrange(p_50th)
dev.off()

out_file <- paste0(plot_dir, "laplace_distribution_curve_50th_90th.png")
png(out_file, width = 12, height = 7.5, units = "in", res = 300)
grid.arrange(p_50th_90th)
dev.off()

out_file <- paste0(plot_dir, "laplace_distribution_curve_50th_90th_99th.png")
png(out_file, width = 12, height = 7.5, units = "in", res = 300)
grid.arrange(p_50th_90th_99th)
dev.off()

# out_file <- paste0(plot_dir, "laplace_distribution_curve_VHR025.png")
# png(out_file, width = 12, height = 7.5, units = "in", res = 300)
# grid.arrange(p_vhr025_90th)
# dev.off()
# 
# out_file <- paste0(plot_dir, "laplace_distribution_curve_HHGQ025.png")
# png(out_file, width = 12, height = 7.5, units = "in", res = 300)
# grid.arrange(p_hhgq025_90th)
# dev.off()
# 
# out_file <- paste0(plot_dir, "laplace_distribution_curve_Detailed025.png")
# png(out_file, width = 12, height = 7.5, units = "in", res = 300)
# grid.arrange(p_detailed025_90th)
# dev.off()

out_file <- paste0(plot_dir, "laplace_distribution_diff_epsilons.png")
png(out_file, width = 12, height = 7.5, units = "in", res = 300)
grid.arrange(p_diff_epsilons)
dev.off()

out_file <- paste0(plot_dir, "laplace_distribution_curve_All025.png")
png(out_file, width = 12, height = 7.5, units = "in", res = 300)
grid.arrange(p_all025)
dev.off()

# out_file <- paste0(plot_dir, "laplace_distribution_curve_VHR_3epsilons.png")
# png(out_file, width = 12, height = 7.5, units = "in", res = 300)
# grid.arrange(p_plot_vhr)
# dev.off()



