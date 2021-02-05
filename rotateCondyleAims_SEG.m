
clc
clear
files = dir('*SEG_DOWN3X.AIM*');
dirName = 'DK0:[MICROCT.DATA.00004088.00029271]';

fid = fopen('rotateSegAim.csv','w');

[NUM,TXT,RAW]=xlsread('F:\tibial plateau scan information.xlsx','Condyle Rotation Adjustment','A2:H100');

fprintf(fid,'%s\n','$ipl');

for i = 1:length(files)
    fileName = files(i).name;
    fileName_short = fileName(1:8);
    
    index = find(strcmp(TXT(:,1),fileName_short));
    
    rotX = num2str(NUM(index,5));
    rotY = num2str(NUM(index,6));
    rotZ = num2str(NUM(index,4));
   
    if ~strcmp(rotX,'0')||~strcmp(rotY,'0')||~strcmp(rotZ,'0')
        fprintf(fid,'%s\n','read');
        fprintf(fid,'%s\n','var');
        fprintf(fid,'%s\n',[dirName fileName]);

        fprintf(fid,'%s\n',' ');

        %fprintf(fid,'%s\n','sup var -1 0 -1 -1');

        %fprintf(fid,'%s\n',' ');

        if ~strcmp(rotZ,'0')
            fprintf(fid,'%s\n','turn3d');
            fprintf(fid,'%s\n','var');
            fprintf(fid,'%s\n','var1');
            fprintf(fid,'%s\n','90 90 0');
            fprintf(fid,'%s\n',rotZ);   
            fprintf(fid,'%s\n','0');    

            fprintf(fid,'%s\n','bounding var1 var false 0');

            fprintf(fid,'%s\n',' ');
        end

        if ~strcmp(rotX,'0')
            fprintf(fid,'%s\n','turn3d');
            fprintf(fid,'%s\n','var');
            fprintf(fid,'%s\n','var1');
            fprintf(fid,'%s\n','0 90 90');
            fprintf(fid,'%s\n',rotX);   
            fprintf(fid,'%s\n','0'); 

            fprintf(fid,'%s\n',' ');

            fprintf(fid,'%s\n','bounding var1 var false 0');
            fprintf(fid,'%s\n',' ');    
        end


        if ~strcmp(rotY,'0')
            fprintf(fid,'%s\n','turn3d');
            fprintf(fid,'%s\n','var');
            fprintf(fid,'%s\n','var1');
            fprintf(fid,'%s\n','90 0 90');
            fprintf(fid,'%s\n',rotY);   
            fprintf(fid,'%s\n','0');    

            fprintf(fid,'%s\n','bounding var1 var false 0');

            fprintf(fid,'%s\n',' ');
        end


        fprintf(fid,'%s\n','header var 0 0 -1');


        fprintf(fid,'%s\n',' ');

        %fprintf(fid,'%s\n','sup var -1 0 -1 -1');

        %fprintf(fid,'%s\n',' ');

        fprintf(fid,'%s\n','write');
        fprintf(fid,'%s\n','var');
        fprintf(fid,'%s\n',[dirName fileName_short '_SEG_down3x_rot.AIM']);
        fprintf(fid,'%s\n','bin');
        fprintf(fid,'%s\n','true');

        fprintf(fid,'%s\n',' ');
    end


end


fclose(fid);