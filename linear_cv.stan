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
  int NTest;
  int NTrain;
  real yTrain[NTrain];
  real yTest[NTest];
  real x1Train[NTrain];
  real x1Test[NTest];
  real x2Train[NTrain];
  real x2Test[NTest];
  real x3Train[NTrain];
  real x3Test[NTest];
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
  for (i in 1:NTrain){
    yTrain[i] ~ normal(beta0 + beta1 * x1Train[i] + beta2 * x2Train[i], sigma);
  }
}

generated quantities {
  vector[NTest] logLike;
    for (i in 1:NTest) {
      logLike[i] = normal_lpdf(yTest[i] | beta0 + beta1 * x1Test[i] + beta2 * x2Test[i], sigma);
    }
}
