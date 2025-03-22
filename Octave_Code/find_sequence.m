function sequence = find_sequence(list)
    sequence = zeros(1, length(list));

    for i = 1:length(list)
        sequence(i) = 1/list(1,i) * log(list(2,i));
    endfor
endfunction
