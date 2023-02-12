function item_data = loadData(item)
    for n = 1:10
        if n < 10
            item_data.("trial_"+n) = load("data/"+item+"_0"+n+"_HOLD");
        else
            item_data.("trial_"+n) = load("data/"+item+"_"+n+"_HOLD");
        end
    end
end