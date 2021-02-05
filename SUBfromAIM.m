clc; clear all; close all;

dirName = 'DK0:[MICROCT.DATA.00002000.00026721]';

fid = fopen('aim_sub.txt','wt');

% Make sure runing Matlab script in directory where RAW files are saved
fileNames = dir('*.AIM');

% open ipl
fprintf(fid,'\n%s','$ipl');

for i=1:length(fileNames)
    fileName=fileNames(i).name;
    
    fprintf(fid,'\n%s',' ');   
    fprintf(fid,'\n%s','sub_get',[dirName fileName(1:16) '.AIM'],'sub','-1','190','false');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','write','sub',[dirName fileName(1:16) '190.AIM'],'none','true');
end

fclose(fid);