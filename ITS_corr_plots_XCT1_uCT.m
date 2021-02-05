%mycorr_plot


%% BV/TV
subplot(2,4,1);
mycorr_plot(table2array(lr_XCT1_2(:,1)),table2array(lr_uCT_XCT1(:,1)),table2array(lt_XCT1_2(:,1)),table2array(lt_uCT_XCT1(:,1)),'BV/TV');

%% pBV/TV
subplot(2,4,2);
mycorr_plot(table2array(lr_XCT1_2(:,2)),table2array(lr_uCT_XCT1(:,2)),table2array(lt_XCT1_2(:,2)),table2array(lt_uCT_XCT1(:,2)),'pBV/TV');

%% pTb.N
subplot(2,4,3);
mycorr_plot(table2array(lr_XCT1_2(:,7)),table2array(lr_uCT_XCT1(:,7)),table2array(lt_XCT1_2(:,7)),table2array(lt_uCT_XCT1(:,7)),'pTb.N');

%% pTb.Th
subplot(2,4,4);
mycorr_plot(table2array(lr_XCT1_2(:,9)),table2array(lr_uCT_XCT1(:,9)),table2array(lt_XCT1_2(:,9)),table2array(lt_uCT_XCT1(:,9)),'pTb.Th');

%% PR ratio
subplot(2,4,5);
mycorr_plot(table2array(lr_XCT1_2(:,16)),table2array(lr_uCT_XCT1(:,16)),table2array(lt_XCT1_2(:,16)),table2array(lt_uCT_XCT1(:,16)),'PR Ratio');

%% rBV/TV
subplot(2,4,6);
mycorr_plot(table2array(lr_XCT1_2(:,3)),table2array(lr_uCT_XCT1(:,3)),table2array(lt_XCT1_2(:,3)),table2array(lt_uCT_XCT1(:,3)),'rBV/TV');

%% rTb.N
subplot(2,4,7);
mycorr_plot(table2array(lr_XCT1_2(:,8)),table2array(lr_uCT_XCT1(:,8)),table2array(lt_XCT1_2(:,8)),table2array(lt_uCT_XCT1(:,8)),'rTb.N');

%% rTb.Th
subplot(2,4,8);
mycorr_plot(table2array(lr_XCT1_2(:,10)),table2array(lr_uCT_XCT1(:,10)),table2array(lt_XCT1_2(:,10)),table2array(lt_uCT_XCT1(:,10)),'rTb.Th');