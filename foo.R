J <- 5000
sizeOption <- c(50,100,200)
driftOption <- c(0.1, 0.5, 1)

ncol<- length(sizeOption)*length(driftOption) 
betas <- matrix(NA, nrow=J, ncol=ncol) # placeholder
tstats <- matrix(NA, nrow=J, ncol=ncol) # placeholder
Rsqs <- matrix(NA, nrow=J, ncol=ncol) # placeholder

drift <- 1
n <- 100 + 1

y <- numeric()
y[1] <- 0


x <- numeric()
x[1] <- 0


for (j in 1:J){
  # step 1
  eps_y <- rnorm(n,0,1)
  eps_x <- rnorm(n, 0,1)
  for (t in 2:n){
    y[t] <- drift + y[t-1] + eps_y[t]
    x[t] <- x[t-1] +eps_x[t]
  }
  
  # step2, OLS
  fit <- lm(y~x)
  betas[j,1] <- fit$coef[2]
  tstats[j,1] <- summary(fit)$coef[2,3]
  Rsqs[j,1] <- summary(fit)$r.squared
}

