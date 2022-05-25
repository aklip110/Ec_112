//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;
  vector[N] y;
  vector[N] x1;
  vector[N] x2;
  vector[N] x3;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real beta0;
  real beta1;
  real beta2;
  real beta3;
  real beta4;
  real beta5;
  real<lower=0> sigma;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for (i in 1:N){
    y[i] ~ normal(beta0 + beta1 * x1[i] + beta2 * x2[i] + beta3 * x3[i] + beta4 * x3[i] * x1[i] + beta5 * x3[i] * x2[i], sigma);
  }
   
}

generated quantities {
  vector[N] logLike;
    for (i in 1:N) {
      logLike[i] = normal_lpdf(y[i] | beta0 + beta1 * x1[i] + beta2 * x2[i] + beta3 * x3[i] + beta4 * x3[i] * x1[i] + beta5 * x3[i] * x2[i], sigma);
    }
}
