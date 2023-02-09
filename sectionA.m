items = ["acrylic_211","black_foam_110","car_sponge_101","flour_sack_410","kitchen_sponge_114","steel_vase_702"];
itemIndex = 1;
item = items(itemIndex);

for n = 1:10
    if n < 10
        load("data/"+item+"_0"+n+"_HOLD")
    else
        load("data/"+item+"_"+n+"_HOLD")
    end
end

subplot(1,2,1)
plot(F0tac)
subplot(1,2,2)
plot(F0tdc)