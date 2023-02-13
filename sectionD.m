% ----- Question 1 ----- %

load('F0_PVT.mat')

tdc = normalize([acrylic_pvt.tdc black_foam_pvt.tdc car_sponge_pvt.tdc flour_sack_pvt.tdc kitchen_sponge_pvt.tdc steel_vase_pvt.tdc]);
pac = normalize([acrylic_pvt.pac black_foam_pvt.pac car_sponge_pvt.pac flour_sack_pvt.pac kitchen_sponge_pvt.pac steel_vase_pvt.pac]);
pdc = normalize([acrylic_pvt.pdc black_foam_pvt.pdc car_sponge_pvt.pdc flour_sack_pvt.pdc kitchen_sponge_pvt.pdc steel_vase_pvt.pdc]);

data = [tdc; pac; pdc]';

rng(22)
[idx,C,sumd] = kmeans(data, 6, "Distance","sqeuclidean");
%sumd can be used for elbow method - divide by cluster size to get average
%distance

tiledlayout("flow")
nexttile

scatter3(data(idx==1,1),data(idx==1,2),data(idx==1,3),"red", "filled")
hold on
scatter3(data(idx==2,1),data(idx==2,2),data(idx==2,3),"yellow", "filled")
scatter3(data(idx==3,1),data(idx==3,2),data(idx==3,3),"green", "filled")
scatter3(data(idx==4,1),data(idx==4,2),data(idx==4,3),"blue", "filled")
scatter3(data(idx==5,1),data(idx==5,2),data(idx==5,3),"magenta", "filled")
scatter3(data(idx==6,1),data(idx==6,2),data(idx==6,3),"black", "filled")
xlabel("Temperature")
ylabel("Vibrations")
zlabel("Pressure")
title("K-means with k=6, sqeuclidean")

% Change distance metric

[idx,C,sumd] = kmeans(data, 6, "Distance","cityblock");

nexttile

scatter3(data(idx==1,1),data(idx==1,2),data(idx==1,3),"red", "filled")
hold on
scatter3(data(idx==2,1),data(idx==2,2),data(idx==2,3),"yellow", "filled")
scatter3(data(idx==3,1),data(idx==3,2),data(idx==3,3),"green", "filled")
scatter3(data(idx==4,1),data(idx==4,2),data(idx==4,3),"blue", "filled")
scatter3(data(idx==5,1),data(idx==5,2),data(idx==5,3),"magenta", "filled")
scatter3(data(idx==6,1),data(idx==6,2),data(idx==6,3),"black", "filled")
xlabel("Temperature")
ylabel("Vibrations")
zlabel("Pressure")
title("K-means with k=6, cityblock")

% TODO: Use elbow method to see what k should actually be used for the data

% ----- Question 2 ----- %

load("electrodes_pca.mat");

