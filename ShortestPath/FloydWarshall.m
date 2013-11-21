function A = FloydWarshall(M, d)
	if (d == 0)
		A = M;
		return;
	endif
	B = FloydWarshall(M, d-1);
	
	n = size(M, 1);
	m = size(M, 2);
	for i = 1:n
		for i = 1:m
			SubMatrix = (M, d, n, m);
			MinDistancesSubGraph = mindistances(SubMatrix);
			error("Inconclusive...");
		endfor
	endfor
endfunction