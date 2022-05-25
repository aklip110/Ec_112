data {
  int NTest;
  int NTrain;
  real XTrain[NTrain];
  real XTest[NTest];
}
parameters {
  real mu;
  real<lower=0> sigma;
  real<lower=0> nu;
}
model {
  XTrain ~ student_t(nu,mu,sigma);
  mu ~ normal(0,1);
  sigma ~ lognormal(0,1);
  nu ~ lognormal(0,1);
}
generated quantities {
  vector[NTest] logLike;
    for (i in 1:NTest) {
      logLike[i] = student_t_lpdf(XTest[i] |nu, mu,sigma);
    }
}



