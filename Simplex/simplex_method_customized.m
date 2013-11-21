function [x, M, b, basis] = simplex_method_customized(M, b, c, maximize = false)
	M_aux = [M [1 zeros(1, size(M, 1) - 1)]']
	c_aux = [zeros(1, size(M, 2)) 1]
	basis_aux = (1:size(M,1)) + size(M, 2) - size(M, 1) + 1
	[x, M_f, b_f, basis_f, value] = simplex(M_aux, b, c_aux, basis_aux)
	if(maximize)
		c = -c;
	endif
	disp("feasible solution found, starting to optimize solution.");
	[x, M, b, basis, value] = simplex(M_f(:, 1:size(M, 2)), b_f, c, basis_f);
	
	if(maximize)
		value = -value;
	endif
	
	disp("optimum value:");
	disp(value);
endfunction