
clc
clear

prompt = {'Enter the directory Name.','Enter the fileName to be segmented.','Enter input threshold 1.','Enter input threshold 2.','Enter the name of the output script file','Enter image threshold value'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'DK0:[MICROCT.DATA.00004088.00024771]','IN00PTV1','3000','3000','IN00DFV1','4236'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

dirName = char(answer(1));
inputFile = char(answer(2));
th_1 = char(answer(3));
th_2 = char(answer(4));
scriptName = char(answer(5));
imgTh = char(answer(6));

% begin recording commands
fid = fopen([scriptName '_' th_1 '_' th_2 '.txt'],'wt');
fprintf(fid,'%s','$ipl');

% create downscaled 2X image
fprintf(fid,'\n%s','scale',[dirName inputFile '.AIM'],'var','2','1','true');
fprintf(fid,'\n%s','write','var',[dirName inputFile '_DOWN2X.AIM'],'none','true');

% apply first threshold to down2x image
fprintf(fid,'\n%s','threshold',[dirName inputFile '_DOWN2X.AIM'],'var',th_1,'100000','127','5');

% apply median filter
fprintf(fid,'\n%s','median','var','var1','3');

% dilation
fprintf(fid,'\n%s','dilation','var1','var','15','0','false');
fprintf(fid,'\n%s','set','var','0','127'); % select background
fprintf(fid,'\n%s','sub_get','var','var1','-1 -1 3','-1','-1','false');% delete initial empty slices

% connectivity 
fprintf(fid,'\n%s','connectivity','var1'); 
fprintf(fid,'\n%s','set','var1','0','127'); % select bone

% erosion
fprintf(fid,'\n%s','erosion','var1','var','15','false');

% WHOLE BONE MASK
fprintf(fid,'\n%s','write','var',[dirName inputFile '_DOWN2X_WB_MASK.AIM'],'none','true');
fprintf(fid,'\n%s','togobj','var',[dirName inputFile '_DOWN2X_WB_MASK.gobj'],'0','0','1');

% shrink whole bone mask for later: prescribe minumum thickness for cortex
% layer
fprintf(fid,'\n%s','erosion','var','var1','2','false');
fprintf(fid,'\n%s','togobj','var1',[dirName inputFile '_shrink.gobj'],'0','0','1');

% interupt to clear run-time memory
fprintf(fid,'\n%s','q');
fprintf(fid,'\n%s','$ipl');

% threshold with input threshold 2
fprintf(fid,'\n%s','threshold',[dirName inputFile '_DOWN2X.AIM'],'var1',th_2,'100000','127','5');
fprintf(fid,'\n%s','set','var1','0','127'); % select endosteal volume
fprintf(fid,'\n%s',' ');

% mask with periosteal surface mask
fprintf(fid,'\n%s','gobj','var1',[dirName inputFile '_DOWN2X_WB_MASK.gobj'],'0');
fprintf(fid,'\n%s','set','var1','0','127');% select background

% connectivity 
fprintf(fid,'\n%s','connectivity','var1'); 
fprintf(fid,'\n%s','set','var1','0','127'); % select endosteal volume
fprintf(fid,'\n%s','write','var1',[dirName inputFile '_intermediate1.AIM'],'none','true');

fprintf(fid,'\n%s','q');
fprintf(fid,'\n%s','$ipl');

% dilation
fprintf(fid,'\n%s','dilation',[dirName inputFile '_intermediate1.AIM'],'var','10','0','false');

% erosion
fprintf(fid,'\n%s','erosion','var','var1','10','false');
fprintf(fid,'\n%s','write','var1',[dirName inputFile '_intermediate2.AIM'],'none','true');

fprintf(fid,'\n%s','q');
fprintf(fid,'\n%s','$ipl');

% gaussian filter
fprintf(fid,'\n%s','gauss',[dirName inputFile '_intermediate2.AIM'],'var','3','3');

% threshold gauss filtered endosteal mask
fprintf(fid,'\n%s','threshold','var','var1','100','100000','127','5');

%TRAB MASK
fprintf(fid,'\n%s','gobj','var1',[dirName inputFile '_shrink.gobj'],'0');
fprintf(fid,'\n%s','write','var1',[dirName inputFile '_DOWN2X_TRAB_Mask.AIM'],'none','true');
fprintf(fid,'\n%s','togobj','var1',[dirName inputFile '_DOWN2X_TRAB_MASK.gobj'],'0','0','1');

% isolate cortex volume
fprintf(fid,'\n%s','set','var1','0','127');% select region outside trabecular bone
fprintf(fid,'\n%s','togobj','var1',[dirName inputFile '_DOWN2X_TRAB_INV.gobj'],'0','0','1');
fprintf(fid,'\n%s','read','var',[dirName inputFile '_DOWN2X_WB_MASK.AIM']);
fprintf(fid,'\n%s','gobj','var',[dirName inputFile '_DOWN2X_TRAB_INV.gobj'],'0');
fprintf(fid,'\n%s','sub_get','var','var1','-1 -1 3','-1','-1','false');

% CORTICAL BONE MASK
fprintf(fid,'\n%s','write','var1',[dirName inputFile '_DOWN2X_CORTEX_MASK.AIM'],'none','true');
fprintf(fid,'\n%s','togobj','var1',[dirName inputFile '_DOWN2X_CORTEX_MASK.gobj'],'0','0','1');

% generate seg files for 3D illustration from down2x images

fprintf(fid,'\n%s','read','var',[dirName inputFile '_DOWN2X.AIM']);
fprintf(fid,'\n%s','gobj','var',[dirName inputFile '_DOWN2X_CORTEX_MASK.gobj'],'0');
fprintf(fid,'\n%s','threshold','var','var1',imgTh,'100000','127','5');
fprintf(fid,'\n%s','connectivity','var1'); 
fprintf(fid,'\n%s','write','var1',[dirName inputFile '_DOWN2X_CORTEX_SEG.AIM'],'none','true');

fprintf(fid,'\n%s','read','var',[dirName inputFile '_DOWN2X.AIM']);
fprintf(fid,'\n%s','gobj','var',[dirName inputFile '_DOWN2X_TRAB_MASK.gobj'],'0');
fprintf(fid,'\n%s','threshold','var','var1',imgTh,'100000','127','5');
fprintf(fid,'\n%s','connectivity','var1'); 
fprintf(fid,'\n%s','write','var1',[dirName inputFile '_DOWN2X_TRAB_SEG.AIM'],'none','true');

% scale up to generate original resolution masks

fprintf(fid,'\n%s','scale',[dirName inputFile '_DOWN2X_CORTEX_MASK.AIM'],'var','1','2','false');
fprintf(fid,'\n%s','togobj','var',[dirName inputFile '_CORTEX_MASK.gobj'],'0','0','1');
fprintf(fid,'\n%s','scale',[dirName inputFile '_DOWN2X_TRAB_MASK.AIM'],'var','1','2','false');
fprintf(fid,'\n%s','togobj','var',[dirName inputFile '_TRAB_MASK.gobj'],'0','0','1');

fprintf(fid,'\n%s','read','var',[dirName inputFile '.AIM']);
fprintf(fid,'\n%s','gobj','var',[dirName inputFile '_CORTEX_MASK.gobj'],'0');
fprintf(fid,'\n%s','write','var',[dirName inputFile '_CORTEX.AIM'],'none','true');
fprintf(fid,'\n%s','read','var',[dirName inputFile '.AIM']);
fprintf(fid,'\n%s','gobj','var',[dirName inputFile '_TRAB_MASK.gobj'],'0');
fprintf(fid,'\n%s','write','var',[dirName inputFile '_TRAB.AIM'],'none','true');

% delete intermediate files
fprintf(fid,'\n%s','q');
fprintf(fid,'\n%s',['$cd ' dirName]);
fprintf(fid,'\n%s',['$delete ' inputFile '_shrink.gobj;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_intermediate1.AIM;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_intermediate2.AIM;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_DOWN2X_TRAB_INV.gobj;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_DOWN2X_CORTEX_MASK.AIM;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_DOWN2X_TRAB_MASK.AIM;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_DOWN2X_CORTEX_MASK.gobj;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_DOWN2X_TRAB_MASK.GOBJ;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_DOWN2X_WB_MASK.AIM;1']);
fprintf(fid,'\n%s',['$delete ' inputFile '_DOWN2X_WB_MASK.gobj;1']);

fclose(fid);