%% Uni-variate Linear Regression

% Load and Visualise Data

% load the dataset from the data file into the variables X and y
data = load('ex1data1.txt'); % read comma separated data
X = data(:, 1); y = data(:, 2);

% plot the data
plotData(X,y)

% Gradient Descent

% initialise the variables
m = length(X); % number of training examples
X = [ones(m,1),data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters
iterations = 1500;
alpha = 0.01;

% Compute and display initial cost with theta all zeros
cost0 = computeCost(X, y, theta);
fprintf('\nComputed cost for theta as zero: %f\n',cost0);

% Compute and display initial cost with non-zero theta
cost1 = computeCost(X, y,[-1; 2]);
fprintf('\nComputed cost for non-zero theta: %f\n',cost1);

% Run gradient descent:
% Compute theta
theta = gradientDescent(X, y, theta, alpha, iterations);

% Print theta to screen
% Display gradient descent's result
fprintf('\nTheta computed from gradient descent:\n%f,\n%f\n',theta(1),theta(2))

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict Output From Calculated Theta

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('\nFor population = 35,000, we predict a profit of %f\n', predict1*10000);
predict2 = [1, 7] * theta;
fprintf('\nFor population = 70,000, we predict a profit of %f\n', predict2*10000);

% Visualise Cost Function

% Visualizing J(theta_0, theta_1):
% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';

% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
hold off;

%% Multi-variate Linear Regression

% Load Data

data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
% First 10 examples from the dataset
fprintf('\nDislay first 10 examples from the dataset\n')
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

% Feature Normalisation

% Scale features and set them to zero mean
[X, mu, sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

% Gradient Descent

% Run gradient descent
% Choose some alpha value
alpha = 0.1;
num_iters = 400;

% Init Theta and Run Gradient Descent
theta = zeros(3, 1);
[theta, ~] = gradientDescent(X, y, theta, alpha, num_iters);

% Display gradient descent's result
fprintf('\nTheta computed from gradient descent:\n%f\n%f\n%f\n',theta(1),theta(2),theta(3))

% Prediction

% Estimate the price of a 1650 sq-ft, 3 br houses
predict_feature = [1650, 3];
% Scale features and set them to zero mean
predict_feature_norm = (predict_feature - mu)./sigma;
predict_feature_norm = [1, predict_feature_norm];

price = predict_feature_norm*theta; % Enter your price formula here

fprintf('\nPredicted price of a 1650 sq-ft, 3 br house (using gradient descent):\n $%f\n', price);

% Hyper-parameter Selection

% Run gradient descent:
% Choose some value for alpha & num_iters
alpha = 1; % you can try different values of alpha
num_iters = 100;

% Init Theta and Run Gradient Descent
theta = zeros(3, 1);
[~, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

% Plot the convergence graph
plot(1:num_iters, J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Run gradient descent
% Replace the value of alpha below best alpha value you found above
alpha = 1;
num_iters = 400;

% Init Theta and Run Gradient Descent
theta = zeros(3, 1);
[theta, ~] = gradientDescent(X, y, theta, alpha, num_iters);

% Display gradient descent's result
fprintf('\nTheta computed from gradient descent:\n%f\n%f\n%f\n',theta(1),theta(2),theta(3))

%% Normal Equation

% Solve with normal equations:
% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('\nTheta computed from the normal equations:\n%f\n%f\n%f\n', theta(1),theta(2),theta(3));

% Estimate the price of a 1650 sq-ft, 3 br house.
predict_for = [1 1650 3];
price = predict_for * theta; % Enter your price forumla here

fprintf('\nPredicted price of a 1650 sq-ft, 3 br house (using normal equations):\n $%f\n', price);
