clc
clf
close all

%Load Wine
load WineData.mat
Xc = X - sum(X,2)/size(X,1) * ones(1,size(X,2));
Q = LDA(Xc, I, k)
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