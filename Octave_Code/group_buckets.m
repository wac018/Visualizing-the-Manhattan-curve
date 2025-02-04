function groups = group_buckets(ls)
	max_n = floor(max(ls));
	ns = [0: max_n];
	tally = zeros(1, max_n + 1);
	for i = [1:columns(ls)]
		l = ls(i);
		if l == 0
			tally(1) = tally(1) + 1;
		else
			tally(floor(ls(i)) + 1) = tally(floor(ls(i)) + 1) + 1;
		endif
	endfor

	groups = vertcat(ns, tally);
endfunction
