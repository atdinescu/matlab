%mycorr_plot
column = ['BV/TV','pBV/TV','rBV/TV','aBV/TV','pBV/BV','rBV/BV','pTb.N','rTb.N','pTb.Th','rTb.Th','pTb.S','rTb.l','PP Junc D','PR Junc D','RR Junc D', 'PR Ratio','PR N Ratio'];

for i=1:17
    subplot(3,6,i);
    %mycorr_plot(table2array(lr_XCT2(:,3)),table2array(lr_uCT(:,3)),table2array(lt_XCT2(:,3)),table2array(lt_uCT(:,3)),'rBV/TV');

    mean1 = ( table2array(lr_XCT1(:,i)) +  table2array(lr_uCT(:,i)) )/2;
    diff1 =  table2array(lr_XCT1(:,i)) -  table2array(lr_uCT(:,i)) ;

    mean2 = ( table2array(lt_XCT1(:,i)) +  table2array(lt_uCT(:,i)) )/2;
    diff2 =  table2array(lt_XCT1(:,i)) -  table2array(lt_uCT(:,i)) ;

   % x_axis = ['Mean 'column(i)];
    mycorr_plot(mean1, diff1, mean2, diff2, 'Mean', 'Difference');

end
%% BV/TV
% subplot(2,4,1);
% xct1 = table2array(lr_XCT1(:,1));
% uct = table2array(lr_uCT(:,1));


%mycorr_plot(table2array(lr_XCT2(:,1)),table2array(lr_uCT(:,1)),table2array(lt_XCT2(:,1)),table2array(lt_uCT(:,1)),'BV/TV');
%mycorr_plot(xct1,table2array(lr_uCT(:,1)),table2array(lt_XCT2(:,1)),table2array(lt_uCT(:,1)),'BV/TV');


subplot(3,6,1);

mean1 = ( table2array(lr_XCT1(:,1)) +  table2array(lr_uCT(:,1)) )/2;
diff1 =  table2array(lr_XCT1(:,1)) -  table2array(lr_uCT(:,1)) ;

mean2 = ( table2array(lt_XCT1(:,1)) +  table2array(lt_uCT(:,1)) )/2;
diff2 =  table2array(lt_XCT1(:,1)) -  table2array(lt_uCT(:,1)) ;

mycorr_plot(mean1, diff1, mean2, diff2,'Mean BV/TV','Difference');

%% pBV/TV
subplot(3,6,2);
%mycorr_plot(table2array(lr_XCT2(:,2)),table2array(lr_uCT(:,2)),table2array(lt_XCT2(:,2)),table2array(lt_uCT(:,2)),'pBV/TV');


mean3 = ( table2array(lr_XCT1(:,2)) +  table2array(lr_uCT(:,2)) )/2;
diff3 =  table2array(lr_XCT1(:,2)) -  table2array(lr_uCT(:,2)) ;

mean4 = ( table2array(lt_XCT1(:,2)) +  table2array(lt_uCT(:,2)) )/2;
diff4 =  table2array(lt_XCT1(:,2)) -  table2array(lt_uCT(:,2)) ;

mycorr_plot(mean3, diff3, mean4, diff4,'Mean pBV/TV','Difference');

%% rBV/TV
subplot(3,6,3);
%mycorr_plot(table2array(lr_XCT2(:,3)),table2array(lr_uCT(:,3)),table2array(lt_XCT2(:,3)),table2array(lt_uCT(:,3)),'rBV/TV');

mean11 = ( table2array(lr_XCT1(:,3)) +  table2array(lr_uCT(:,3)) )/2;
diff11 =  table2array(lr_XCT1(:,3)) -  table2array(lr_uCT(:,3)) ;

mean12 = ( table2array(lt_XCT1(:,3)) +  table2array(lt_uCT(:,3)) )/2;
diff12 =  table2array(lt_XCT1(:,3)) -  table2array(lt_uCT(:,3)) ;

mycorr_plot(mean11, diff11, mean12, diff12,'Mean rBV/TV', 'Difference');

%% aBV/TV
subplot(3,6,4);
%mycorr_plot(table2array(lr_XCT2(:,3)),table2array(lr_uCT(:,3)),table2array(lt_XCT2(:,3)),table2array(lt_uCT(:,3)),'rBV/TV');

mean11 = ( table2array(lr_XCT1(:,4)) +  table2array(lr_uCT(:,4)) )/2;
diff11 =  table2array(lr_XCT1(:,4)) -  table2array(lr_uCT(:,4)) ;

mean12 = ( table2array(lt_XCT1(:,4)) +  table2array(lt_uCT(:,4)) )/2;
diff12 =  table2array(lt_XCT1(:,4)) -  table2array(lt_uCT(:,4)) ;

mycorr_plot(mean11, diff11, mean12, diff12,'Mean aBV/TV', 'Difference');

%% pBV/BV
subplot(3,6,5);
%mycorr_plot(table2array(lr_XCT2(:,3)),table2array(lr_uCT(:,3)),table2array(lt_XCT2(:,3)),table2array(lt_uCT(:,3)),'rBV/TV');

