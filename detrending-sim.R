### This is a revised version of my earlier work on Monte Carki simulations. 
### Original work can be found from the same repository (or link below), which is in Python
### https://github.com/yoshiki146/Time-Series-Analysis-for-Non-Stationary-Data/blob/master/Detrending-Sim.ipynb), 
### This post attemps to make my earlier work neat and tidy using R.  

J <- 10000 # number of simulations 
size <- c(50,100,200) # sample sizes
sigma <- sqrt(80) # standard diviation for epsilon
alpha <- 2 # true intercept
delta <- 2 # true coefficient
estim <- matrix(NA, nrow=J, ncol=2*length(size),
                dimnames = list(1:J, c("a50","d50","a100","d100","a200","d200"))) # placeholder for estimated coefficient...
# ... each row represents different monte carlo sample and each column for each coefficient... 
# ... the number of columns are set to 2*3=6, since we have two coefficients to estimate... 
# ... (alphaHat and deltaHat) for three different sample sizes...
# ... e.g. estim[100,5] represents the estimated alpha of 100th MC sample, where sample size is 200

set.seed(123)
for (i in 1:length(size)){  # loop through different sample sizes
  n <- size[i] # select the sample size to be used
  t <- 1:n
  for(j in 1:J){
    idxTracker <- idxTracker +1
    # generate data
    eps <- rnorm(n=n, mean=0, sd=sigma) # gen epsilon that follows N(0,\sqrt{80})
    y <- alpha + delta*t+eps # gen y accoding to the setting
    # estimate \hat{\aloha} and \hat{\delta}
    fit <- lm(y~t)
    estim[j,(2*i-1):(2*i)] <- fit$coef # fill in estimated alphaHat and deltaHat
  }
} # takes around 30 sec


# vidualise
library(ggplot2)

alphas<- as.vector(estim[,c(1,3,5)]) # flatten alpha into single vector
deltas <- as.vector(estim[,c(2,4,6)]) # delta into single vector
sampleSize <- c(rep("n= 50",J), rep("n=100",J), rep("n=200",J)) # label sample size to alpha and delta
df <- data.frame(alpha=alphas, delta=deltas, sampleSize = sampleSize) # combine them into a dataframe

fig1 <- ggplot(data=df, aes(alphas, fill=sampleSize)) +
  geom_histogram(bins=200)
fig2 <- ggplot(df, aes(deltas, fill=sampleSize)) +
  geom_histogram(bins=200) 
Rmisc::multiplot(fig1, fig2, cols=1)

# bias and variance
trueCoef <- c(rep(c(alpha, delta), length(size)))
bias <- apply(X=(estim-trueCoef), MARGIN=2, FUN=mean)
avg <- apply(estim, 2, mean)
variance <- apply((estim-avg)^2, 2, mean)
mse <- bias^2 + variance

