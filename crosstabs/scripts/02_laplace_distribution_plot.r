rlaplace <- function (n = 1, m = 0, s = 1){
  if (any(s <= 0)) 
    stop("s must be positive")
  q <- runif(n)
  ifelse(q < 0.5, s * log(2 * q) + m, -s * log(2 * (1 - q)) + m)
}
dlaplace <- function (y, m = 0, s = 1, log = FALSE) {
  if (any(s <= 0)) 
    stop("s must be positive")
  density <- -abs(y - m)/s - log(2 * s)
  if (!log) 
    density <- exp(density)
  density
}
Laplace_noise_generator <- function(mu, b, n.noise){
  # generate n noise points
  noise.points <- rlaplace(n = n.noise, m = mu, s = b)
  noise.density <- dlaplace(noise.points, m = mu, s = b)
  
  # plot distribution
  background.distr.x <- seq(-500, 500, length=500)
  background.distr.y <- rmutil::dlaplace(background.distr.x, m = mu, s = b)
  
  background.plot <- ggplot(data = data.frame('x' = background.distr.x, 'y' = background.distr.y), aes(x, y)) + geom_line() + scale_x_continuous(limits = c(-500, 500)) + theme_bw()
  noise.plot <- background.plot + geom_point(data=data.frame('x' = noise.points, 'y' = noise.density), aes(x, y), size = 0, alpha = 0.3)
  
  return(list(noise = noise.points,
              plot = noise.plot))
}


set.seed(1)
n <- 300
# to change the dispersion factor (beta), set b = new value
Laplace.noise <- Laplace_noise_generator(mu = 0, b = 47.401, n.noise = n)
#Laplace.noise$noise

Laplace.noise$plot + labs(x = 'x', y = 'p(x)')


# Generate Laplace distribution plots for 1940 tables 
# packages 
library(tidyverse)
library(gridExtra)

# constants 
plot_dir <- "/Users/vanriper/Documents/scratch/dp/census_runs/plots/"

# generate Laplace distribution lines using dispersion parameters from 1940 test data
# GLOBAL PRIVACY BUDGET = 0.25
# VHR has a beta of 47.401
# HHGQ has a beta of 142.222
# DETAILED has a beta of 320 - maybe don't keep this one in plot since it's being reserved?
background.distr.x <- seq(-500, 500, length=500)
background.distr.y_vhr025 <- rmutil::dlaplace(background.distr.x, m = 0, s = 47.401)
background.distr.y_hhgq025 <- rmutil::dlaplace(background.distr.x, m = 0, s = 142.222)
background.distr.y_detailed025 <- rmutil::dlaplace(background.distr.x, m = 0, s = 320)

# GLOBAL PRIVACY BUDGET = 1.0
# VHR has a beta of 11.851
# HHGQ has a beta of 35.555
# DETAILED has a beta of 80 - maybe don't keep this one in plot since it's being reserved?
background.distr.y_vhr1 <- rmutil::dlaplace(background.distr.x, m = 0, s = 11.851)
background.distr.y_hhgq1 <- rmutil::dlaplace(background.distr.x, m = 0, s = 35.555)
background.distr.y_detailed1 <- rmutil::dlaplace(background.distr.x, m = 0, s = 80)

# GLOBAL PRIVACY BUDGET = 4.0
# VHR has a beta of 2.96
# HHGQ has a beta of 8.888
# DETAILED has a beta of 20 - maybe don't keep this one in plot since it's being reserved?
background.distr.y_vhr4 <- rmutil::dlaplace(background.distr.x, m = 0, s = 2.96)
background.distr.y_hhgq4 <- rmutil::dlaplace(background.distr.x, m = 0, s = 8.888)
background.distr.y_detailed4 <- rmutil::dlaplace(background.distr.x, m = 0, s = 20)

# General Laplace shapes, betas of 50, 10, and 2
background.distr.x <- seq(-250, 250, length=1000)
background.distr.y_50 <- rmutil::dlaplace(background.distr.x, m = 0, s = 50)
background.distr.y_10 <- rmutil::dlaplace(background.distr.x, m = 0, s = 10)
background.distr.y_2 <- rmutil::dlaplace(background.distr.x, m = 0, s = 2)

# GENERATE PLOTS
background.plot025 <- ggplot() +
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_hhgq025), aes(x, y), color = "blue") + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_detailed025), aes(x, y), color = "black") + 
  scale_x_continuous(limits = c(-500, 500)) + 
  labs(title = "Laplace distributions for 1940 tables under a global privacy budget of 0.25", x = 'x', y = 'p(x)') +
  theme_bw() + 
  annotate("text", x = 45, y = 0.008, color = "red", size = 4, label = "VHR") + 
  annotate("text", x = 155, y = 0.0017, color = "blue", size = 4,  label = "HHGQ") + 
  annotate("text", x = 290, y = 0.001, color = "black", size = 4,  label = "Detailed")  
  
out_file <- paste0(plot_dir, "laplace_distribution_curves_1940_DAS_epsilon025.png")
png(out_file, width = 10, height = 7.5, units = "in", res = 300)
background.plot025
dev.off()

# plot with laplace distribution and different dispersion params for VHR table
background.plot_vhr <- ggplot() +
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr025), aes(x, y), color = "red") + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr1), aes(x, y), color = "blue") + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_vhr4), aes(x, y), color = "black") + 
  scale_x_continuous(limits = c(-500, 500)) + 
  labs(title = "Laplace distributions for VHR table under different global privacy budgets", x = 'x', y = 'p(x)') +
  theme_bw() +
  annotate("text", x = 45, y = 0.008, color = "red", size = 4, label = "0.25") + 
  annotate("text", x = -30, y = 0.0145, color = "blue", size = 4,  label = "1.0") + 
  annotate("text", x = 20, y = 0.052, color = "black", size = 4,  label = "4.0")  

out_file <- paste0(plot_dir, "laplace_distribution_curves_1940_DAS_vhr_diff_epsilons.png")
png(out_file, width = 10, height = 7.5, units = "in", res = 300)
background.plot_vhr
dev.off()
  
# plot with laplace distribution and different dispersion params for VHR table
background.plot_betas <- ggplot() +
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_50), aes(x, y), color = "red") + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_10), aes(x, y), color = "blue") + 
  geom_line(data = data.frame('x' = background.distr.x, 'y' = background.distr.y_2), aes(x, y), color = "black") + 
  scale_x_continuous(limits = c(-100, 100)) + 
  labs(title = "Laplace distributions with varying beta parameters", x = 'x', y = 'p(x)') +
  theme_bw() +
  annotate("text", x = 45, y = 0.008, color = "red", size = 4, label = "50") + 
  annotate("text", x = -23, y = 0.0145, color = "blue", size = 4,  label = "10") + 
  annotate("text", x = 10, y = 0.055, color = "black", size = 4,  label = "2")  

out_file <- paste0(plot_dir, "laplace_distribution_curves_1940_DAS_diff_betas.png")
png(out_file, width = 10, height = 7.5, units = "in", res = 300)
background.plot_betas
dev.off()

