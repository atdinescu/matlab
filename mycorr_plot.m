function mycorr_plot(xo,yo,x1,y1,x_axis_title, y_axis_title, plot_title)

    scatter(xo,yo,50,'x','k');
    hold on; axis square; box on;

    X = [ones(length(xo),1) xo];
    b = X\yo;
    yCalc = X*b;
    plot(xo,yCalc,'-k');

    scatter(x1,y1,50,'o','filled','k');
    X1 = [ones(length(x1),1) x1];
    b1 = X1\y1;
    yCalc1 = X1*b1;
    plot(x1,yCalc1,'-k');
    
    ax = gca;
    ax.XAxis.FontSize = 18;
    ax.XAxis.FontWeight = 'bold';
    ax.YAxis.FontSize = 18;
    ax.YAxis.FontWeight = 'bold';
    ax.LineWidth = 1.5;
    
    xlabel(x_axis_title, 'fontweight','bold', 'FontName', 'Arial', 'FontSize', 20);
    ylabel(y_axis_title,'fontweight','bold', 'FontName', 'Arial', 'FontSize', 20);
    title(plot_title, 'FontName', 'Arial', 'FontSize', 20);
    
    Rsq = 1 - sum((yo - yCalc).^2)/sum((yo - mean(yo)).^2);
    Rsq1 = 1 - sum((y1 - yCalc1).^2)/sum((y1 - mean(y1)).^2);
    
    NW = [min(xlim) max(ylim)]+[diff(xlim) -diff(ylim)]*0.05;
    NW2 = [min(xlim) max(ylim)]+[diff(xlim)*0.05 -diff(ylim)*0.15];
    NW3 = [min(xlim) max(ylim)]+[diff(xlim)*0.05 -diff(ylim)*0.25];
    NW4 = [min(xlim) max(ylim)]+[diff(xlim)*0.05 -diff(ylim)*0.35];
    
    txt1 = ['y = ' num2str(b(2),2) 'x + ' num2str(b(1),2) ' R^2 = ' num2str(Rsq,2)]; 
    text(NW(1), NW(2), txt1, 'Color', 'k','FontSize', 14, 'fontweight','bold');
    
%     txt2 = ['R^2 = ' num2str(Rsq,2)];
%     text(NW2(1),NW2(2), txt2, 'Color', 'k','FontSize', 14, 'fontweight','bold');
%     
    txt3 = ['y = ' num2str(b1(2),2) 'x + ' num2str(b1(1),2) ' R^2 = ' num2str(Rsq1,2)];
    text(NW2(1),NW2(2), txt3, 'Color', 'k','FontSize', 14, 'fontweight','bold');
    
%     txt4 = ['R^2 = ' num2str(Rsq1,2)];
%     text(NW4(1),NW4(2), txt4, 'Color', 'k','FontSize', 14, 'fontweight','bold');

    hold off;
    
end