function A = ShortestPathWithTropicalRing(M, n)
    if (n == 1)
        A = M;
        return;
    endif
    N = tropicalpower(M, n);
    A = min(ShortestPathWithTropicalRing(M, n-1), N);
endfunction