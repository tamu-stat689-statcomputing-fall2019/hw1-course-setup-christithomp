# Generate n-dimensional response Y that follows linear regression model Y = Xbeta + epsilon, where epsilon is normal zero with variance sigma^2 independent across samples. Seed should be set at the beginning of the function
# X - design matrix
# beta - given parameter vector
# sigma - standard deviation of the noise
# seed  - starting seed value
generateY <- function(X, beta, sigma, seed = 5832652){
  #[ToDo] Set seed and generate Y following linear model
  
  #set seed for randomization
  set.seed(seed) 
  
  #define n for number of error
  n = length(beta)
  
  #calculate Y with generating from normal dist
  Y = X %*% beta + rnorm(n,0,sigma)
  
  # Return Y
  return(Y)
}

# Calculate beta_LS - least-squares solution, do not use lm function
# X - design matrix
# Y -response
calculateBeta <- function(X, Y){
  # Calculate beta_LS
  
  #beta_LS = (X'X)^(-1)X'Y
  beta_LS = t(X) %*% X 
  beta_LS = solve(beta_LS) %*% t(X)
  beta_LS = beta_LS %*% Y 
  
  # Return beta
  return(beta_LS)
}

# Calculate MSE
calculateMSE <- function(beta, beta_LS){
  #use formula below to calculate MSE
  MSE = sum((beta - beta_LS)^2)
  
  # Return MSE - error ||beta - beta_LS||_2^2
  return(MSE)
}