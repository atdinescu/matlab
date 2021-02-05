%mycorr_plot


%% BV/TV
% subplot(2,4,1);
% XCT2 = table2array(lr_XCT2_2(:,1));
% uct = table2array(lr_uCT_2(:,1));


%mycorr_plot(table2array(lr_XCT2_2(:,1)),table2array(lr_uCT_2(:,1)),table2array(lt_XCT2_2(:,1)),table2array(lt_uCT_2(:,1)),'BV/TV');
%mycorr_plot(XCT2,table2array(lr_uCT_2(:,1)),table2array(lt_XCT2_2(:,1)),table2array(lt_uCT_2(:,1)),'BV/TV');


subplot(2,4,1);

mean1 = ( table2array(lr_XCT2_2(:,1)) +  table2array(lr_uCT_2(:,1)) )/2;
diff1 =  table2array(lr_XCT2_2(:,1)) -  table2array(lr_uCT_2(:,1)) ;

mean2 = ( table2array(lt_XCT2_2(:,1)) +  table2array(lt_uCT_2(:,1)) )/2;
diff2 =  table2array(lt_XCT2_2(:,1)) -  table2array(lt_uCT_2(:,1)) ;

mycorr_plot(mean1, diff1, mean2, diff2,'BA BV/TV');

%% pBV/TV
subplot(2,4,2);
%mycorr_plot(table2array(lr_XCT2_2(:,2)),table2array(lr_uCT_2(:,2)),table2array(lt_XCT2_2(:,2)),table2array(lt_uCT_2(:,2)),'pBV/TV');


mean3 = ( table2array(lr_XCT2_2(:,2)) +  table2array(lr_uCT_2(:,2)) )/2;
diff3 =  table2array(lr_XCT2_2(:,2)) -  table2array(lr_uCT_2(:,2)) ;

mean4 = ( table2array(lt_XCT2_2(:,2)) +  table2array(lt_uCT_2(:,2)) )/2;
diff4 =  table2array(lt_XCT2_2(:,2)) -  table2array(lt_uCT_2(:,2)) ;

mycorr_plot(mean3, diff3, mean4, diff4,'BA pBV/TV');

%% pTb.N
% subplot(2,4,3);
% mycorr_plot(table2array(lr_XCT2_2(:,7)),table2array(lr_uCT_2(:,7)),table2array(lt_XCT2_2(:,7)),table2array(lt_uCT_2(:,7)),'pTb.N');

subplot(2,4,3);


mean5 = ( table2array(lr_XCT2_2(:,7)) +  table2array(lr_uCT_2(:,7)) )/2;
diff5 =  table2array(lr_XCT2_2(:,7)) -  table2array(lr_uCT_2(:,7)) ;

mean6 = ( table2array(lt_XCT2_2(:,7)) +  table2array(lt_uCT_2(:,7)) )/2;
diff6 =  table2array(lt_XCT2_2(:,7)) -  table2array(lt_uCT_2(:,7)) ;

mycorr_plot(mean5, diff5, mean6, diff6,'BA pTb.N');

%% pTb.Th
% subplot(2,4,4);
% mycorr_plot(table2array(lr_XCT2_2(:,9)),table2array(lr_uCT_2(:,9)),table2array(lt_XCT2_2(:,9)),table2array(lt_uCT_2(:,9)),'pTb.Th');

subplot(2,4,4);

mean7 = ( table2array(lr_XCT2_2(:,9)) +  table2array(lr_uCT_2(:,9)) )/2;
diff7 =  table2array(lr_XCT2_2(:,9)) -  table2array(lr_uCT_2(:,9)) ;

mean8 = ( table2array(lt_XCT2_2(:,9)) +  table2array(lt_uCT_2(:,9)) )/2;
diff8 =  table2array(lt_XCT2_2(:,9)) -  table2array(lt_uCT_2(:,9)) ;

mycorr_plot(mean7, diff7, mean8, diff8,'BA pTb.Th');

%% PR ratio
subplot(2,4,5);
% mycorr_plot(table2array(lr_XCT2_2(:,16)),table2array(lr_uCT_2(:,16)),table2array(lt_XCT2_2(:,16)),table2array(lt_uCT_2(:,16)),'PR Ratio');


%subplot(2,4,6);

mean9 = ( table2array(lr_XCT2_2(:,16)) +  table2array(lr_uCT_2(:,16)) )/2;
diff9 =  table2array(lr_XCT2_2(:,16)) -  table2array(lr_uCT_2(:,16)) ;

mean10 = ( table2array(lt_XCT2_2(:,16)) +  table2array(lt_uCT_2(:,16)) )/2;
diff10 =  table2array(lt_XCT2_2(:,16)) -  table2array(lt_uCT_2(:,16)) ;

mycorr_plot(mean9, diff9, mean10, diff10,'BA PR Ratio');


%% rBV/TV
subplot(2,4,6);
%mycorr_plot(table2array(lr_XCT2_2(:,3)),table2array(lr_uCT_2(:,3)),table2array(lt_XCT2_2(:,3)),table2array(lt_uCT_2(:,3)),'rBV/TV');

mean11 = ( table2array(lr_XCT2_2(:,3)) +  table2array(lr_uCT_2(:,3)) )/2;
diff11 =  table2array(lr_XCT2_2(:,3)) -  table2array(lr_uCT_2(:,3)) ;

mean12 = ( table2array(lt_XCT2_2(:,3)) +  table2array(lt_uCT_2(:,3)) )/2;
diff12 =  table2array(lt_XCT2_2(:,3)) -  table2array(lt_uCT_2(:,3)) ;

mycorr_plot(mean11, diff11, mean12, diff12,'BA rBV/TV');

%% rTb.N
subplot(2,4,7);
%mycorr_plot(table2array(lr_XCT2_2(:,8)),table2array(lr_uCT_2(:,8)),table2array(lt_XCT2_2(:,8)),table2array(lt_uCT_2(:,8)),'rTb.N');

mean13 = ( table2array(lr_XCT2_2(:,8)) +  table2array(lr_uCT_2(:,8)) )/2;
diff13 =  table2array(lr_XCT2_2(:,8)) -  table2array(lr_uCT_2(:,8)) ;

mean14 = ( table2array(lt_XCT2_2(:,8)) +  table2array(lt_uCT_2(:,8)) )/2;
diff14 =  table2array(lt_XCT2_2(:,8)) -  table2array(lt_uCT_2(:,8)) ;

mycorr_plot(mean13, diff13, mean14, diff14,'BA rTb.N');

%% rTb.Th
subplot(2,4,8);
%mycorr_plot(table2array(lr_XCT2_2(:,10)),table2array(lr_uCT_2(:,10)),table2array(lt_XCT2_2(:,10)),table2array(lt_uCT_2(:,10)),'rTb.Th');

mean15 = ( table2array(lr_XCT2_2(:,10)) +  table2array(lr_uCT_2(:,10)) )/2;
diff15 =  table2array(lr_XCT2_2(:,10)) -  table2array(lr_uCT_2(:,10)) ;

mean16 = ( table2array(lt_XCT2_2(:,10)) +  table2array(lt_uCT_2(:,10)) )/2;
diff16 =  table2array(lt_XCT2_2(:,10)) -  table2array(lt_uCT_2(:,10)) ;

mycorr_plot(mean15, diff15, mean16, diff16,'BA rTb.Th');