mean11 = ( table2array(lr_XCT1(:,5)) +  table2array(lr_uCT(:,5)) )/2;
diff11 =  table2array(lr_XCT1(:,5)) -  table2array(lr_uCT(:,5)) ;

mean12 = ( table2array(lt_XCT1(:,5)) +  table2array(lt_uCT(:,5)) )/2;
diff12 =  table2array(lt_XCT1(:,5)) -  table2array(lt_uCT(:,5)) ;

mycorr_plot(mean11, diff11, mean12, diff12,'Mean pBV/BV', 'Difference');

%% rBV/BV
subplot(3,6,6);
%mycorr_plot(table2array(lr_XCT2(:,3)),table2array(lr_uCT(:,3)),table2array(lt_XCT2(:,3)),table2array(lt_uCT(:,3)),'rBV/TV');

mean11 = ( table2array(lr_XCT1(:,3)) +  table2array(lr_uCT(:,3)) )/2;
diff11 =  table2array(lr_XCT1(:,3)) -  table2array(lr_uCT(:,3)) ;

mean12 = ( table2array(lt_XCT1(:,3)) +  table2array(lt_uCT(:,3)) )/2;
diff12 =  table2array(lt_XCT1(:,3)) -  table2array(lt_uCT(:,3)) ;

mycorr_plot(mean11, diff11, mean12, diff12,'Mean rBV/BV', 'Difference');

%% pTb.N
% subplot(2,4,3);
% mycorr_plot(table2array(lr_XCT2(:,7)),table2array(lr_uCT(:,7)),table2array(lt_XCT2(:,7)),table2array(lt_uCT(:,7)),'pTb.N');

subplot(3,6,7);

mean5 = ( table2array(lr_XCT1(:,7)) +  table2array(lr_uCT(:,7)) )/2;
diff5 =  table2array(lr_XCT1(:,7)) -  table2array(lr_uCT(:,7)) ;

mean6 = ( table2array(lt_XCT1(:,7)) +  table2array(lt_uCT(:,7)) )/2;
diff6 =  table2array(lt_XCT1(:,7)) -  table2array(lt_uCT(:,7)) ;

mycorr_plot(mean5, diff5, mean6, diff6,'Mean pTb.N', 'Difference');

%% rTb.N
subplot(3,6,8);
%mycorr_plot(table2array(lr_XCT2(:,8)),table2array(lr_uCT(:,8)),table2array(lt_XCT2(:,8)),table2array(lt_uCT(:,8)),'rTb.N');

mean13 = ( table2array(lr_XCT1(:,8)) +  table2array(lr_uCT(:,8)) )/2;
diff13 =  table2array(lr_XCT1(:,8)) -  table2array(lr_uCT(:,8)) ;

mean14 = ( table2array(lt_XCT1(:,8)) +  table2array(lt_uCT(:,8)) )/2;
diff14 =  table2array(lt_XCT1(:,8)) -  table2array(lt_uCT(:,8)) ;

mycorr_plot(mean13, diff13, mean14, diff14,'Mean rTb.N', 'Difference');

%% pTb.Th
% subplot(2,4,4);
% mycorr_plot(table2array(lr_XCT2(:,9)),table2array(lr_uCT(:,9)),table2array(lt_XCT2(:,9)),table2array(lt_uCT(:,9)),'pTb.Th');

subplot(3,6,9);

mean7 = ( table2array(lr_XCT1(:,9)) +  table2array(lr_uCT(:,9)) )/2;
diff7 =  table2array(lr_XCT1(:,9)) -  table2array(lr_uCT(:,9)) ;

mean8 = ( table2array(lt_XCT1(:,9)) +  table2array(lt_uCT(:,9)) )/2;
diff8 =  table2array(lt_XCT1(:,9)) -  table2array(lt_uCT(:,9)) ;

mycorr_plot(mean7, diff7, mean8, diff8,'Mean pTb.Th', 'Difference');

%% rTb.Th
subplot(3,6,10);
%mycorr_plot(table2array(lr_XCT2(:,10)),table2array(lr_uCT(:,10)),table2array(lt_XCT2(:,10)),table2array(lt_uCT(:,10)),'rTb.Th');

mean15 = ( table2array(lr_XCT1(:,10)) +  table2array(lr_uCT(:,10)) )/2;
diff15 =  table2array(lr_XCT1(:,10)) -  table2array(lr_uCT(:,10)) ;

mean16 = ( table2array(lt_XCT1(:,10)) +  table2array(lt_uCT(:,10)) )/2;
diff16 =  table2array(lt_XCT1(:,10)) -  table2array(lt_uCT(:,10)) ;

mycorr_plot(mean15, diff15, mean16, diff16,'Mean rTb.Th', 'Difference');

