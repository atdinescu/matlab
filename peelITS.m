clc; clear all; close all;

dirName = 'DK0:[MICROCT.DATA.00002000.00026675]';

fid = fopen('peelITS.txt','wt');

% Make sure runing Matlab script in directory where RAW files are saved
%rawfileNames = dir('*.RAW');
uCTfileNames = ['E0009590','E0009591','E0009592'];
XCT1fileNames = ['E0011191','E0011192','E0011195'];

% open ipl
fprintf(fid,'\n%s','$ipl');

for i=1:length(uCTfileNames)
    uCTfileName=uCTfileNames(i).name;
    XCT1fileName=XCT1fileNames(i).name;
    
    fprintf(fid,'\n%s',' ');   
    fprintf(fid,'\n%s','import','in',[dirName rawfileName(1:12) '.RAW'], 'Imported_Sample','0','192 199 135','0.036','1','little_endian','integer','signed','false');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','write','in',[dirName rawfileName(1:12) '.AIM'],'none','true');
end

fclose(fid);