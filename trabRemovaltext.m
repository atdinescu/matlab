fid = fopen('trabRemoval_N003MX0P_R15.csv','w');

for i=1:length(Remove)
    
    test=Remove(i);
    fprintf(fid,'m_iMatrix[i][j][k] == %d ', test);
    fprintf(fid,'|| ');


end
fclose(fid);