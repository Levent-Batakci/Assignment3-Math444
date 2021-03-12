clear all

%Load Forest
load ForestSpectra.mat

I = Itype;

Xc = X - sum(X,2)/size(X,1) * ones(1,size(X,2)); %Center the data 
Q = LDA(X, I);
Z = Q' * X;

figure(1)
sgtitle("Data Projections on Pairs of Separating Directions", 'FontSize', 25)
subplot(2,2,1)
k1 = (I==1);
k2 = (I==2);
k3 = (I==3);
k4 = (I==4);
hold on
scatter(Z(1,k1), Z(2,k1), 'r');
scatter(Z(1,k2), Z(2,k2), 'g');
scatter(Z(1,k3), Z(2,k3), 'b');
scatter(Z(1,k4), Z(2,k4), 'k');
xlabel("Projection on First Separator");
ylabel("Projection on Second Separator");
set(gca,'FontSize', 20);
hold off

% figure(2)
subplot(2,2, 3)
hold on
scatter(Z(1,k1), Z(3,k1), 'r');
scatter(Z(1,k2), Z(3,k2), 'g');
scatter(Z(1,k3), Z(3,k3), 'b');
scatter(Z(1,k4), Z(3,k4), 'k');
xlabel("Projection on First Separator");
ylabel("Projection on Third Separator");
set(gca,'FontSize', 20);
hold off
% 
% 
% 
% figure(3)
subplot(2,2, 4)
hold on
scatter(Z(2,k1), Z(3,k1), 'r');
scatter(Z(2,k2), Z(3,k2), 'g');
scatter(Z(2,k3), Z(3,k3), 'b');
scatter(Z(2,k4), Z(3,k4), 'k');
xlabel("Projection on Second Separator");
ylabel("Projection on Third Separator");
set(gca,'FontSize', 20);
hold off
