%% 
% Section 1
% example dataset
dataset = [5.0 3.8; 6.5 5.9; 7.3 4.0; 9.2 6.8; 10.8 7.5; 10.9 7.0;...
    12.8 10.11; 14.9 12.0; 18.9 17.0; 21.3 17.9]

%% 
% Section 2
% Extract independent variable 'X' and dependent variable 'y' from the
% dataset
X = dataset(:, 1)
y = dataset(:, 2)

%%
% Section 3
% Visualise the data
figure;
plot(X,y, 'o', 'MarkerSize', 8, 'MarkerEdgeColor','b',...
    'MarkerFaceColor', 'b');
title("Visualising the data");
% specify the label for the axis
xlabel("Independent variable X");
ylabel("Dependent variable y");
% specify the axis limit
axis([0 25 0 25]);

%%
% Section 4
% Understanding the hypothesis - 
% It is an equation that would best fit our dataset.
% It is the unknown

% Hypothesis is defined by theta,
% In univariate linear regression there are two theta,
% theta0 - which gives the y intercept of the hypothesis
% theta1 - which gives the slope of the hypothesis

% The goal is to find the hypothesis that would minimize the average
% squared error

% The equation is of the form
% hi = theta0 + theta1*xi - it is the equation for a straight line
% calculated at the given xi points of the dataset

% let us assume a value for theta0 and theta1,
theta0 = 0;
theta1 = 1;

% this is one of the infinite number of hypothesis possible
h = theta0 + theta1*X % hi represent a single point of vector h

%%
% Section 5
% Plot the hypothesis
hold on;
plot(X, h, 'r*-', 'MarkerSize', 12, 'LineWidth', 1);
legend("yi", "hi", 'Location', 'southeast');
% hold off

%%
% Section 6
% Understanding the error / cost function
% as stated above the best hypothesis is the one that gives minimum error

% Each hypothesis equation will have some value of error
% which means every pair of theta0 and theta1 gives us a hypothesis
% and there will be some error in this hypothesis with respect to the real
% dataset

% But first we need to define what is the error
% For linear regression the error is the average of the squared error
% i.e. calculate the error between yi and hi at each xi, square the error
% and then divide it by the total number of datapoints in the dataset

delta1 = h(1) - y(1)
delta2 = h(2) - y(2)
% and so on...
% but it is easier to solve this as a matrix
delta = h - y % each value of y is subtracted from corresponding value of h

% second step is to square each value of delta
delta_square = delta.^2

% sum all the delta squares
square_sum = sum(delta_square)

% find the number of datapoints in the dataset
m = length(X);

% Find the cost function
cost = square_sum/(2*m) % the 2 is added here to make calculations easy
% for the later steps of the algorithm

%%
% Section 7
% Lets plot multiple hypothesis on the same graph
theta0_2 = 0.5;
theta1_2 = 0.8;
h_2 = theta0_2 + theta1_2*X
plot(X, h_2, 'g*-', 'MarkerSize', 10);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta0_3 = -0.5;
theta1_3 = 1.2;
h_3 = theta0_3 + theta1_3*X
plot(X, h_3, 'm*-', 'MarkerSize', 10);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta0_4 = 3;
theta1_4 = 0.2;
h_4 = theta0_4 + theta1_4*X
plot(X, h_4, '*-', 'MarkerSize', 10, 'Color',[0.9,0.2,0]);

legend(["original values", "first hypothesis", "second hypothesis",...
    "third hypothesis", "fourth hypothesis"], 'Location', 'northwest');

%%
% Section 8
% Cost function as a function of theta1 only where theta0 is set to 0
% Using the computeCost function to compute the cost for different values
% of theta

% update the matrix X so that we can use the computeCost function
X = [ones(m,1),dataset(:,1)]; % Add a column of ones to X

% let us define a new matrix thetas, where each row represents a pair of -
% theta0 and theta1

% to simplify, initialise the theta0's to 0's
theta_1s = -0.6:.2:2.2;
thetas = [zeros(length(theta_1s),1),theta_1s'];

% thetas = [0 1; 0.5 0.8; -0.5 1.2; 3 0.2];
for i = 1:size(thetas, 1)
    ith_theta = thetas(i,:)';
    cost(i) = computeCost(X,y,ith_theta);
end

% plot the values of the costs
figure;
plot(thetas(:,2), cost, 's', 'MarkerEdgeColor','r',...
    'MarkerFaceColor', 'r')

%%
% Section 9
% Cost function as a function of theta0 and theta1

theta_0s = 2.2:-0.2:-0.6;
new_thetas = [theta_0s', theta_1s'];
new_cost = zeros(size(new_thetas, 1),1);

for i = 1:size(new_thetas, 1)
    ith_theta = new_thetas(i,:)';
    new_cost(i) = computeCost(X,y,ith_theta);
end

% plot the values of the costs
figure;
scatter3(new_thetas(:,1),new_thetas(:,2), new_cost)

%%
% Section 10
% a more complex graph

lower_limit = -2.0;
upper_limit = 4.0;
rand_theta0 = (upper_limit-lower_limit).*rand(2000,1) + lower_limit;
rand_theta1 = (upper_limit-lower_limit).*rand(2000,1) + lower_limit;
rand_thetas = [rand_theta0, rand_theta1];
rand_cost = zeros(size(rand_thetas, 1),1);

for i = 1:size(rand_thetas, 1)
    ith_theta = rand_thetas(i,:)';
    rand_cost(i) = computeCost(X,y,ith_theta);
end

% plot the values of the costs
figure;
scatter3(rand_thetas(:,1),rand_thetas(:,2), rand_cost, 'filled')






