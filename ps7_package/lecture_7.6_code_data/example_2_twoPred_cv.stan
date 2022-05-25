data {
  int NTest;
  int NTrain;
  matrix[NTrain,2] XTrain;
  matrix[NTest,2] XTest;
  real YTrain[NTrain];
  real YTest[NTest];
}
parameters {
  real beta0;
  real beta1;
  real beta2;
  real<lower=0> sigma;
}
model {
  for (i in 1:NTrain) {
    YTrain[i] ~ normal(beta0 + beta1 * XTrain[i,1] + beta2 * XTrain[i,2],sigma);
  }
  beta0 ~ normal(0,1);
  beta1 ~ normal(0,1);
  beta2 ~ normal(0,1);
  sigma ~ lognormal(0,1);
}
generated quantities {
  vector[NTest] logLike;
    for (i in 1:NTest) {
      logLike[i] = normal_lpdf(YTest[i] | beta0 + beta1 * XTest[i,1] + beta2 * XTest[i,2],sigma);
    }
}

