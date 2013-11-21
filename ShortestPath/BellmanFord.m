function A = BellmanFord(M, n)
    if (n == 1)
        A = M;
        return;
    endif
    N = tropicalpower(M, n);
    A = min(BellmanFord(M, n-1), N);
endfunction