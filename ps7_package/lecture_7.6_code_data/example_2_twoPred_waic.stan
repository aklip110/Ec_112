data {
  int N;
  matrix[N,2] X;
  real Y[N];
}
parameters {
  real beta0;
  real beta1;
  real beta2;
  real<lower=0> sigma;
}
model {
  for (i in 1:N) {
    Y[i] ~ normal(beta0 + beta1 * X[i,1] + beta2 * X[i,2],sigma);
  }
  beta0 ~ normal(0,1);
  beta1 ~ normal(0,1);
  beta2 ~ normal(0,1);
  sigma ~ lognormal(0,1);
}
generated quantities {
  vector[N] logLike;
    for (i in 1:N) {
      logLike[i] = normal_lpdf(Y[i] | beta0 + beta1 * X[i,1] + beta2 * X[i,2],sigma);
    }
}

