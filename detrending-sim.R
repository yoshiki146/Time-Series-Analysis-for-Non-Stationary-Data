### This is a revised version of my earlier work on Monte Carki simulations. 
### Original work can be found from the same repository (or link below), which is in Python
### https://github.com/yoshiki146/Time-Series-Analysis-for-Non-Stationary-Data/blob/master/Detrending-Sim.ipynb), 
### This post attemps to make my earlier work neat and tidy using R.  


J <- 10000 # number of simulations 
size <- c(50,100,200) # sample sizes
sigma <- sqrt(80) # standard diviation for epsilon
alpha <- 2 # true intercept
delta <- 2 # true coefficient
estim <- matrix(NA, nrow=J, ncol=2*length(size)) # placeholder for estimated coefficient...
# ... each row represents different monte carlo sample and each column for each coefficient... 
# ... the number of columns are set to 2*3=6, since we have two coefficients to estimate... 
# ... (alphaHat and deltaHat) for three different sample sizes...
# ... e.g. estim[100,5] represents the estimated alpha of 100th MC sample, where sample size is 200


for (i in 1:length(size)){  # loop through different sample sizes
  n <- size[i]
  t <- 1:n
  for(j in 1:J){
    # generate data
    eps <- rnorm(n=n, mean=0, sd=sigma) # gen epsilon that follows N(0,\sqrt{80})
    y <- alpha + delta*t+eps # gen y accoding to the setting
    # estimate \hat{\aloha} and \hat{\delta}
    fit <- lm(y~t)
    estim[j,(2*i-1):(2*i)] <- fit$coef # fill in estimated alphaHat and deltaHat
  }
} # takes around 30 sec




