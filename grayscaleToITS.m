clc
clear
script = {'$ipl'};

files = dir('*.AIM');
folderName = 'DK0:[MICROCT.DATA.00002000.00026768]';

for i = 1:length(files)
    fileName = files(i).name;
    fileName = fileName(1:8);
    script = [script
        'import'
        'in_mask'
        [num2str(folderName),char(fileName),'-2.RAW']
        'Imported_Sample'
        '0'
        '470 590 470'
        '0.017'
        '2'
        'big_endian'
        'integer'
        'unsigned'
        'false'
        ' '
        'convert_unsigned'
        'in_mask'
        'false'
        'false'
        ' '
        'write'
        'in_mask'
        [num2str(folderName),char(fileName),'_MASK.AIM']
        'none'
        'true'
        ' '
        'import'
        'in'
        [num2str(folderName),char(fileName),'-1.RAW']
        'Imported_Sample'
        '0'
        '470 590 470'
        '0.017'
        '2'
        'big_endian'
        'integer'
        'unsigned'
        'false'
        ' '
        'convert_unsigned'
        'in'
        'true'
        'false'
        ' '
        'scale'
        'in'
        'sca'
        '3'
        '1'
        'true'
        ' '
        'write'
        'sca'
        [num2str(folderName),char(fileName),'_DOWN.AIM']
        'none'
        'true'
        ' '
        'seg_gauss'
        'in'
        'seg'
        '0.8'
        '1'
        '-12207'
        '100000'
        '127'
        '5'
        ' '
        'connectivity'
        'seg'

        'set'
        'seg'
        '127'
        '1'
        ' '
        'gobj'
        'seg'
        [num2str(folderName),char(fileName),'_MASK.AIM']
        '0'
        ' '
        'sub_get'
        'seg'
        'sub'
        '-1 -1 1'
        '-1 -1 468'
        'false'
        ' '
        'write'
        'sub'
        [num2str(folderName),char(fileName),'_ITS.AIM']
        'none'
        'true'];
end

save('script')
xlswrite('generateITS.xls',script)
