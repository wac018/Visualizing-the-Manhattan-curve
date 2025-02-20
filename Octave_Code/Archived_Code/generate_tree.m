function tree = generate_tree(adj_mat, starting_matrix)
    % adj_mat = The adjacency matrix that represents the tree
    % starting_matrix : the index of the reflection matrix that starts the tree


    branches = cell(1, columns(adj_mat));

    for row = 1:rows(adj_mat)
        current_row = adj_mat(row,:);

        i = row;
        while !isfinite(current_row(i))
            if i >= columns(current_row)
                break;
            endif
            i = i + 1;
        endwhile
        if i <= columns(current_row) - 1
            branches{row} = make_tree(i, i+1, NA, NA, adj_mat(row, i), adj_mat(row, i+1));
        else
            branches{row} = make_tree(NA, NA, NA, NA, NA, NA);
        endif
    endfor

    for i = [1:columns(branches)]
        lnode = branches{i}.lnode;
        rnode = branches{i}.rnode;

        if !isna(lnode)
            branches{i}.lbranch = branches{lnode};
        endif

        if !isna(rnode)
            branches{i}.rbranch = branches{rnode};
        endif
    endfor

    tree = make_tree(1, NA, branches{1}, NA, starting_matrix, NA);

    elapsed_time = etime (clock (), t0)

endfunction


function tree = make_tree(lnode, rnode, lbranch, rbranch, lmat, rmat)
    tree = struct("lnode", lnode, "rnode", rnode, "lbranch", lbranch, "rbranch", rbranch, "lmat", lmat, "rmat", rmat);
endfunction
