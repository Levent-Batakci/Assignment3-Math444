clear all

%Load Wine
load WineData.mat
k = numel(unique(I));
Xc = X - sum(X,2)/size(X,2) * ones(1,size(X,2));
Q = LDA(Xc, I);
for i= 1:k-1
    Q(:,i) = Q(:,i) / norm(Q(:,i)); 
end
Z = Q' * Xc;

figure(1)
k1 = (I'==1);
k2 = (I'==2);
k3 = (I'==3);
hold on
scatter(Z(1,k1), Z(2,k1),350, 'r.');
scatter(Z(1,k2), Z(2,k2),350, 'g.');
scatter(Z(1,k3), Z(2,k3),350, 'b.');
sgtitle("Data Separation by LDA", 'FontSize', 25)
xlabel("Projection on First Separator");
ylabel("Projection on Second Separator");
legend("Cultivar 1","Cultivar 2","Cultivar 3")
set(gca,'FontSize', 20);
hold off

%Remove insignificant components
perc = 0.1;
Q(abs(Q) <= perc^(1/2)) = 0;
Q(:,1)==0 & Q(:,2)==0
Xc(Q(:,1)==0 & Q(:,2)==0,:) = [];
Q = LDA(Xc, I);
for i= 1:size(Q,2)
    Q(:,i) = Q(:,i) / norm(Q(:,i)); 
end
Z = Q' * Xc;

figure(2)
hold on
scatter(Z(1,k1), Z(2,k1),250, 'r.');
scatter(Z(1,k2), Z(2,k2),250, 'g.');
scatter(Z(1,k3), Z(2,k3),250, 'b.');
sgtitle("Data Separation by LDA", 'FontSize', 25)
xlabel("Projection on First Separator");
ylabel("Projection on Second Separator");
legend("Cultivar 1","Cultivar 2","Cultivar 3")
set(gca,'FontSize', 20);
hold off