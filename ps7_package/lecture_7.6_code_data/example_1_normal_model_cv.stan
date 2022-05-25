data {
  int NTest;
  int NTrain;
  real XTrain[NTrain];
  real XTest[NTest];
}
parameters {
  real mu;
  real<lower=0> sigma;
}
model {
  XTrain ~ normal(mu,sigma);
  mu ~ normal(0,1);
  sigma ~ lognormal(0,1);
}
generated quantities {
  vector[NTest] logLike;
    for (i in 1:NTest) {
      logLike[i] = normal_lpdf(XTest[i] | mu,sigma);
    }
}

