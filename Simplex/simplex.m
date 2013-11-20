function [x, M, b, basis] = simplex(M, b, c, basis, current_value = 0, counter = 0)
	if(counter == 0)
		disp("starting!")
		disp("*******************************************");
	else
		printf("iteration %d\n", counter + 1);
	endif
	
	rows = size(M, 1);
	columns = size(M, 2);
	c
	b
	current_value
	
	basis
	basis_complement = setdiff(1:columns, basis)
	M
	B = M(:, basis)
	N = M(:, basis_complement)
	
	B_inv = B^-1


	x = zeros(1, columns);
	x(basis) = (B_inv * b')';
	b = x(basis);
	
	lambda = c(basis) * B_inv

	reduced_cost = zeros(1, columns);
	reduced_cost(basis_complement) = c(basis_complement) - lambda *  M(:, basis_complement);
	reduced_cost
	value = x * c' + current_value
	if(all(reduced_cost(basis_complement) >= 0))
		disp("Optimum found.");
		disp("Value: ");
		disp(value);		
		M = B_inv*M;
		return;
	endif
	
	pivote_found = false;
	for j = basis_complement;
		discriminant = c(j) - lambda * M(:, j);
		if(discriminant < 0)
			pivote_found = true;
			disp("enters column:");
			j
			break;
		endif
	endfor
	
	if(!pivote_found)
		error("j pivote not found!");
	endif
	
	D_j = B_inv * M(:,j);
	
	if(all(D_j <= 0))
		error("Not bounded.");
		disp("current x:");
		x
		disp("current basis:");
		basis
		disp("unbounded ray:");
		D_j
	endif
	
	discriminant = 0;
	for i = 1:size(basis, 2)
		if(D_j(i) <= 0)
			discriminant(i) = Inf;
			continue;
		endif
		
		discriminant(i) = x(basis(i))/D_j(i);
	endfor
	
	[minimum, i_s] = min(discriminant);
	disp("exits column:");
	i_s = basis(i_s)
	new_basis = basis;
	new_basis(new_basis == i_s) = j;
	new_basis = sort(new_basis);
	counter
	disp("--------------------------------------------------");
	[x, M, b, basis] = simplex(B_inv*M, x(basis), reduced_cost, new_basis, value, counter + 1);
endfunction