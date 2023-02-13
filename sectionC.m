load('F0_PVT.mat')

% ----- Black Foam and Car Sponge ----- %

tdc_standardized = normalize([black_foam_pvt.tdc car_sponge_pvt.tdc]);
pac_standardized = normalize([black_foam_pvt.pac car_sponge_pvt.pac]);
pdc_standardized = normalize([black_foam_pvt.pdc car_sponge_pvt.pdc]);

black_foam_tdc_mean = mean(tdc_standardized(1:10));
black_foam_pac_mean = mean(pac_standardized(1:10));
black_foam_pdc_mean = mean(pdc_standardized(1:10));

car_sponge_tdc_mean = mean(tdc_standardized(11:20));
car_sponge_pac_mean = mean(pac_standardized(11:20));
car_sponge_pdc_mean = mean(pdc_standardized(11:20));

% ----- 2d LDA ----- %

tiledlayout("flow")
LDA(black_foam_tdc_mean, black_foam_pac_mean, car_sponge_tdc_mean, car_sponge_pac_mean, tdc_standardized, pac_standardized, "black", "yellow", "Temperature", "Vibrations")
LDA(black_foam_tdc_mean, black_foam_pdc_mean, car_sponge_tdc_mean, car_sponge_pdc_mean, tdc_standardized, pdc_standardized, "black", "yellow", "Temperature", "Pressure")
LDA(black_foam_pdc_mean, black_foam_pac_mean, car_sponge_pdc_mean, car_sponge_pac_mean, pdc_standardized, pac_standardized, "black", "yellow", "Pressure", "Vibrations")

% ----- 3d LDA ----- %
black_foam_mean = [black_foam_tdc_mean black_foam_pac_mean black_foam_pdc_mean];
car_sponge_mean = [car_sponge_tdc_mean car_sponge_pac_mean car_sponge_pdc_mean];

LDA3(tdc_standardized, pac_standardized, pdc_standardized, black_foam_mean, car_sponge_mean, "black", "yellow")

% ----- Car Sponge and Kitchen Sponge ----- %

tdc_standardized = normalize([car_sponge_pvt.tdc kitchen_sponge_pvt.tdc]);
pac_standardized = normalize([car_sponge_pvt.pac kitchen_sponge_pvt.pac]);
pdc_standardized = normalize([car_sponge_pvt.pdc kitchen_sponge_pvt.pdc]);

car_sponge_tdc_mean = mean(tdc_standardized(1:10));
car_sponge_pac_mean = mean(pac_standardized(1:10));
car_sponge_pdc_mean = mean(pdc_standardized(1:10));

kitchen_sponge_tdc_mean = mean(tdc_standardized(11:20));
kitchen_sponge_pac_mean = mean(pac_standardized(11:20));
kitchen_sponge_pdc_mean = mean(pdc_standardized(11:20));

% ----- 2d LDA ----- %

LDA(car_sponge_tdc_mean, car_sponge_pac_mean, kitchen_sponge_tdc_mean, kitchen_sponge_pac_mean, tdc_standardized, pac_standardized, "yellow", "blue", "Temperature", "Vibrations")
LDA(car_sponge_tdc_mean, car_sponge_pdc_mean, kitchen_sponge_tdc_mean, kitchen_sponge_pac_mean, tdc_standardized, pdc_standardized, "yellow", "blue", "Temperature", "Pressure")
LDA(car_sponge_pdc_mean, car_sponge_pac_mean, kitchen_sponge_tdc_mean, kitchen_sponge_pac_mean, pdc_standardized, pac_standardized, "yellow", "blue", "Pressure", "Vibrations")

% ----- 3d LDA ----- %
car_sponge_mean = [car_sponge_tdc_mean car_sponge_pac_mean car_sponge_pdc_mean];
kitchen_sponge_mean = [kitchen_sponge_tdc_mean kitchen_sponge_pac_mean kitchen_sponge_pdc_mean];

LDA3(tdc_standardized, pac_standardized, pdc_standardized, car_sponge_mean, kitchen_sponge_mean, "yellow", "blue")