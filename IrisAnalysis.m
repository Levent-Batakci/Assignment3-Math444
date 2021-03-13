clear all

%Load Iris
load IrisData.mat
Xc = X - sum(X,2)/size(X,2) * ones(1, size(X,2)); %Center the data
I = [1 * ones(1, 50) 2 * ones(1, 50) 3 * ones(1, 50)];
k = numel(unique(I));
Q = LDA(Xc, I);
for i= 1:k-1
    Q(:,i) = Q(:,i) / norm(Q(:,i)); 
end
Z = Q' * Xc;

figure(1)
k1 = (I==1);
k2 = (I==2);
k3 = (I==3);
hold on
scatter(Z(1,k1), Z(2,k1),250, 'r.');
scatter(Z(1,k2), Z(2,k2),250, 'g.');
scatter(Z(1,k3), Z(2,k3),250, 'b.');
sgtitle("Data Separation by LDA", 'FontSize', 25)
xlabel("Projection on First Separator");
ylabel("Projection on Second Separator");
legend("Iris Setosa","Iris Versicolor","Iris Virginica");
set(gca,'FontSize', 20);
hold off

%PCA!!
figure(2)
[U,V,D] = svd(Xc);
Z = [U(:,1) U(:,2)]' * Xc;
hold on
scatter(Z(1,k1), Z(2,k1),250, 'r.');
scatter(Z(1,k2), Z(2,k2),250, 'g.');
scatter(Z(1,k3), Z(2,k3),250, 'b.');
sgtitle("First 2 Principal Components (PC) of Data", 'FontSize', 25)
xlabel("PC 1");
ylabel("PC 2");
legend("Iris Setosa","Iris Versicolor","Iris Virginica");
set(gca,'FontSize', 20);
hold off
