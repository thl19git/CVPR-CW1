% Note for the marker:
% The code for this section assumes that the data is in a 'data' directory
% As this is likely not the case, the path to the data can be changed in
% the file loadData.m

acrylic = loadData("acrylic_211");
black_foam = loadData("black_foam_110");
car_sponge = loadData("car_sponge_101");
flour_sack = loadData("flour_sack_410");
kitchen_sponge = loadData("kitchen_sponge_114");
steel_vase = loadData("steel_vase_702");

tiledlayout("flow")
nexttile

time_instance = 157;

%Plotting some data
plot(acrylic.trial_1.F0tac,"Color","red")
hold on
plot(black_foam.trial_1.F0tac,"Color","black")
plot(car_sponge.trial_1.F0tac,"Color","yellow")
plot(flour_sack.trial_1.F0tac,"Color","green")
plot(kitchen_sponge.trial_1.F0tac,"Color","blue")
plot(steel_vase.trial_1.F0tac,"Color","magenta")
xline(time_instance,"LineStyle","--")
xlabel("Time")
ylabel("Temperature (tac)")
title("Temperature (tac) time series data (trial 1)")

nexttile
plot(acrylic.trial_4.F0pdc,"Color","red")
hold on
plot(black_foam.trial_4.F0pdc,"Color","black")
plot(car_sponge.trial_4.F0pdc,"Color","yellow")
plot(flour_sack.trial_4.F0pdc,"Color","green")
plot(kitchen_sponge.trial_4.F0pdc,"Color","blue")
plot(steel_vase.trial_4.F0pdc,"Color","magenta")
xline(time_instance,"LineStyle","--")
xlabel("Time")
ylabel("Pressure (pdc)")
title("Pressure (pdc) time series data (trial 4)")

nexttile
plot(acrylic.trial_8.F0pac(2,:),"Color","red")
hold on
plot(black_foam.trial_8.F0pac(2,:),"Color","black")
plot(car_sponge.trial_8.F0pac(2,:),"Color","yellow")
plot(flour_sack.trial_8.F0pac(2,:),"Color","green")
plot(kitchen_sponge.trial_8.F0pac(2,:),"Color","blue")
plot(steel_vase.trial_8.F0pac(2,:),"Color","magenta")
xline(time_instance,"LineStyle","--")
xlabel("Time")
ylabel("Vibrations (pac)")
xlim([0 1000])
title("Vibrations (pac) time series data (trial 8)")

nexttile
plot(acrylic.trial_6.F0Electrodes(12,:),"Color","red")
hold on
plot(black_foam.trial_6.F0Electrodes(12,:),"Color","black")
plot(car_sponge.trial_6.F0Electrodes(12,:),"Color","yellow")
plot(flour_sack.trial_6.F0Electrodes(12,:),"Color","green")
plot(kitchen_sponge.trial_6.F0Electrodes(12,:),"Color","blue")
plot(steel_vase.trial_6.F0Electrodes(12,:),"Color","magenta")
xline(time_instance,"LineStyle","--")
xlabel("Time")
ylabel("Electrode (12)")
xlim([0 1000])
title("Electrode time series data (trial 6)")

[acrylic_pvt, acrylic_electrode] = sampleData(acrylic, time_instance);
[black_foam_pvt, black_foam_electrode] = sampleData(black_foam, time_instance);
[car_sponge_pvt, car_sponge_electrode] = sampleData(car_sponge, time_instance);
[flour_sack_pvt, flour_sack_electrode] = sampleData(flour_sack, time_instance);
[kitchen_sponge_pvt, kitchen_sponge_electrode] = sampleData(kitchen_sponge, time_instance);
[steel_vase_pvt, steel_vase_electrode] = sampleData(steel_vase, time_instance);


save("F0_PVT.mat","acrylic_pvt", "black_foam_pvt", "car_sponge_pvt", "flour_sack_pvt", "kitchen_sponge_pvt", "steel_vase_pvt")
save("F0_electrodes.mat","acrylic_electrode", "black_foam_electrode", "car_sponge_electrode", "flour_sack_electrode", "kitchen_sponge_electrode", "steel_vase_electrode")

nexttile
plotPVT(acrylic_pvt, "red")
hold on
plotPVT(black_foam_pvt, "black")
plotPVT(car_sponge_pvt, "yellow")
plotPVT(flour_sack_pvt, "green")
plotPVT(kitchen_sponge_pvt, "blue")
plotPVT(steel_vase_pvt, "magenta")

xlabel("Vibrations")
ylabel("Pressure")
zlabel("Temperature")
title("PVT Data at time "+string(time_instance))

leg = legend('acrylic', 'black foam', 'car sponge', 'flour sack', 'kitchen sponge', 'steel vase');
leg.Layout.Tile = 'east';

