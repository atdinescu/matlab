clc; clear all; close all;
 
dirName = 'DK0:[MICROCT.DATA.00002000.00026768]' ;

fid = fopen('aimtoFE.csv','w');

CTfileNames={'E0012609.AIM;1','E0012682.AIM;1','E0012450.AIM;1','E0012461.AIM;1','E0012597.AIM;1','E0012600.AIM;1','E0012604.AIM;1','E0012605.AIM;1','E0012608.AIM;1'};
%pos={'125 125 25'};

%% open ipl
fprintf(fid,'\n%s','$ipl');

for i=1:length(CTfileNames)
    CTfileName=CTfileNames{i};    
    fprintf(fid,'\n%s','read','in',[dirName CTfileName(1:8) '.AIM']);
    fprintf(fid,'\n%s','gauss_seg','in','seg','0.8','1','400','100000','127','0');
    fprintf(fid,'\n%s','set','seg','127','1');
    fprintf(fid,'\n%s','gobj','seg',[dirName CTfileName(1:8) '.GOBJ'],'0');
    %fprintf(fid,'\n%s','sub_get','seg','sub',pos{i},'225 225 400','false');
    fprintf(fid,'\n%s','bound','seg','out','false','0');
    fprintf(fid,'\n%s','write','out',[dirName CTfileName(1:8) '_ITS_SUB.AIM'],'none','true');
   
end
fclose(fid);