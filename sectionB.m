% ----- QUESTION 1 ----- %
load('F0_PVT.mat')

% standardize data (mean = 0, std = 1) for each variable
tdc_standardized = normalize([acrylic_pvt.tdc black_foam_pvt.tdc car_sponge_pvt.tdc flour_sack_pvt.tdc kitchen_sponge_pvt.tdc steel_vase_pvt.tdc]);
pac_standardized = normalize([acrylic_pvt.pac black_foam_pvt.pac car_sponge_pvt.pac flour_sack_pvt.pac kitchen_sponge_pvt.pac steel_vase_pvt.pac]);
pdc_standardized = normalize([acrylic_pvt.pdc black_foam_pvt.pdc car_sponge_pvt.pdc flour_sack_pvt.pdc kitchen_sponge_pvt.pdc steel_vase_pvt.pdc]);

acrylic_std = toStandardizedStruct(tdc_standardized, pac_standardized, pdc_standardized, 1, 10);
black_foam_std = toStandardizedStruct(tdc_standardized, pac_standardized, pdc_standardized, 11, 20);
car_sponge_std = toStandardizedStruct(tdc_standardized, pac_standardized, pdc_standardized, 21, 30);
flour_sack_std = toStandardizedStruct(tdc_standardized, pac_standardized, pdc_standardized, 31, 40);
kitchen_sponge_std = toStandardizedStruct(tdc_standardized, pac_standardized, pdc_standardized, 41, 50);
steel_vase_std = toStandardizedStruct(tdc_standardized, pac_standardized, pdc_standardized, 51, 60);

standardized_data = [tdc_standardized; pac_standardized; pdc_standardized]';

pvt_cov = cov(standardized_data);
[pvt_cov_eigenvectors, pvt_cov_eigenvalues] = eig(pvt_cov);
eigenvalue_array = diag(pvt_cov_eigenvalues);

% Sort eigenvectors and eigenvalues
[sorted_eigenvalues, indices] = sort(eigenvalue_array, 'descend');
sorted_eigenvectors = pvt_cov_eigenvectors(:, indices);

num_pcs = 2;
feature_vector = sorted_eigenvectors(:,1:num_pcs);

% Plot standardized data and three principle components
tiledlayout('flow')
nexttile
plotPVT(acrylic_std, "red")
hold on
plotPVT(black_foam_std, "black")
plotPVT(car_sponge_std, "yellow")
plotPVT(flour_sack_std, "green")
plotPVT(kitchen_sponge_std, "blue")
plotPVT(steel_vase_std, "magenta")
line([0 sorted_eigenvectors(1,1)], [0 sorted_eigenvectors(2,1)], [0 sorted_eigenvectors(3,1)], color="red")
line([0 sorted_eigenvectors(1,2)], [0 sorted_eigenvectors(2,2)], [0 sorted_eigenvectors(3,2)], color="green")
line([0 sorted_eigenvectors(1,3)], [0 sorted_eigenvectors(2,3)], [0 sorted_eigenvectors(3,3)], color="blue")

xlabel("Vibrations")
ylabel("Pressure")
zlabel("Temperature")
title("Standardized PVT Data and principle components")

% Project data onto principle components
two_d_data = feature_vector' * standardized_data';

% Plot the new 2d data
nexttile
scatter(two_d_data(1,1:10), two_d_data(2,1:10), "red","filled")
hold on
scatter(two_d_data(1,11:20), two_d_data(2,11:20), "black","filled")
scatter(two_d_data(1,21:30), two_d_data(2,21:30), "yellow","filled")
scatter(two_d_data(1,31:40), two_d_data(2,31:40), "green","filled")
scatter(two_d_data(1,41:50), two_d_data(2,41:50), "blue","filled")
scatter(two_d_data(1,51:60), two_d_data(2,51:60), "magenta","filled")
line([0 1], [0 0], color="red")
line([0 0], [0 1], color="green")
hold off
xlabel('PC1')
ylabel('PC2')
title('PVT data reduced to 2d using PC1 / PC2')

% Plot the 1d data for each principle component
one_d_pc1 = sorted_eigenvectors(:,1)' * standardized_data';
one_d_pc2 = sorted_eigenvectors(:,2)' * standardized_data';
one_d_pc3 = sorted_eigenvectors(:,3)' * standardized_data';

nexttile
oneDScatter(one_d_pc1, 0)
oneDScatter(one_d_pc2, 1)
oneDScatter(one_d_pc3, 2)
ylim([-0.5 2.5])
yticks([0 1 2])
yticklabels({'PC1', 'PC2', 'PC3'})
title('Data reduced to 1d (projected onto each PC)')

% ----- QUESTION 2 ----- %
load('F0_electrodes.mat')

all_electrodes = [acrylic_electrode black_foam_electrode car_sponge_electrode flour_sack_electrode kitchen_sponge_electrode steel_vase_electrode]';
electrodes_std = normalize(all_electrodes);

electrodes_cov = cov(electrodes_std);
[electrodes_cov_eigenvectors, electrodes_cov_eigenvalues] = eig(electrodes_cov);
electrodes_eigenvalue_array = diag(electrodes_cov_eigenvalues);

% Sort eigenvectors and eigenvalues
[electrodes_sorted_eigenvalues, electrodes_indices] = sort(diag(electrodes_cov_eigenvalues), 'descend');
electrodes_sorted_eigenvectors = electrodes_cov_eigenvectors(:, electrodes_indices);

nexttile
plot(electrodes_sorted_eigenvalues,'-o')
title('Electrodes scree plot')
ylabel('Eigenvalue')
xlabel('Component number')

% Reduce to 3 dimensions and plot
electrodes_feature_vector = electrodes_sorted_eigenvectors(:,1:3);
three_d_data = electrodes_feature_vector' * electrodes_std';

save("electrodes_pca.mat", "three_d_data")

nexttile
plotElectrodes(three_d_data, 1, 10, "red");
hold on
plotElectrodes(three_d_data, 11, 20, "black");
plotElectrodes(three_d_data, 21, 30, "yellow");
plotElectrodes(three_d_data, 31, 40, "green");
plotElectrodes(three_d_data, 41, 50, "blue");
plotElectrodes(three_d_data, 51, 60, "magenta");
xlabel('PC1')
ylabel('PC2')
zlabel('PC3')
title('Electrodes data reduced to 3d')

leg = legend('acrylic', 'black foam', 'car sponge', 'flour sack', 'kitchen sponge', 'steel vase');
leg.Layout.Tile = 'east';