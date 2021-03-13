clear all

%Load Forest
load ForestSpectra.mat

I = Itype;
k = numel(unique(I));

Xc = X - sum(X,2)/size(X,2) * ones(1,size(X,2)); %Center the data 
Q = LDA(Xc, I);
for i= 1:k-1
    Q(:,i) = Q(:,i) / norm(Q(:,i)); 
end
Z = Q' * Xc;

figure(1)
sgtitle("Data Projections on Pairs of Separating Directions", 'FontSize', 25)
subplot(1,3,1)
k1 = (I==1);
k2 = (I==2);
k3 = (I==3);
k4 = (I==4);
hold on
scatter(Z(1,k1), Z(2,k1), 350, 'r.');
scatter(Z(1,k2), Z(2,k2), 350, 'g.');
scatter(Z(1,k3), Z(2,k3), 350, 'b.');
scatter(Z(1,k4), Z(2,k4), 350, 'k.');
xlabel("Projection on First Separator");
ylabel("Projection on Second Separator");
set(gca,'FontSize', 20);
legend("Pine","Birch","Fir","Shrub");
hold off

% figure(2)
subplot(1,3, 2)
hold on
scatter(Z(1,k1), Z(3,k1), 350, 'r.');
scatter(Z(1,k2), Z(3,k2), 350, 'g.');
scatter(Z(1,k3), Z(3,k3), 350, 'b.');
scatter(Z(1,k4), Z(3,k4), 350, 'k.');
xlabel("Projection on First Separator");
ylabel("Projection on Third Separator");
set(gca,'FontSize', 20);
legend("Pine","Birch","Fir","Shrub");
hold off
% 
% 
% 
% figure(3)
subplot(1,3, 3)
hold on
scatter(Z(2,k1), Z(3,k1), 350, 'r.');
scatter(Z(2,k2), Z(3,k2), 350, 'g.');
scatter(Z(2,k3), Z(3,k3), 350, 'b.');
scatter(Z(2,k4), Z(3,k4), 350, 'k.');
xlabel("Projection on Second Separator");
ylabel("Projection on Third Separator");
set(gca,'FontSize', 20);
legend("Pine","Birch","Fir","Shrub");
hold off
