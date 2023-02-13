load('F0_PVT.mat')

tdc_standardized = normalize([black_foam_pvt.tdc car_sponge_pvt.tdc]);
pac_standardized = normalize([black_foam_pvt.pac car_sponge_pvt.pac]);
pdc_standardized = normalize([black_foam_pvt.pdc car_sponge_pvt.pdc]);

black_foam_tdc_mean = mean(tdc_standardized(1:10));
black_foam_pac_mean = mean(pac_standardized(1:10));
black_foam_pdc_mean = mean(pdc_standardized(1:10));

car_sponge_tdc_mean = mean(tdc_standardized(11:20));
car_sponge_pac_mean = mean(pac_standardized(11:20));
car_sponge_pdc_mean = mean(pdc_standardized(11:20));

% ----- Using Temperature and Vibrations ----- %
tiledlayout("flow")
LDA(black_foam_tdc_mean, black_foam_pac_mean, car_sponge_tdc_mean, car_sponge_pac_mean, tdc_standardized, pac_standardized, "black", "yellow", "Temperature", "Vibrations")
LDA(black_foam_tdc_mean, black_foam_pdc_mean, car_sponge_tdc_mean, car_sponge_pdc_mean, tdc_standardized, pdc_standardized, "black", "yellow", "Temperature", "Pressure")
LDA(black_foam_pdc_mean, black_foam_pac_mean, car_sponge_pdc_mean, car_sponge_pac_mean, pdc_standardized, pac_standardized, "black", "yellow", "Pressure", "Vibrations")