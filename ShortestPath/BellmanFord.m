function [predecessor, distance] = BellmanFord(M, v)
	n = size(M,2);
	distance = repmat(Inf, 1, n);
	predecessor = zeros(1, n);
	distance(v) = 0;
	
	for k = 1:(n-1)
		for i = 1:n
			for j = 1:n
				w = M(i, j);
				
				if(w == 0)
					continue;
				endif
				
				if (distance(i) + w < distance(j))
					distance(j) = distance(i) + w;
					predecessor(j) = i;
				endif
			endfor
		endfor	
	endfor
	
	for i = 1:n
		for j = 1:n
			w = M(i, j);
			
			if(w == 0)
				continue;
			endif

			if (distance(i) + w < distance(j))
				error("Negative loop!");
			endif
		endfor
	endfor	
endfunction