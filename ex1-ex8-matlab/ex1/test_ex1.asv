data = load('ex1data1.txt'); % read comma separated data
data = sortrows(data)
X = data(:, 1); y = data(:, 2);
plot(X, y, 'rx', 'MarkerSize', 10); % Plot the data
ylabel('Profit in $10,000s'); % Set the y-axis label
xlabel('Population of City in 10,000s'); % Set the x-axis label
theta = [0 1];

m = length(X); % number of training examples

X = [ones(m,1),data(:,1)]; % Add a column of ones to x

h_theta_x = X*theta';
figure;
plot(X(:,2), h_theta_x);

