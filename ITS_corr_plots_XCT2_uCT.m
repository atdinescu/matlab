%mycorr_plot


%% BV/TV
subplot(2,4,1);
mycorr_plot(table2array(lr_XCT2(:,1)),table2array(lr_uCT(:,1)),table2array(lt_XCT2(:,1)),table2array(lt_uCT(:,1)),'BV/TV');

%% pBV/TV
%subplot(2,4,2);
subplot(1,3,2);
mycorr_plot(table2array(lr_XCT2(:,2)),table2array(lr_uCT(:,2)),table2array(lt_XCT2(:,2)),table2array(lt_uCT(:,2)),'pBV/TV');

%% pTb.N
subplot(2,4,3);
mycorr_plot(table2array(lr_XCT2(:,7)),table2array(lr_uCT(:,7)),table2array(lt_XCT2(:,7)),table2array(lt_uCT(:,7)),'pTb.N');

%% pTb.Th
subplot(2,4,4);
mycorr_plot(table2array(lr_XCT2(:,9)),table2array(lr_uCT(:,9)),table2array(lt_XCT2(:,9)),table2array(lt_uCT(:,9)),'pTb.Th');

%% PR ratio
%subplot(2,4,5);
subplot(1,3,1);
mycorr_plot(table2array(lr_XCT2(:,16)),table2array(lr_uCT(:,16)),table2array(lt_XCT2(:,16)),table2array(lt_uCT(:,16)),'PR Ratio');

%% rBV/TV
%subplot(2,4,6);
subplot(1,3,3);
mycorr_plot(table2array(lr_XCT2(:,3)),table2array(lr_uCT(:,3)),table2array(lt_XCT2(:,3)),table2array(lt_uCT(:,3)),'rBV/TV');

%% rTb.N
subplot(2,4,7);
mycorr_plot(table2array(lr_XCT2(:,8)),table2array(lr_uCT(:,8)),table2array(lt_XCT2(:,8)),table2array(lt_uCT(:,8)),'rTb.N');

%% rTb.Th
subplot(2,4,8);
mycorr_plot(table2array(lr_XCT2(:,10)),table2array(lr_uCT(:,10)),table2array(lt_XCT2(:,10)),table2array(lt_uCT(:,10)),'rTb.Th');