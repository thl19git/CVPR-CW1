function LDA3(tdc, pac, pdc, o1_mean, o2_mean, col1, col2)
    within_scatter = zeros(3,3);
    
    for n = 1:10
        o1_val = [tdc(n) pac(n) pdc(n)];
        o2_val = [tdc(10+n) pac(10+n) pdc(10+n)];
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
    
    ld1_line = sorted_eigenvectors(:,1);
    ld2_line = sorted_eigenvectors(:,2);

    plane = cross(ld1_line, ld2_line);

    nexttile
    scatter3(tdc(1:10),pac(1:10),pdc(1:10),col1, 'filled');
    hold on
    grid on
    scatter3(tdc(11:20),pac(11:20),pdc(11:20),col2, 'filled');
    xlabel("Temperature")
    ylabel("Vibrations")
    zlabel("Pressue")
    title("3d LDA")
    % TODO: Plot plane (not sure how we do this atm)
    [x, y] = meshgrid(-2:1:2);
    z = (-plane(1)*x - plane(2)*y)/plane(3);
    surf(x,y,z, "FaceAlpha","0.2", "FaceColor","black");

    standardized_data = [tdc; pac; pdc];
    two_d_data = [ld1_line ld2_line]' * standardized_data;
    
    nexttile
    scatter(two_d_data(1,1:10),two_d_data(2,1:10),col1,"filled");
    hold on
    scatter(two_d_data(1,11:20),two_d_data(2,11:20),col2,"filled");
    line([0 0], [-2 2], "LineStyle","--")
    xlabel("LD 1")
    ylabel("LD 2")
    title("LDA - 3d to 2d")
    
    one_d_data = ld1_line' * standardized_data;
    
    nexttile
    scatter(one_d_data(1:10),zeros(10),col1,"filled")
    hold on
    grid on
    scatter(one_d_data(11:20),zeros(10),col2,"filled")
    line([0 0], [-1 1], "LineStyle","--")
    title("LDA - 3d to 1d")
    yticks(0)
    yticklabels({'LD1'})
end