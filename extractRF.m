for k=4:length(STANDARD)
    cellContents=STANDARD{k};
    RF_X{k-3}=cellContents(1:20);
    RF_Y{k-3}=cellContents(21:33);
    RF_Z{k-3}=cellContents(34:46);
end