%% Read AIM file names
files = dir('*.AIM');
fileNames = cellfun(@(in) in(1:16),{files(:).name},'un',0);
%% Import .TYPE and .ORI files into table

i=2;

typeName = [char(fileNames(i)), '.AIM.type'];
oriName = [char(fileNames(i)), '.AIM.ori'];

type = importdata(typeName);
ori = importdata(oriName);
ori_z = ori(3:3:end,:); % Extract every 3rd row from ori file and save to new table


%%
name = files(i).name;
%table = name(1:12);
table = [type, ori_z];
table(:,3)=1:length(type);

longplates=0;
obliqueplates=0;
transverseplates=0;
longrods=0;
obliquerods=0;
transverserods=0;
%%
for i=1:length(table)
    
    if(type(i,1)==1)% plate

        table(i,4) = 90.0 - acos(abs(ori(i,1)))/3.1415926*180;  % Determine trab angle
        table(i,5) = floor(table(i,4)/5)+1;                  % Floor round trab angle

    elseif (type(i,1)==2)% rod
        
        table(i,4) = acos(abs(ori(i,1)))/3.1415926*180;         % Determine trab angle
        table(i,5) = floor(table(i,4)/5)+19;                 % Floor round trab angle
        
    end
    
       % Count how many plates and rods
    if table(i,5) >= 0 && table(i,5) < 7
        longplates=longplates+1;
     
    elseif table(i,5) >= 7 && table(i,5) < 13
        obliqueplates=obliqueplates+1;

    elseif table(i,5) >= 13 && table(i,5) < 19
        transverseplates=transverseplates+1;
    
    elseif table(i,5) >= 19 && table(i,5) <= 24
        longrods=longrods+1;
    
    elseif table(i,5) >= 25 && table(i,5) <=30
        obliquerods=obliquerods+1;
    
    elseif table(i,5) >= 31 && table(i,5) <= 37
        transverserods=transverserods+1;
    end 
    
end

plates= longplates+obliqueplates+transverseplates;
rods= longrods+obliquerods+transverserods;

%%
%T = array2table(table);
%writetable(T,'E0012609_ITS.xlsx');