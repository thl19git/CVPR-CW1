load('F0_PVT.mat')

% ----- Black Foam and Car Sponge ----- %

tac_standardized = normalize([black_foam_pvt.tac car_sponge_pvt.tac]);
pac_standardized = normalize([black_foam_pvt.pac car_sponge_pvt.pac]);
pdc_standardized = normalize([black_foam_pvt.pdc car_sponge_pvt.pdc]);

black_foam_tac_mean = mean(tac_standardized(1:10));
black_foam_pac_mean = mean(pac_standardized(1:10));
black_foam_pdc_mean = mean(pdc_standardized(1:10));

car_sponge_tac_mean = mean(tac_standardized(11:20));
car_sponge_pac_mean = mean(pac_standardized(11:20));
car_sponge_pdc_mean = mean(pdc_standardized(11:20));

% ----- 2d LDA ----- %

tiledlayout("flow")
LDA(black_foam_tac_mean, black_foam_pac_mean, car_sponge_tac_mean, car_sponge_pac_mean, tac_standardized, pac_standardized, "black", "yellow", "Temperature", "Vibrations")
LDA(black_foam_tac_mean, black_foam_pdc_mean, car_sponge_tac_mean, car_sponge_pdc_mean, tac_standardized, pdc_standardized, "black", "yellow", "Temperature", "Pressure")
LDA(black_foam_pdc_mean, black_foam_pac_mean, car_sponge_pdc_mean, car_sponge_pac_mean, pdc_standardized, pac_standardized, "black", "yellow", "Pressure", "Vibrations")

% ----- 3d LDA ----- %
black_foam_mean = [black_foam_tac_mean black_foam_pac_mean black_foam_pdc_mean];
car_sponge_mean = [car_sponge_tac_mean car_sponge_pac_mean car_sponge_pdc_mean];

LDA3(tac_standardized, pac_standardized, pdc_standardized, black_foam_mean, car_sponge_mean, "black", "yellow")

% ----- Acrylic and Steel Vase ----- %

tac_standardized = normalize([acrylic_pvt.tac steel_vase_pvt.tac]);
pac_standardized = normalize([acrylic_pvt.pac steel_vase_pvt.pac]);
pdc_standardized = normalize([acrylic_pvt.pdc steel_vase_pvt.pdc]);

acrylic_tac_mean = mean(tac_standardized(1:10));
acrylic_pac_mean = mean(pac_standardized(1:10));
acrylic_pdc_mean = mean(pdc_standardized(1:10));

steel_vase_tac_mean = mean(tac_standardized(11:20));
steel_vase_pac_mean = mean(pac_standardized(11:20));
steel_vase_pdc_mean = mean(pdc_standardized(11:20));

% ----- 2d LDA ----- %

LDA(acrylic_tac_mean, acrylic_pac_mean, steel_vase_tac_mean, steel_vase_pac_mean, tac_standardized, pac_standardized, "red", "magenta", "Temperature", "Vibrations")
LDA(acrylic_tac_mean, acrylic_pdc_mean, steel_vase_tac_mean, steel_vase_pac_mean, tac_standardized, pdc_standardized, "red", "magenta", "Temperature", "Pressure")
LDA(acrylic_pdc_mean, acrylic_pac_mean, steel_vase_tac_mean, steel_vase_pac_mean, pdc_standardized, pac_standardized, "red", "magenta", "Pressure", "Vibrations")

% ----- 3d LDA ----- %
acrylic_mean = [acrylic_tac_mean acrylic_pac_mean acrylic_pdc_mean];
steel_vase_mean = [steel_vase_tac_mean steel_vase_pac_mean steel_vase_pdc_mean];

LDA3(tac_standardized, pac_standardized, pdc_standardized, acrylic_mean, steel_vase_mean, "red", "magenta")