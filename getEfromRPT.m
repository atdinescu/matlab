clear all; close all; clc;

<<<<<<< HEAD
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
=======
%% Import RPT file from Abaqus

filenames = dir('*.rpt*');

length = [
    572
    ];
%%
for i=3:4%size(filenames)
    filename = filenames(i).name;
    %cubeLength=length(i)*0.0312; % cube length times voxel resolution
    cubeLength=606*0.0312;
    area=381*380*0.0312^2;
    [U,RF]=importRPT(filename);
    stress=-RF/area;
    strain=U/cubeLength/100;

    data=[strain, stress];
    plot(data(:,1),data(:,2),'bo','markersize',5);

    %% Calculate E and YS, Plot
    a=(data(2,2)-data(1,2))/(data(2,1)-data(1,1));
end
%% Calculate Stress and Strain, Plot
stress=-RF/area;
strain=U/cubeLength/100;

data=[strain, stress];
plot(data(:,1),data(:,2),'bo','markersize',5);

%% Calculate E and YS, Plot
a=(data(2,2)-data(1,2))/(data(2,1)-data(1,1));
>>>>>>> 251c2c9b4d53edbbd6feb9a3bd0c70b029ca975d
