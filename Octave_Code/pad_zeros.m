function new_list = pad_zeros(list)
	max_n = 0;

	for i = 1:length(list)
		max_n = max(max_n, max(length(list{i})));
	endfor

	new_list = cell(1, length(list));

	for i = 1:length(list)
		current_list = list{i};
		if length(current_list) < max_n
			bottom_row = horzcat(list{i}(2,:),  zeros(1,max_n - length(list{i})));
			new_list{i} = vertcat([1:max_n], bottom_row);
		else
			new_list{i} = list{i};
		endif
	endfor
endfunction
