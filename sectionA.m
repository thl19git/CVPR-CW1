acrylic = loadData("acrylic_211");
black_foam = loadData("black_foam_110");
car_sponge = loadData("car_sponge_101");
flour_sack = loadData("flour_sack_410");
kitchen_sponge = loadData("kitchen_sponge_114");
steel_vase = loadData("steel_vase_702");

%Plotting some data
% subplot(3,4,1)
% plot(flour_sack.trial_6.F0tac)
% subplot(3,4,2)
% plot(flour_sack.trial_6.F0pac(2,:))
% subplot(3,4,3)
% plot(flour_sack.trial_6.F0pdc)
% subplot(3,4,4)
% plot(flour_sack.trial_6.F0Electrodes')
% 
% subplot(3,4,5)
% plot(steel_vase.trial_1.F0tac)
% subplot(3,4,6)
% plot(steel_vase.trial_1.F0pac(2,:))
% subplot(3,4,7)
% plot(steel_vase.trial_1.F0pdc)
% subplot(3,4,8)
% plot(steel_vase.trial_1.F0Electrodes')
% 
% subplot(3,4,9)
% plot(acrylic.trial_1.F0tac)
% subplot(3,4,10)
% plot(acrylic.trial_1.F0pac(2,:))
% subplot(3,4,11)
% plot(acrylic.trial_1.F0pdc)
% subplot(3,4,12)
% plot(acrylic.trial_1.F0Electrodes')

time_instance = 160;

[acrylic_pvt, acrylic_electrode] = sampleData(acrylic, time_instance);
[black_foam_pvt, black_foam_electrode] = sampleData(black_foam, time_instance);
[car_sponge_pvt, car_sponge_electrode] = sampleData(car_sponge, time_instance);
[flour_sack_pvt, flour_sack_electrode] = sampleData(flour_sack, time_instance);
[kitchen_sponge_pvt, kitchen_sponge_electrode] = sampleData(kitchen_sponge, time_instance);
[steel_vase_pvt, steel_vase_electrode] = sampleData(steel_vase, time_instance);


save("F0_PVT.mat","acrylic_pvt", "black_foam_pvt", "car_sponge_pvt", "flour_sack_pvt", "kitchen_sponge_pvt", "steel_vase_pvt")
save("F0_electrodes.mat","acrylic_electrode", "black_foam_electrode", "car_sponge_electrode", "flour_sack_electrode", "kitchen_sponge_electrode", "steel_vase_electrode")

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



