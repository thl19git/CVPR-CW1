function [pvt_data, electrode_data] = sampleData(data, timestamp)
    fields = {'tac','pac','pdc'};
    electrode_data = zeros(19, 10);
    for n = 10:-1:1
        for field = fields
            pvt_data.(field{1})(n) = data.("trial_"+n).("F0"+field{1})(timestamp);
        end
        electrode_data(:,n) = data.("trial_"+n).F0Electrodes(:,timestamp);
    end
end