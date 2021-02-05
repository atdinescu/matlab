clc; clear all; close all;

dirName = 'DK0:[MICROCT.DATA.00002000.00026568]';

fid = fopen('rawtoaim.txt','wt');

% Make sure runing Matlab script in directory where RAW files are saved
rawfileNames = dir('*.RAW');

% open ipl
fprintf(fid,'\n%s','$ipl');

for i=1:length(rawfileNames)
    rawfileName=rawfileNames(i).name;
    
    fprintf(fid,'\n%s',' ');   
    fprintf(fid,'\n%s','import','in',[dirName rawfileName(1:12) '.RAW'], 'Imported_Sample','0','192 199 135','0.036','1','little_endian','integer','signed','false');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','write','in',[dirName rawfileName(1:12) '.AIM'],'none','true');
end

fclose(fid);