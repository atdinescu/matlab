% Change input below
fileName='N001MX0P.AIM';
y_position = 191; % y position of _BONE.GOBJ file
firstslice = 189; % z position + 1 of _BONE.GOBJ file


%files = dir('*AIM;1');
dirName = 'DK0:[MICROCT.DATA.00002000.00026768]';
fid = fopen('toWBPR.csv','w');
fprintf(fid,'\n%s','$ipl');

threshold_trab = 18100;
threshold_cart = 100;
cartsca = 5;
y_position = y_position+2;

for i = 1:1% length(files)
    
    %fileName = files(i).name;
    % Generate _ITS.AIM file
    fprintf(fid,'\n%s','read','in',[dirName fileName]);
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','bound','in','out','true','1'); % Add extra slice to account for gauss_seg function
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','gauss_seg','out','trabseg','0.8','1',num2str(threshold_trab),'100000','127','5');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','connectivity','trabseg');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','set','trabseg','127','1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','gobj','trabseg',[dirName fileName(1:8) '_BONE.GOBJ'],'0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','header_geo_set','trabseg','0','0','-1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','sub_get','trabseg','trab_sub',['5 0 ' num2str(firstslice)],'450 570 200','false'); % Account for +1 extra position in z direction
    fprintf(fid,'\n%s',' ');
%     fprintf(fid,'\n%s','write','trab_sub',[dirName fileName(1:8) '_ITS.AIM'],'none','true');
%     fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','turn3d','trab_sub','trabturn','90 90 0','90','1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','header_geo_set','trabturn','-1','0','-1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','write','trabturn',[dirName fileName(1:8) '_ITS.AIM'],'none','true'); 
    fprintf(fid,'\n%s',' ');
    
    % Generate TRAB_GOBJRINGS.AIM file
    fprintf(fid,'\n%s','gobj_to_aim',[dirName fileName(1:8) '_BONE.GOBJ'],'trab1','0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','gobj_to_aim',[dirName fileName(1:8) '_BONE.GOBJ'],'trab2','1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','set','trab2','126','0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','subtract_aims','trab1','trab2','trabring');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','bound','trabring','trabout','false',['0 ' num2str(y_position) ' 0']);
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','header_geo_set','trabout','-1','0','-1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','sub_get','trabout','trabout2','5 0 1','450 570 200','false');
    fprintf(fid,'\n%s',' ');
%     fprintf(fid,'\n%s','write','trabout2',[dirName fileName(1:8) '_TRAB_GOBJRINGS.AIM'],'none','true');
%     fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','turn3d','trabout2','trabturn2','90 90 0','90','1'); 
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','header_geo_set','trabturn2','-1','0','-1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','write','trabturn2',[dirName fileName(1:8) '_TRAB_GOBJRINGS.AIM'],'none','true');
    fprintf(fid,'\n%s',' ');

    % Generate CARTONLY.GOBJ
    % fprintf(fid,'\n%s','gobj_to_aim',[dirName fileName(1:8) '_BONE.GOBJ'],'trab1','0');
    % fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','gobj_to_aim',[dirName fileName(1:8) '_CARTILAGE.GOBJ'],'cart','0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','subtract_aims','cart','trab1','cartonly');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','togobj_from_aim','cartonly',[dirName fileName(1:8) '_CARTONLY.GOBJ'],'0','0','1');
    fprintf(fid,'\n%s',' ');
    
    % Generate CARTSEG_SCA2X.AIM file
%     fprintf(fid,'\n%s','read','in',[dirName fileName]);
%     fprintf(fid,'\n%s',' ');
%     fprintf(fid,'\n%s','bound','in','out','true','1 1 1');
%     fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','gauss_seg','out','cartseg','0.8','1',num2str(threshold_cart),'100000','127','0');
    fprintf(fid,'\n%s',' ');      
    fprintf(fid,'\n%s','gobj','cartseg',[dirName fileName(1:8) '_CARTONLY.GOBJ'],'0');
    fprintf(fid,'\n%s',' ');
      
   % fprintf(fid,'\n%s','connectivity','cartseg');
   % fprintf(fid,'\n%s',' ');
   % fprintf(fid,'\n%s','bound','cartseg','out','true','0 0 0');

    fprintf(fid,'\n%s','header_geo_set','cartseg','0','0','-1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','sub_get','cartseg','cart_out',['5 0 ' num2str(firstslice)],'450 570 200','false');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','turn3d','cart_out','cartturn','90 90 0','90','1'); 
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','header_geo_set','cartturn','-1','0','-1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','write','cartturn',[dirName fileName(1:8) '_CARTSEG.AIM'],'none','true'); 
    fprintf(fid,'\n%s',' ');
    
    % Scale cartilage 5X
    fprintf(fid,'\n%s','scale','cart_out','cartsca','5','1','true');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','threshold','cartsca','cartseg','100','100000','127','0');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','turn3d','cartseg','cartturn5','90 90 0','90','1'); 
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','header_geo_set','cartturn5','-1','0','-1');
    fprintf(fid,'\n%s',' ');
    fprintf(fid,'\n%s','write','cartturn5',[dirName fileName(1:8) '_CARTSEG_SCA5.AIM'],'none','true'); 
    fprintf(fid,'\n%s',' ');

    % fprintf(fid,'\n%s','turn3d','out',[dirName fileName(1:8) '_CARTSEG_SCA5X.AIM'],'none','true'); 
      
end

fclose(fid);
