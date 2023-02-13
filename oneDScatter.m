function oneDScatter(data, height)
    y = ones(10) * height;
    scatter(data(1,1:10), y, "red","filled")
    hold on
    scatter(data(1,11:20), y, "black","filled")
    scatter(data(1,21:30), y, "yellow","filled")
    scatter(data(1,31:40), y, "green","filled")
    scatter(data(1,41:50), y, "blue","filled")
    scatter(data(1,51:60), y, "magenta","filled")
end