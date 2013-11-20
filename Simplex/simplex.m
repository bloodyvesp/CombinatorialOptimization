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
	if(all(discriminant))
		disp("Optimum found");
		algo = [x_B0, x_N0];
	endif
endfunction