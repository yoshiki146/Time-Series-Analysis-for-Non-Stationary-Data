### This is a revised version of my earlier work on Monte Carki simulations. 
### Original work can be found from the same repository (or link below), which is in Python
### https://github.com/yoshiki146/Time-Series-Analysis-for-Non-Stationary-Data/blob/master/Detrending-Sim.ipynb), 
### This post attemps to make my earlier work neat and tidy using R.  


J <- 10000 # number of simulations 
size <- c(50,100,200) # sample sizes
sigma <- sqrt(80) # standard diviation for epsilon
alpha <- 2 # true intercept
delta <- 2 # true coefficient
estim <- matrix(NA, nrow=J, ncol=3*length(size)) # placeholder for estimated coefficient...
# ... each row represents different monte carlo sample and each column for each coefficient... 
# ... the number of columns are set to 3*3=9, since we have three metrics to estimate... 
# ... (alphaHat, deltaHat and R^2) for three different sample sizes...
# ... e.g. estim[100,7] represents the estimated alpha of 100th MC sample, where sample size is 200


for (i in 1:length(size)){  # loop through different sample sizes
  n <- size[i]
  t <- 1:n
  for(j in 1:J){
    # generate data
    eps <- rnorm(n=n, mean=0, sd=sigma) # gen epsilon that follows N(0,\sqrt{80})
    y <- alpha + delta*t+eps # gen y accoding to the setting
    # estimate \hat{\aloha} and \hat{\delta}
    fit <- lm(y~t)
    estim[j,(3*i-2):(3*i-1)] <- fit$coef # intercept and coef in column 1,2,4,5,7 and 8 
    estim[j, 3*i] <- summary(fit)$r.squared # R squared for column 3,6 and 9
  }
} # takes around 30 sec

library(ggplot2)


