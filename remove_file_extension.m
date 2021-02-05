files = dir('*.TIF;1');

for i=1:length(files)
    filename = files(i).name;
    newfilename = strrep(filename,'.TIF;1','.TIF');
    copyfile(filename, newfilename);
end
