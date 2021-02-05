%% XCT1 vs uCT
column = ["BV/TV","pBV/TV","rBV/TV","aBV/TV","pBV/BV","rBV/BV","pTb.N","rTb.N","pTb.Th","rTb.Th","pTb.S","rTb.l","PP Junc D","PR Junc D","RR Junc D", "PR Ratio","PR N Ratio"];

for i=1:17
    subplot(3,6,i);
    %mycorr_plot(table2array(lr_XCT2(:,3)),table2array(lr_uCT(:,3)),table2array(lt_XCT2(:,3)),table2array(lt_uCT(:,3)),'rBV/TV');

    mean1 = ( table2array(lr_XCT1(:,i)) +  table2array(lr_uCT(:,i)) )/2;
    diff1 =  table2array(lr_XCT1(:,i)) -  table2array(lr_uCT(:,i)) ;

    mean2 = ( table2array(lt_XCT1(:,i)) +  table2array(lt_uCT(:,i)) )/2;
    diff2 =  table2array(lt_XCT1(:,i)) -  table2array(lt_uCT(:,i)) ;

    x_axis = ['Average ' + column(i)];
    mycorr_plot(mean1, diff1, mean2, diff2, x_axis, 'Difference (XCT1 - \muCT)');

end

%% XCT2 vs uCT
column = ["BV/TV","pBV/TV","rBV/TV","aBV/TV","pBV/BV","rBV/BV","pTb.N","rTb.N","pTb.Th","rTb.Th","pTb.S","rTb.l","PP Junc D","PR Junc D","RR Junc D", "PR Ratio","PR N Ratio"];

for i=1:17
    subplot(3,6,i);

    mean1 = ( table2array(lr_XCT2(:,i)) +  table2array(lr_uCT_2(:,i)) )/2;
    diff1 =  table2array(lr_XCT2(:,i)) -  table2array(lr_uCT_2(:,i)) ;

    mean2 = ( table2array(lt_XCT2(:,i)) +  table2array(lt_uCT_2(:,i)) )/2;
    diff2 =  table2array(lt_XCT2(:,i)) -  table2array(lt_uCT_2(:,i)) ;

    x_axis = ['Average ',column{i}];
    mycorr_plot(mean1, diff1, mean2, diff2, x_axis, 'Difference (XCT2 - \muCT)');

end

%% XCT1 vs XCT2
column = ["BV/TV","pBV/TV","rBV/TV","aBV/TV","pBV/BV","rBV/BV","pTb.N","rTb.N","pTb.Th","rTb.Th","pTb.S","rTb.l","PP Junc D","PR Junc D","RR Junc D", "PR Ratio","PR N Ratio"];
for i=1:17
    subplot(3,6,i);
    %mycorr_plot(table2array(lr_XCT2(:,3)),table2array(lr_uCT(:,3)),table2array(lt_XCT2(:,3)),table2array(lt_uCT(:,3)),'rBV/TV');

    mean1 = ( table2array(lr_XCT1_2(:,i)) +  table2array(lr_XCT2_2(:,i)) )/2;
    diff1 =  table2array(lr_XCT1_2(:,i)) -  table2array(lr_XCT2_2(:,i)) ;

    mean2 = ( table2array(lt_XCT1_2(:,i)) +  table2array(lt_XCT2_2(:,i)) )/2;
    diff2 =  table2array(lt_XCT1_2(:,i)) -  table2array(lt_XCT2_2(:,i)) ;

    x_axis = ['Average ',column{i}];
    mycorr_plot(mean1, diff1, mean2, diff2, x_axis, 'Difference (XCT1 -XCT2)');

end