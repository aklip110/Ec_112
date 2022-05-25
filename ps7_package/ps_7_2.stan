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
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real beta0;
  real beta1;
  real beta2;
  real<lower=0> sigma;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  y ~ normal(beta0 + beta1 * x1 + beta2 * x2, sigma);
  beta0 ~ normal(0, sqrt(400));
  beta1 ~ normal(0, sqrt(400));
  beta2 ~ normal(0, sqrt(400));
  sigma ~ gamma(1,1);
  
}

generated quantities {
  //real<lower=0, upper=1> theta_rep;
  real yPred [N];
  // use current estimate of theta to generate new sample
  for (n in 1:N) {
    yPred[n] = normal_rng(beta0 + beta1 * x1[n] + beta2 * x2[n], sigma) ;
  }
  // estimate theta_rep from new sample
  //theta_rep = sum(y_sim) * 1.0 / N;
}