close all

%Load Iris
load IrisData.mat
Xc = X - sum(X,2)/size(X,2) * ones(1, size(X,2)); %Center the data
I = [1 * ones(1, 50) 2 * ones(1, 50) 3 * ones(1, 50)];
Q = LDA(X, I, k)
Z = Q' * X;

figure(1)
k1 = (I==1);
k2 = (I==2);
k3 = (I==3);
hold on
scatter(Z(1,k1), Z(2,k1), 'r');
scatter(Z(1,k2), Z(2,k2), 'g');
scatter(Z(1,k3), Z(2,k3), 'b');
hold off