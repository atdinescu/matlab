%mycorr_plot
% XCT1 vs uCT
column = ["BV/TV","pBV/TV","rBV/TV","aBV/TV","pBV/BV","rBV/BV","pTb.N","rTb.N","pTb.Th","rTb.Th","pTb.S","rTb.l","PP Junc D","PR Junc D","RR Junc D", "PR Ratio","PR N Ratio"];

for i=1:1%17
    subplot(1,1,i);
    mycorr_plot(table2array(lr_XCT1(:,i)),  table2array(lr_uCT(:,i)), table2array(lt_XCT1(:,i)), table2array(lt_uCT(:,i)), 'HR-pQCT I', '\muCT',column{i});
end

%% XCT2 vs uCT
column = ["BV/TV","pBV/TV","rBV/TV","aBV/TV","pBV/BV","rBV/BV","pTb.N","rTb.N","pTb.Th","rTb.Th","pTb.S","rTb.l","PP Junc D","PR Junc D","RR Junc D", "PR Ratio","PR N Ratio"];

for i=1:17
    subplot(3,6,i);
    mycorr_plot(table2array(lr_XCT2(:,i)),  table2array(lr_uCT_2(:,i)), table2array(lt_XCT2(:,i)), table2array(lt_uCT_2(:,i)), 'HR-pQCT II', '\muCT',column{i});
end

%% XCT1 vs XCT2
column = ["BV/TV","pBV/TV","rBV/TV","aBV/TV","pBV/BV","rBV/BV","pTb.N","rTb.N","pTb.Th","rTb.Th","pTb.S","rTb.l","PP Junc D","PR Junc D","RR Junc D", "PR Ratio","PR N Ratio"];

for i=1:17
    subplot(3,6,i);
    mycorr_plot(table2array(lr_XCT1_2(:,i)),  table2array(lr_XCT2_2(:,i)), table2array(lt_XCT1_2(:,i)), table2array(lt_XCT2_2(:,i)), 'HR-pQCT I', 'HR-pQCT II',column{i});

end
