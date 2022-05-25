data {
  int N;
  real X[N];
}
parameters {
  real mu;
  real<lower=0> sigma;
  real<lower=0> nu;
}
model {
  X ~ student_t(nu,mu,sigma);
  mu ~ normal(0,1);
  sigma ~ lognormal(0,1);
  nu ~ lognormal(0,1);
}
generated quantities {
  vector[N] logLike;
    for (i in 1:N) {
      logLike[i] = student_t_lpdf(X[i] |nu, mu,sigma);
    }
}


