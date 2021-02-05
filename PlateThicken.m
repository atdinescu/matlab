clc; clear all; close all;
 
dirName = 'DK0:[MICROCT.DATA.00002000.00026768]' ;

fid = fopen('plateThicken.csv','w');

%CTfileNames={'E0012496.AIM;1'};
CTfileNames={'E0012496.AIM;2','E0012497.AIM;2','E0012552.AIM;2','E0012597.AIM;2','E0012605.AIM;2','E0012608.AIM;2'};

%% open ipl
fprintf(fid,'\n%s','$ipl');

for i=1:length(CTfileNames)
    CTfileName=CTfileNames{i};    
    fprintf(fid,'\n%s','read','in',[dirName CTfileName(1:8) '_ITS_SUB_PR.AIM']);
    fprintf(fid,'\n%s','read','in40',[dirName CTfileName(1:8) '_ITS_SUB_R40.AIM']);
%     fprintf(fid,'\n%s','read','in15',[dirName CTfileName(1:8) '_ITS_SUB_R15.AIM']);
%     fprintf(fid,'\n%s','read','in20',[dirName CTfileName(1:8) '_ITS_SUB_R20.AIM']);
    fprintf(fid,'\n%s','threshold','in','seg','500','100000','127','0');
    fprintf(fid,'\n%s','dilation','seg','dil_1','1','0','false');
%     fprintf(fid,'\n%s','dilation','seg','dil_3','3','0','false');
%     fprintf(fid,'\n%s','dilation','seg','dil_2','2','0','false');
%     fprintf(fid,'\n%s','dilation','seg','dil_3','3','0','false');
%     fprintf(fid,'\n%s','add_aims','dil_1','in15','out15_1');
%     fprintf(fid,'\n%s','add_aims','dil_2','in15','out15_2');
    fprintf(fid,'\n%s','add_aims','dil_1','in40','out40_1');
%     fprintf(fid,'\n%s','add_aims','dil_3','in75','out75_3');
%     fprintf(fid,'\n%s','add_aims','dil_1','in20','out20_1');
%     fprintf(fid,'\n%s','bound','out15_1','bound_out15_1','false','0');
%     fprintf(fid,'\n%s','bound','out15_2','bound_out15_2','false','0');
    fprintf(fid,'\n%s','bound','out40_1','bound_out40_1','false','0');
%     fprintf(fid,'\n%s','bound','out75_3','bound_out75_3','false','0');
%     fprintf(fid,'\n%s','bound','out20_1','bound_out20_1','false','0');
    fprintf(fid,'\n%s','write','bound_out40_1',[dirName CTfileName(1:8) '_ITS_SUB_R40_P1.AIM'],'none','true');
%     fprintf(fid,'\n%s','write','bound_out75_2',[dirName CTfileName(1:8) '_ITS_SUB_R75_P2.AIM'],'none','true');
%     fprintf(fid,'\n%s','write','bound_out15_2',[dirName CTfileName(1:8) '_ITS_SUB_R15_P2.AIM'],'none','true');
%     fprintf(fid,'\n%s','write','bound_out15_3',[dirName CTfileName(1:8) '_ITS_SUB_R15_P3.AIM'],'none','true');
%     fprintf(fid,'\n%s','write','bound_out20_1',[dirName CTfileName(1:8) '_ITS_SUB_R20_P1.AIM'],'none','true');
   
end
fclose(fid);