function plotElectrodes(data, start_ind, end_ind, colour)
    scatter3(data(1,start_ind : end_ind), data(2,start_ind : end_ind), data(3,start_ind : end_ind), colour, 'filled')
end