%% pTb.S
subplot(3,6,11);
%mycorr_plot(table2array(lr_XCT2(:,10)),table2array(lr_uCT(:,10)),table2array(lt_XCT2(:,10)),table2array(lt_uCT(:,10)),'rTb.Th');

mean15 = ( table2array(lr_XCT1(:,10)) +  table2array(lr_uCT(:,10)) )/2;
diff15 =  table2array(lr_XCT1(:,10)) -  table2array(lr_uCT(:,10)) ;

mean16 = ( table2array(lt_XCT1(:,10)) +  table2array(lt_uCT(:,10)) )/2;
diff16 =  table2array(lt_XCT1(:,10)) -  table2array(lt_uCT(:,10)) ;

mycorr_plot(mean15, diff15, mean16, diff16,'Mean pTb.S', 'Difference');

%% rTb.l
subplot(3,6,12);
%mycorr_plot(table2array(lr_XCT2(:,10)),table2array(lr_uCT(:,10)),table2array(lt_XCT2(:,10)),table2array(lt_uCT(:,10)),'rTb.Th');

mean15 = ( table2array(lr_XCT1(:,10)) +  table2array(lr_uCT(:,10)) )/2;
diff15 =  table2array(lr_XCT1(:,10)) -  table2array(lr_uCT(:,10)) ;

mean16 = ( table2array(lt_XCT1(:,10)) +  table2array(lt_uCT(:,10)) )/2;
diff16 =  table2array(lt_XCT1(:,10)) -  table2array(lt_uCT(:,10)) ;

mycorr_plot(mean15, diff15, mean16, diff16,'Mean rTb.l', 'Difference');


%% PP Junc. D.
subplot(3,6,13);
% mycorr_plot(table2array(lr_XCT2(:,16)),table2array(lr_uCT(:,16)),table2array(lt_XCT2(:,16)),table2array(lt_uCT(:,16)),'PR Ratio');


%subplot(2,4,6);

mean9 = ( table2array(lr_XCT1(:,16)) +  table2array(lr_uCT(:,16)) )/2;
diff9 =  table2array(lr_XCT1(:,16)) -  table2array(lr_uCT(:,16)) ;

mean10 = ( table2array(lt_XCT1(:,16)) +  table2array(lt_uCT(:,16)) )/2;
diff10 =  table2array(lt_XCT1(:,16)) -  table2array(lt_uCT(:,16)) ;

mycorr_plot(mean9, diff9, mean10, diff10,'Mean PP Junc. D.', 'Difference');


%% PR Junc. D.
subplot(3,6,14);
% mycorr_plot(table2array(lr_XCT2(:,16)),table2array(lr_uCT(:,16)),table2array(lt_XCT2(:,16)),table2array(lt_uCT(:,16)),'PR Ratio');


%subplot(2,4,6);

mean9 = ( table2array(lr_XCT1(:,16)) +  table2array(lr_uCT(:,16)) )/2;
diff9 =  table2array(lr_XCT1(:,16)) -  table2array(lr_uCT(:,16)) ;

mean10 = ( table2array(lt_XCT1(:,16)) +  table2array(lt_uCT(:,16)) )/2;
diff10 =  table2array(lt_XCT1(:,16)) -  table2array(lt_uCT(:,16)) ;

mycorr_plot(mean9, diff9, mean10, diff10,'Mean PR Junc. D.', 'Difference');

%% RR Junc. D.
subplot(3,6,15);
% mycorr_plot(table2array(lr_XCT2(:,16)),table2array(lr_uCT(:,16)),table2array(lt_XCT2(:,16)),table2array(lt_uCT(:,16)),'PR Ratio');


%subplot(2,4,6);

mean9 = ( table2array(lr_XCT1(:,16)) +  table2array(lr_uCT(:,16)) )/2;
diff9 =  table2array(lr_XCT1(:,16)) -  table2array(lr_uCT(:,16)) ;

mean10 = ( table2array(lt_XCT1(:,16)) +  table2array(lt_uCT(:,16)) )/2;
diff10 =  table2array(lt_XCT1(:,16)) -  table2array(lt_uCT(:,16)) ;

mycorr_plot(mean9, diff9, mean10, diff10,'Mean RR Junc. D.', 'Difference');

%% PR Ratio
subplot(3,6,16);
% mycorr_plot(table2array(lr_XCT2(:,16)),table2array(lr_uCT(:,16)),table2array(lt_XCT2(:,16)),table2array(lt_uCT(:,16)),'PR Ratio');


%subplot(2,4,6);

mean9 = ( table2array(lr_XCT1(:,16)) +  table2array(lr_uCT(:,16)) )/2;
diff9 =  table2array(lr_XCT1(:,16)) -  table2array(lr_uCT(:,16)) ;

mean10 = ( table2array(lt_XCT1(:,16)) +  table2array(lt_uCT(:,16)) )/2;
diff10 =  table2array(lt_XCT1(:,16)) -  table2array(lt_uCT(:,16)) ;

mycorr_plot(mean9, diff9, mean10, diff10,'Mean PR Ratio', 'Difference');


