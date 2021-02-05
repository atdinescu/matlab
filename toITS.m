dirName = 'DK0:[MICROCT.DATA.00002000.00026476]';

%files = dir('*GOBJ;2');
files = ['E0015569_ITS';'E0015569_ITS';'E0015569_ITS';'E0015569_ITS'];
fid = fopen('toITS.txt','wt');
fprintf(fid,'%s','$ipl');

threshold = 260;

for i = 1:4%length(files)
   
    %fileName = files(i).name;
     fileName = files(i,:);
    fprintf(fid,'\n%s','gauss_seg',[dirName fileName(1:11) '_SIDE.AIM'],'seg','0.8','1',num2str(threshold),'100000','127','0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','connectivity','seg');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','set','seg','127','1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','gobj','seg',[dirName fileName(1:11) '_SIDE.GOBJ'],'0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','turn3d','seg','out','0 90 90','-90', '0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','bound','out','fin','false','0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','write','fin',[dirName fileName(1:11) 'I.AIM'],'none','true'); 
    fprintf(fid,'\n%s',' ');
  
end

fclose(fid);
