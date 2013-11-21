function A = tropicalpower(M, n)
    if (n == 1)
        A = M;
        return;
    endif
    
    A = tropicalproduct(tropicalpower(M, n-1), M);
endfunction