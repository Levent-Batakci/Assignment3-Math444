function Q = LDA(X, I, k)
%LDA returns the leading directions to project the data

    %Get the dimensions
    [n, p] = size(X);
    P = zeros(1,k); %Number of elements per cluster
    for i = 1:k
        P(1,i) = nnz(I == i);
    end

    %Compute the group centers
    C = getCenters(X, I, k);
    c0 = sum(X, 2) / p; %Get the overall center
    Xc = X - c0 * ones(1, p);
    
    %Compute the within cluster scatter
    Sw = zeros(n, n); %Within cluster scatter
    for i = 1:k
        Xi = X(:, I==i) - C(1,i) * ones(1, nnz(I==i));
        Sw = Sw + Xi*Xi';
    end
    
    %Adjust Sw
    [U, D, V] = svd(Sw);
    d1 = D(1,1);
    eps = 10e-10 * d1;
    Sw = U * diag(diag(D) + eps) * V';
    %Sw = Sw + eps * eye(n); 
    
    %Compute Sb, the between-cluster scatter matrix
    Sb = Xc * Xc';
    
    %Compute the Cholesky factorization of Sw,eps
    K = chol(Sw);
    
   [W, D] = eigs(inv(K)' * Sb * inv(K), k-1);
    
   Q = K \ W;
end

