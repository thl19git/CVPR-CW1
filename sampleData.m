function [pvt_data, electrode_data] = sampleData(data, timestamp)
    electrode_data = zeros(19, 10);
    for n = 10:-1:1
        pvt_data.tac(n) = data.("trial_"+n).("F0tac")(timestamp);
        pvt_data.pdc(n) = data.("trial_"+n).("F0pdc")(timestamp);
        pvt_data.pac(n) = data.("trial_"+n).("F0pac")(2,timestamp);
        electrode_data(:,n) = data.("trial_"+n).F0Electrodes(:,timestamp);
    end
end