clear all; close all; clc;

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