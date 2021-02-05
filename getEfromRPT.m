clear all; close all; clc;

%% Import RPT file from same directory
files = dir('*.rpt*');

% Open Excel sheet to read in dimX, dimY, dimZ
[num,txt,raw] = xlsread('\\boneserver2\share\Teo\matlab\FE_image_dimensions.xlsx','A2:E3');
voxel = num(:,1);
dimX = num(:,2);
dimY = num(:,3);
dimZ = num(:,4);
%%

fid = fopen('\\boneserver2\share\Teo\matlab\FE_results.csv','a+');
for i=1:length(files)
    fileName = files(i).name;
    cubeLength=dimZ(i)*voxel(i);
    area=dimX(i)*dimY(i)*voxel(i)^2;
    [U,RF]=importRPT(fileName);
    stress=-RF/area;
    strain=U/cubeLength/100;
%%
    data=[strain, stress];
    plot(data(:,1),data(:,2),'bo','markersize',5);
    hold on;
    
    % Calculate E from linear fit
    P = polyfit(strain,stress,1);
    yfit = P(1)*strain+P(2);
    plot(strain, yfit, 'r-.');
    
    % Calculate E from first 2 data points
    a=(data(3,2)-data(2,2))/(data(3,1)-data(2,1));
    fprintf(fid,'%s,%s,%s\n',fileName,P(1),a);
end

fclose(fid);
