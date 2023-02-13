function std_struct = toStandardizedStruct(tdc, pac, pdc, start_ind, end_ind)
    std_struct.tdc = tdc(start_ind : end_ind);
    std_struct.pac = pac(start_ind : end_ind);
    std_struct.pdc = pdc(start_ind : end_ind);
end