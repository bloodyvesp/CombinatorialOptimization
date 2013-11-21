function A = tropicalproduct(M, N)
    if (size(M, 2) != size(N, 1))
        error("Non conformant matrix");
    endif
    
    n = size(M, 1);
    m = size(N, 2);
    
    A = 0;
    for i = 1:n
        for j = 1:m
            A(i, j) = min(M(i, :) + N(:, j)');
        endfor
    endfor
endfunction