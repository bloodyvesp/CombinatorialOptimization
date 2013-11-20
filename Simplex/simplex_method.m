function [x, M, b, basis] = simplex_method(M, b, c, maximize = false)
	M_aux = [M eye(size(M, 1))]
	c_aux = [zeros(1, size(M, 2)) ones(1, size(M, 1))]
	basis_aux = (1:size(M,1)) + size(M, 2)
	[x, M_f, b_f, basis_f, value] = simplex(M_aux, b, c_aux, basis_aux)
	if(maximize)
		c = -c;
	endif
	disp("feasible solution found, starting to optimize optimum solution.");
	[x, M, b, basis, value] = simplex(M_f(:, 1:size(M, 2)), b_f, c, basis_f);
	
	if(maximize)
		value = -value;
	endif
	
	disp("optimum value:");
	disp(value);
endfunction