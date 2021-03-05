%Levent Batakci
%Test the stuff !

clear
clc
close all

%Parameters
k=3;

%Generate data
c1 = [-3 -3 -3]' * ones(1, 200);
c2 = [2 0 0]' * ones(1, 200);
c3 = [4 4 -6]' * ones(1, 200);
dev = [1 1 1]' * ones(1, 200);
X = [normrnd(c1, dev) normrnd(c2, dev) normrnd(c3, dev)];
I = [ones(1, 200) 2*ones(1, 200) 3*ones(1, 200)];

Q = LDA(X, I, k)

Z = Q' * X;

figure(1)
p = 200;
hold on
scatter(Z(1,1:p), Z(2,1:p), 'r');
scatter(Z(1,p+1:2*p), Z(2,p+1:2*p), 'g');
scatter(Z(1,2*p+1:3*p), Z(2,2*p+1:3*p), 'b');
hold off

figure(2)
scatter3(X(1,:), X(2,:), X(3,:));