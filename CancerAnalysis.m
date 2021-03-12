clear all

%Load Iris
load WisconsinBreastCancerData_Unpacked.mat

X = Data_WCD_Matrix;
I = I_Label;

Xc = X - sum(X,2)/size(X,2) * ones(1, size(X,2)); %Center the data
Q = LDA(Xc, I)
Z = Q' * Xc;

figure(1)
benign = Z(:,I==1);
malignant = Z(:,I==2);
histogram(benign);
sgtitle("Benign");
figure(2)
histogram(malignant);
sgtitle("Malignant");