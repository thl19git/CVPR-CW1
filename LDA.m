function LDA(v1_o1_mean, v1_o2_mean, v2_o1_mean, v2_o2_mean, v1, v2, col1, col2, v1name, v2name)
    o1_mean = [v1_o1_mean v2_o1_mean];
    o2_mean = [v1_o2_mean v2_o2_mean];
    
    within_scatter = zeros(2,2);
    
    for n = 1:10
        o1_val = [v1(n) v2(n)];
        o2_val = [v1(10+n) v2(10+n)];
        within_scatter = within_scatter + ((o1_val - o1_mean)' * (o1_val - o1_mean));
        within_scatter = within_scatter + ((o2_val - o2_mean)' * (o2_val - o2_mean));
    end
    
    between_scatter = (o1_mean - o2_mean)' * (o1_mean - o2_mean);
    
    mat = within_scatter \ between_scatter;
    
    [eigenvectors, eigenvalues] = eig(mat);
    eigenvalue_array = diag(eigenvalues);
    
    % Sort eigenvectors and eigenvalues
    [sorted_eigenvalues, indices] = sort(eigenvalue_array, 'descend');
    sorted_eigenvectors = eigenvectors(:, indices);
    
    ld_line = sorted_eigenvectors(:,1);
    
    nexttile
    scatter(v1(1:10),v2(1:10),col1, 'filled');
    grid on
    hold on
    scatter(v1(11:20),v2(11:20), col2, "filled");
    ylim([-3 3])
    xlim([-3 3])
    x = [-3 3];
    y = ((ld_line(2) / ld_line(1)) * x);
    plot(x,y)
    divisor = (-(ld_line(1) / ld_line(2)) * x);
    plot(x,divisor,"LineStyle","--")
    xlabel(v1name)
    ylabel(v2name)
    title('LDA - '+ v1name + ' and ' + v2name)
    
    nexttile
    standardized_data = [v1; v2];
    one_d_data = ld_line' * standardized_data;
    scatter(one_d_data(1,1:10), zeros(10), col1,"filled")
    grid on
    hold on
    scatter(one_d_data(1,11:20), zeros(10), col2,"filled")
    line([0 0], [-1 1], "LineStyle","--")
    title('LDA - '+ v1name + ' and ' + v2name + " - 1d")
    yticks(0)
    yticklabels({'LD1'})
end