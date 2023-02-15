function std_struct = toStandardizedStruct(tac, pac, pdc, start_ind, end_ind)
    std_struct.tac = tac(start_ind : end_ind);
    std_struct.pac = pac(start_ind : end_ind);
    std_struct.pdc = pdc(start_ind : end_ind);
end