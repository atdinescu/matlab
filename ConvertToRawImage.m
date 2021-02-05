% This script converts external image files to raw images
% make sure you are running the script in the same directory as the image
% slices

clc
clear

prompt = {'Enter the input image extension.','Enter the output raw filename','Specify data type '};
dlg_title = 'Input extension';
num_lines = 1;
defaultans = {'.dcm','rawImage.raw','int16'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

fileType = answer{1};
outputFilename = answer{2};
dataType = answer(3);
slices = dir(['*' fileType]);

if strcmp(fileType,'.dcm')
    
    slice1 = dicomread(slices(1).name);
    dim = size(slice1);
    M = ones(dim(1),dim(2),length(slices));
    for i = 1:length(slices)
        M(:,:,i) = dicomread(slices(i).name);
    end
    
else % for bmp, tiff images
    slice1 = imread(slices(1).name);
    dim = size(slice1);
    M = ones(dim(1),dim(2),length(slices));
    for i = 1:length(slices)
        M(:,:,i) = imread(slices(i).name);
    end
end

fid = fopen(outputFilename,'w+');
cnt=fwrite(fid,M,char(dataType));
fclose(fid);

fprintf('\n%s',['Raw image dimension is ' num2str(dim(1)) ' x ' num2str(dim(2)) ' x ' num2str(length(slices))])