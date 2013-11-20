function algo = simplex(M, c, b)
	rows = size(M, 1)
	columns = size(M, 2)
	
	B = M(:, 1:rows)
	N = M(:, rows+1:end)
	
	B_inv = B^-1
	x_B0 = (B_inv * b')'
	x_N0 = zeros(1, columns - rows)
	
	c_B = c(1:rows)
	c_N = c(rows+1:end)
	lambda = c_B * B_inv

	discriminant = c_N - lambda * N;
	if(all(discriminant >= 0))
		algo = [x_B0, x_N0];
		disp("Optimum found.");
		disp("Value: ");
		disp(c * algo');
		return;
	endif
	
	pivote_found = false
	for j = 1:columns-rows
		discriminant = c_N(j) - lambda * N(:, j)
		if(all(discriminant < 0))
			pivote_found = true
			break;
		endif
	endfor
	
	if(!pivote_found)
		error("j pivote not found!");
	endif
	
	D_j = B_inf * N(:,j);
	
	if(all(D_j <= 0))
		error("Not bounded.");
	endif
	
	discriminant = 0;
	for i = 1:rows
		if(D_j(i) <= 0)
			discriminant(i) = Inf;
		endif
		
		discriminant(i) = x_B0(i)/D_j(i);
	endfor
	
	[minimum, i_s] = min(discriminant);
	M_s = M;
	M_s(: [i_s, rows+j]) = M_s(: [rows+j, i_s])
	algo = simplex(M_s, c, b);
endfunction