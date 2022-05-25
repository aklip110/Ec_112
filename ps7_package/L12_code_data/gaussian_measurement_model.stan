data {
  int N; // number obs
  real y[N]; // data measurements
  
}
parameters {
  real mu; // population mean
  real<lower=0> sigma; //population sd
}
model {
  //for (i in 1:N) {
  //  y[i] ~ normal(mu,sigma); // likelihood
  //}
  y ~ normal(mu,sigma);
  mu ~ normal(1.5,0.1); // prior for mu
  sigma ~ gamma(1,1); // prior for sigma
}

