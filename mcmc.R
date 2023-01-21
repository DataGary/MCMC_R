# Import the data
data <- read.csv("data.csv")

# Fit a linear regression model
model_lm <- lm(Sales ~ Advertising + Discounts + Temperature + Competitor_Ads, data)

# First, we need to install and load the rstanarm package
#install.packages("rstanarm")
library(rstanarm)

# Specify the model
model_mcmc <- stan_glm(Sales ~ Advertising + Discounts + Temperature + Competitor_Ads, data = data,
                  family = gaussian(),
                  prior = normal(2, 1),
                  prior_intercept = normal(500, 40),
                  chains = 4, iter = 2000, warmup = 1000, seed = 123)

# Print the model summary
summary(model_lm)
summary(model_mcmc)

# Extract the coefficients and credible intervals
coef(model_mcmc)

# get credible intervals
posterior_interval(model_mcmc)
