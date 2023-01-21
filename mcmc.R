# Import the data
data <- read.csv("data.csv")

# Fit a linear regression model
model <- lm(Sales ~ Advertising + Discounts + Temperature + Competitor_Ads, data)

# Print the model summary
summary(model)

# First, we need to install and load the rstanarm package
install.packages("rstanarm")
library(rstanarm)

# Import the data
data <- read.csv("data.csv")

# Specify the model
model <- stan_glm(Sales ~ Advertising + Discounts + Temperature + Competitor_Ads, data = data,
                  family = gaussian(),
                  prior = normal(0, 2),
                  prior_intercept = normal(0, 2),
                  chains = 4, iter = 2000, warmup = 1000, seed = 123)

# Fit the model
fit <- sampling(model)

# Extract the coefficients and credible intervals
coef(fit)
credible_interval(fit)
