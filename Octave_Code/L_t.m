function l = L_t(M)
	s = svd(M);
	l = log(max(s)/min(s));
endfunction
