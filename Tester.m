%Levent Batakci
%Test the stuff !

clear
clc
close all

%Parameters
k=3;

%Generate data
c1 = [-3 -3 -3]';
c2 = [2 0 0]';
c3 = [4 4 -6]';
Sigma = eye(3);
X = [mvnrnd(c1, Sigma, 200)' mvnrnd(c2, Sigma, 200)' mvnrnd(c3, Sigma, 200)'];
xc = sum(X,2)/600;
Xc = X - xc * ones(1, size(X,2));
I = [ones(1, 200) 2*ones(1, 200) 3*ones(1, 200)];
k = numel(unique(I));

Q = LDA(Xc, I);
for i= 1:k-1
    Q(:,i) = Q(:,i) / norm(Q(:,i)); 
end
Z = Q' * Xc;

figure(1)
p = 200;
hold on
scatter(Z(1,1:p), Z(2,1:p),250, 'r.');
scatter(Z(1,p+1:2*p), Z(2,p+1:2*p),250, 'g.');
scatter(Z(1,2*p+1:3*p), Z(2,2*p+1:3*p),250, 'b.');
sgtitle("Data Separation by LDA", 'FontSize', 25)
xlabel("Projection on First Separator");
ylabel("Projection on Second Separator");
legend("Centered at (-3,-3,-3)","Centered at (2,0,0)","Centered at (4,4,-6)")
set(gca,'FontSize', 20);
hold off

%Testing purposes
figure(2)
scatter3(X(1,:), X(2,:), X(3,:));