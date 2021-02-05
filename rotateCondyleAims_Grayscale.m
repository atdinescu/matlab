
clc
clear
files = dir('*.AIM*');
dirName = 'DK0:[MICROCT.DATA.00004088.00029271]';

fid = fopen('rotateGSAim.csv','w');

[NUM,TXT,RAW]=xlsread('F:\tibial plateau scan information.xlsx','Condyle Rotation Adjustment','A2:H100');

fprintf(fid,'%s\n','$ipl');

for i = 36:length(files)
    fileName = files(i).name
    fileName_short = fileName(1:8);
    
    index = find(strcmp(TXT(:,1),fileName_short));
  
    rotX = num2str(NUM(index,5));
    rotY = num2str(NUM(index,6));
    rotZ = num2str(NUM(index,4));
   
    newName = char(TXT(index,2));
    
    if ~strcmp(rotX,'0')||~strcmp(rotY,'0')||~strcmp(rotZ,'0')
        fprintf(fid,'%s\n','read');
        fprintf(fid,'%s\n','var');
        fprintf(fid,'%s\n',[dirName fileName]);

        fprintf(fid,'%s\n',' ');
        
        fprintf(fid,'%s\n','gobj','var',[dirName fileName_short '.gobj']);

        fprintf(fid,'%s\n',' ');
        
        fprintf(fid,'%s\n','bounding var var1 false 0');
        
%         fprintf(fid,'%s\n','sup var1 -1 0 -1 -1');

        fprintf(fid,'%s\n',' ');

        if ~strcmp(rotZ,'0')
            fprintf(fid,'%s\n','turn3d');
            fprintf(fid,'%s\n','var1');
            fprintf(fid,'%s\n','var');
            fprintf(fid,'%s\n','90 90 0');
            fprintf(fid,'%s\n',rotZ);   
            fprintf(fid,'%s\n','1');    

            fprintf(fid,'%s\n','bounding var var1 false 0');

            fprintf(fid,'%s\n',' ');
        end

        if ~strcmp(rotX,'0')
            fprintf(fid,'%s\n','turn3d');
            fprintf(fid,'%s\n','var1');
            fprintf(fid,'%s\n','var');
            fprintf(fid,'%s\n','0 90 90');
            fprintf(fid,'%s\n',rotX);   
            fprintf(fid,'%s\n','1'); 

            fprintf(fid,'%s\n',' ');

            fprintf(fid,'%s\n','bounding var var1 false 0');
            fprintf(fid,'%s\n',' ');    
        end


        if ~strcmp(rotY,'0')
            fprintf(fid,'%s\n','turn3d');
            fprintf(fid,'%s\n','var1');
            fprintf(fid,'%s\n','var');
            fprintf(fid,'%s\n','90 0 90');
            fprintf(fid,'%s\n',rotY);   
            fprintf(fid,'%s\n','1');    

            fprintf(fid,'%s\n','bounding var var1 false 0');

            fprintf(fid,'%s\n',' ');
        end


        fprintf(fid,'%s\n','header var1 0 0 -1');


        fprintf(fid,'%s\n',' ');

%         fprintf(fid,'%s\n','sup var1 -1 0 -1 -1');
% 
%         fprintf(fid,'%s\n',' ');

        fprintf(fid,'%s\n','write','var1',[dirName newName '.AIM'],'none','true');

        fprintf(fid,'%s\n',' ');
        
%         fprintf(fid,'%s\n','threshold','var1','seg','240','1000000','127','0');
%         
%         fprintf(fid,'%s\n',' ');
%         
%         fprintf(fid,'%s\n','write','seg',[dirName newName '_seg.AIM'],'bin','true');
%         
%         fprintf(fid,'%s\n',' ');
         
        fprintf(fid,'%s\n','q');
        fprintf(fid,'%s\n',['$cd ' dirName]);
        fprintf(fid,'%s\n',['$delete ' fileName]);
        
        fprintf(fid,'%s\n',' ');
        fprintf(fid,'%s\n','$ipl'); 
        fprintf(fid,'%s\n',' ');
    end
    
end


fclose(fid);