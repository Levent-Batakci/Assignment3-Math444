clear all

%Load Iris
load WisconsinBreastCancerData_Unpacked.mat

X = Data_WCD_Matrix;
I = I_Label;
k = numel(unique(I));

Xc = X - sum(X,2)/size(X,2) * ones(1, size(X,2)); %Center the data
Q = LDA(Xc, I);
for i= 1:k-1
    Q(:,i) = Q(:,i) / norm(Q(:,i)); 
end
Z = Q' * Xc;

figure(1)
hold on
benign = Z(:,I==1);
malignant = Z(:,I==2);
histogram(benign,'NumBins', 20)
% sgtitle("LDA", 'FontSize', 30);
set(gca,'FontSize', 20)
histogram(malignant,'NumBins', 20)
xlabel("Projection onto Separator")
ylabel("Number of Data Points")
set(gca,'FontSize', 20)
legend("Benign", "Malignant");
hold off

%PCA !
[U,D,V] = svd(Xc);
pc1 = U(:,1)' * Xc;

figure(2)
hold on
histogram(abs(pc1(:,I==1)),'NumBins', 20)
histogram(abs(pc1(:,I==2)),'NumBins', 20)
xlabel("|PC 1|", 'FontSize', 30)
ylabel("Number of Data Points")
set(gca,'FontSize', 20)
legend("Benign", "Malignant");
hold off

%Remove insignificant components
perc = 0.1;
Q(abs(Q) <= perc^(1/2)) = 0;
Q
Q(:,1)==0
Xc(Q(:,1)==0,:) = [];
Q = LDA(Xc, I);
for i= 1:size(Q,2)
    Q(:,i) = Q(:,i) / norm(Q(:,i)); 
end
Z = Q' * Xc;

figure(3)
hold on
benign = Z(:,I==1);
malignant = Z(:,I==2);
histogram(benign,'NumBins', 20)
% sgtitle("LDA", 'FontSize', 30);
histogram(malignant,'NumBins', 20)
xlabel("Projection onto Separator")
ylabel("Number of Data Points")
set(gca,'FontSize', 20)
legend("Benign", "Malignant");

