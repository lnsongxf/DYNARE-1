/* From User Guide 3.4.1, the stochastic case

Endogenous variables: add z
Exogenous variables: add e
Parameters: add rho
Parameter values
*/

var y c k i l y l w r z;
varexo e;

parameters beta psi delta alpha rho sigma epsilon; 

alpha = 0.33;
beta = 0.99;
delta = 0.023;
psi = 1.75;
rho = 0.95;
sigma = (0.007/(1-alpha));
epsilon = 10;

/*
Model:
Euler equation of consumption
labor supply
accounting identity
production function
marginal cost of labor equal to markup equation
marginal cost of capital equal to markup equation
investment equality
"identity that may be useful"
law of motion of technology (added to the deterministic model)

There has to be an equal number of equations and endogenous variables!
Timing: when the variable decided
Blanchard-Kahnconditionsaremetonlyifthenumberofnon-predetermined variables equals the number of eigenvalues greater than one.
*/

model;
(1/c) = beta*(1/c(+1))*(1+r(+1)-delta); 
psi*c/(1-l) = w;
c+i = y;
y = (k(-1)^alpha)*(exp(z)*l)^(1-alpha); 
w = y*((epsilon-1)/epsilon)*(1-alpha)/l; 
r = y*((epsilon-1)/epsilon)*alpha/k(-1); 
i = k-(1-delta)*k(-1);
yl = y/l;
z = rho*z(-1)+e;
end;

/*
Specifying steady states and/or initial values

*/

