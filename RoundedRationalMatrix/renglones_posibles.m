function M = renglones_posibles(l, c)
	if(c == 0)
		M = zeros(1, l);
		return;
	endif
	
	if(l == c)
		M = ones(1, c);
		return;
	endif
	
	A = renglones_posibles(l-1, c-1);
	a = size(A, 1);
	A = [ones(a, 1), A];
	
	B = renglones_posibles(l-1, c);
	b = size(B, 1);
    B = [zeros(b, 1), B];
	
	M = [A; B];
endfunction