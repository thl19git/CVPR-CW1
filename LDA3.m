function LDA3(tac, pac, pdc, o1_mean, o2_mean, col1, col2)
    within_scatter = zeros(3,3);
    
    for n = 1:10
        o1_val = [tac(n) pac(n) pdc(n)];
        o2_val = [tac(10+n) pac(10+n) pdc(10+n)];
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
    scatter3(tac(1:10),pac(1:10),pdc(1:10),col1, 'filled');
    hold on
    grid on
    scatter3(tac(11:20),pac(11:20),pdc(11:20),col2, 'filled');
    xlabel("Temperature")
    ylabel("Vibrations")
    zlabel("Pressue")
    title("3d LDA")
    xlim([-3 3])
    ylim([-3 3])
    zlim([-3 3])
    if col1 == "red" %slight hack to create LDA planes - calculate intersections and plot patch
        z = [3 -3 -3 3];
        x = [3 3 -3 -3];
        y = (-plane(1)*x - plane(3)*z)/plane(2);
    else
        x = [3 -3 -3 3];
        y = [3 3 -3 -3];
        z = (-plane(1)*x - plane(2)*y)/plane(3);
    end
    patch(x,y,z,"black","FaceAlpha","0.2")

    standardized_data = [tac; pac; pdc];
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