% Note for the marker:
% To change the path to the data, simply change the "data/" strings to the
% relative path. If the data is in the same folder as the code, the path
% and subsequent + symbol can be removed altogether.

function item_data = loadData(item)
    for n = 1:10
        if n < 10
            item_data.("trial_"+n) = load("data/"+item+"_0"+n+"_HOLD");
        else
            item_data.("trial_"+n) = load("data/"+item+"_"+n+"_HOLD");
        end
    end
end