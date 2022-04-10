%%
% Section 1
% Gradient Descent is one of the optimization algorithm

% Mathematical optimization or mathematical programming is the selection
% of a best element, with regard to some criterion,
% from some set of available alternatives.

% In our case we need to find the hypothesis that best fits our dataset.
% i.e. find the best value of a theta0 and theta1 pair such that the cost
% function is minimum.

% Terms used in optimization are - Objective function, variables &
% constraints

% Objective - Min J(theta) or J(theta0, theta1)
% Variables - theta0 and theta1

% As we saw in previous exercise,
% J(theta) is a convex function for linear regression
% => That it has only one minimum & that is the global minimum

% Steps for Gradient Descent

% 1). Randomly initialise theta0 and theta1 to some value
% 2). Update the theta values.
%   new_theta0 = old_theta0 - alpha*(partial derivative of J(theta) wrt
%   theta0)
%   new_theta1 = old_theta1 - alpha*(partial derivative of J(theta) wrt
%   theta1)
%       where, J(theta) => cost function
%              alpha => learning rate
%              partial derivatives are equations that are given in the
%              course
% 3). Repeat until slope = 0, if convex function is seen as a bowl then
% slope = 0 means that you reached the bottom of the bowl

% Above are the theoretical steps to find the gradient descent.

% In real life situations, it is not always possible to find the slope of
% the objective function and check if its 0 or not.
% Therefore, different stopping conditions can be used - 
% 1).The easiest one is to run the alogirthm for a given #iterations.
% 2).We can stop when the difference between two consecutive values of the 
% cost function (objective function) is less than a given value.
% i.e. J_n - J_n+1 < epsilon.

% Gradient Descent for Linear Regression




