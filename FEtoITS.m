clc; clear all; close all;
 
dirName = 'DK0:[MICROCT.DATA.00002000.00026768]' ;

fid = fopen('FEtoITS.csv','w');

CTfileNames={'E0012609_ITS_SUB_R15.AIM;1','E0012499_ITS_SUB_R15.AIM;1','E0012497_ITS_SUB_R15.AIM;1','E0012552_ITS_SUB_R15.AIM;1','E0012596_ITS_SUB_R15.AIM;1','E0012597_ITS_SUB_R15.AIM;1','E0012600_ITS_SUB_R15.AIM;1','E0012604_ITS_SUB_R15.AIM;1','E0012605_ITS_SUB_R15.AIM;1','E0012608_ITS_SUB_R15.AIM;1'};
%pos={'125 125 25'};

%% open ipl
fprintf(fid,'\n%s','$ipl');

for i=1:length(CTfileNames)
    CTfileName=CTfileNames{i};    
    fprintf(fid,'\n%s','read','in',[dirName CTfileName(1:20) '.AIM']);
    %fprintf(fid,'\n%s','gauss_seg','in','seg','0.8','1','400','100000','127','0');
    fprintf(fid,'\n%s','set','in','127','1');
    %fprintf(fid,'\n%s','gobj','seg',[dirName CTfileName(1:8) '.GOBJ'],'0');
    %fprintf(fid,'\n%s','sub_get','seg','sub',pos{i},'225 225 400','false');
    fprintf(fid,'\n%s','bound','in','out','false','0');
    fprintf(fid,'\n%s','write','out',[dirName CTfileName(1:20) '_ITS.AIM'],'none','true');
   
end
fclose(fid);