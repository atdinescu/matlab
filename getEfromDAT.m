% % str=uigetdir('K:\PR test');
% % files=dir(fullfile(str,'*.dat'));
% % %%
% % fname=fullfile(str,'E0012496_SUB_R10_PT50.dat');
% % delimiter=',';
% % headerlinesIn=1;
% % data=impor*tdata(fname,delimiter,headerlinesIn);
% clear all; close all; clc;
% filename = 'H:\Projects-Main\Trab Simulation\Jenny OA samples\PR model\Post-process with MATLAB\E0012496_ITS_SUB_R15_PT50_3_PR.dat';
% delimiter = ',';
% [data]=importDAT(filename,delimiter);
% %% Read RF and U data
% for i=1:length(data)
%     n{i,1}=sscanf(data{i,1},'TOTAL         %f');
% end
% num=cell2mat(n);
% RF=num(1:1:end);
% U=[5.00E-03
% 1.00E-02
% 1.75E-02
% 2.88E-02
% 4.56E-02
% 7.09E-02
% 1.09E-01
% 1.59E-01
% 2.09E-01
% 2.59E-01
% 3.09E-01
% 3.59E-01
% 4.09E-01
% 4.59E-01
% 5.09E-01
% 5.59E-01
% 6.09E-01
% 6.59E-01
% 7.09E-01
% 7.59E-01
% 8.09E-01
% 8.59E-01
% 9.09E-01
% 9.59E-01
% 1];
% 
% %U=num(2:2:end);
%% Import RPT file from Abaqus
clear all; close all; clc;

filenames = dir('*.rpt*');
%[
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT01MEDL_01I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT01MEDL_02I_SUB.rpt'
%    '\\boneserver2\share\Teo\2020 ORS  - PR results\CT08M_02I_R15_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT01MEDL_04I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT01MEDL_05I_SUB.rpt'    
% 
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT02MEDL_01I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT02MEDL_02I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT02MEDL_03I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT02MEDL_04I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT02MEDL_05I_SUB.rpt'
% 
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT08MEDR_01I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT08MEDR_02I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT08MEDR_03I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT08MEDR_04I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT08MEDR_05I_SUB.rpt'    
% 
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09MEDL_01I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09MEDL_02I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09MEDL_03I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09MEDL_04I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09MEDL_05I_SUB.rpt'
%     
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT10MEDL_01I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT10MEDL_02I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT10MEDL_03I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT10MEDL_04I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT10MEDL_05I_SUB.rpt'
%     
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT11MEDL_01I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT11MEDL_02I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT11MEDL_03I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT11MEDL_04I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT11MEDL_05I_SUB.rpt'
%     
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT12MEDL_01I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT12MEDL_02I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT12MEDL_03I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT12MEDL_04I_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT12MEDL_05I_SUB.rpt'
    
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09M_01I_R15_PT50_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09M_02I_R15_PT50_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09M_03I_R15_PT50_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09M_04I_R15_PT50_SUB.rpt'
%     '\\boneserver2\share\Teo\2020 ORS  - PR results\CT09M_05I_R15_PT50_SUB.rpt'
%    ];

length = [
    541
    545
    555
    508
    420
    382
    599
    606
    429
    572
    494
    552
    591
    456
    303
    427
    519
    478
    663
    716
    549
    638
    656
    591
    ];
%%
for i=1:length(filenames)
    filename = filenames(i,:).name;
    cubeLength=length(i)*0.0312; % cube length times voxel resolution
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

% hold on;
% fun = @(x) b(1,1)*x^2+b(1,2)*x+b(1,3)-a*(x-0.002);
% fplot(fun);
% yieldstrain=fzero(fun,0.01);
% modulus=a;
% yieldstress=a(1,1)*(yieldstrain-0.002);

% plot(yieldstrain,yieldstress,'--ro');

% hold on;
% x1=0:0.0001:0.01;
% y=a*(x1-0.002);
% plot(x1,y,'b','linewidth',2);
% fileid=fopen('result.txt','a');
% % files2(i,1)=cell2mat(files(i,l));
% M=data1(1,i).textdata{2,1};
% fprintf(fileid,'%s %2.6f %5.2f %2.6f\n',M,yieldstrain, modulus, yieldstress);
% fclose(fileid);