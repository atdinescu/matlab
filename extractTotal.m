%str=uigetdir('G:\Projects-Main\Trab_Simulation\Bone_remodeling_Jenny_new\Test\Done-AIM');
%files=dir(fullfile(str,'*.dat'));
%%
%fname=fullfile(str,'U005MXMP_Z_Copy2.dat');
files = dir('*.dat');
fname = files(1).name;
delimiter=',';
headerlinesIn=1;
data=importdata(fname,delimiter,headerlinesIn);
%% Read RF and U data
for i=1:length(data)
    n{i,1}=sscanf(data{i,1},'TOTAL             %f %f');
end
num=cell2mat(n);
RF=num(1:2:end);
U=num(2:2:end);
%% Calculate Stress and Strain, Plot
cubeLength=275*0.017; % cube length times voxel resolution
%area=cubeLength^2;
area = 381*380*0.0208^2;

stress=-RF/area;
strain=-U/cubeLength/1000;
data=[strain, stress];
plot(data(:,1),data(:,2),'bo','markersize',5);

%% Calculate E and YS, Plot
a=(data(2,2)-data(1,2))/(data(2,1)-data(1,1));

hold on;
fun = @(x) b(1,1)*x^2+b(1,2)*x+b(1,3)-a*(x-0.002);
!ezplot(fun);
yieldstrain=fzero(fun,0.01);
modulus=a;
yieldstress=a(1,1)*(yieldstrain-0.002);

plot(yieldstrain,yieldstress,'--ro');

hold on;
x1=0:0.0001:0.01;
y=a*(x1-0.002);
plot(x1,y,'b','linewidth',2);
fileid=fopen('result.txt','a');
% files2(i,1)=cell2mat(files(i,l));
M=data1(1,i).textdata{2,1};
fprintf(fileid,'%s %2.6f %5.2f %2.6f\n',M,yieldstrain, modulus, yieldstress);
fclose(fileid);