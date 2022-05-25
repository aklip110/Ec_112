data {
  int N;
  real X[N];
}
parameters {
  real mu;
  real<lower=0> sigma;
}
model {
  X ~ normal(mu,sigma);
  mu ~ normal(0,1);
  sigma ~ lognormal(0,1);
}
generated quantities {
  vector[N] logLike;
    for (i in 1:N) {
      logLike[i] = normal_lpdf(X[i] | mu,sigma);
    }
}


