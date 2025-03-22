function combined_groups = combine_cells(groups)
    padded_groups = pad_zeros(groups);

    bottom_row = zeros(1,length(padded_groups{1}));

    for i = 1:length(groups)
        bottom_row = bottom_row + padded_groups{i}(2,:);
    endfor

    combined_groups = vertcat([0:length(bottom_row)-1], bottom_row);


endfunction
