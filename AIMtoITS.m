clc
clear
script = {'$ipl'};

files = dir('*.AIM');
folderName = 'DK0:[MICROCT.DATA.00002000.00026768]';

for i = 1:1
    fileName = files(i).name;
    fileName = fileName(1:8);
    script = [
        'read'
        'in'
        [num2str(folderName),char(fileName),'.AIM']
       
        'gobj'
        'in'
        [num2str(folderName),char(fileName),'_BONE.GOBJ']
        '0'
        ' '
        
        'gauss_seg'
        'in'
        'seg'
        '0.8'
        '1'
        '18100'
        '100000'
        '127'
        '5'
        
        'connectivity'
        'seg'
        
        'set'
        'seg'
        '127'
        '1'
        ' '
        
        'gobj'
        'seg'
        [num2str(folderName),char(fileName),'_BONE.AIM']
        '0'
        ' '
        
%         'sub_get'
%         'in'
%         'sub'
%         '-1 -1 1'
%         '-1 -1 468'
%         'false' 

        'bound'
        'seg'
        'out'
        'false'
        '0 0 0'
        ' '
        
        'write'
        'out'
        [num2str(folderName),char(fileName),'_TRAB.AIM']
        'none'
        'true'];
end

save('script');
xlswrite('generateITS.xls',script);
