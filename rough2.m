close all
clear all

figure

for i = 1:4
    subplot(2,2,i)
    p = rand(1,10);
    plot([1:10],p)
    ax = gca;
    set(ax,'buttonDownFcn',@myfunction,'UserData',p);
    if ax.UserData ==1
        plotter(p)
    end
end

function myfunction(hObject,eventData)
% hObject.UserData = 1;
plotter(hObject.UserData)
end
function plotter(p)
figure(2);
plot([1:10],p)
fighandles = findobj('Type','figure');
set(0,'currentfigure',fighandles(1))
end
% for i = 1:1:10
%     plot([1:5],rand(1,5))
%     ax = gca;
%     ax.UserData
%     set(gca,'UserData',1)
%     ax.UserData
% end










% hfig = figure
% subplot(1,2,1)
% ax = gca
% set(ax, 'buttonDownFcn', @changecolor)
% h = line
% set(h,'HitTest','off')
% set(h, 'linewidth',8)
% % set(h, 'buttonDownFcn', @changecolor)
% subplot(1,2,2)
% h = line
% set(h, 'linewidth',9)
% set(h,'HitTest','off')
% % set(h, 'buttonDownFcn', @changecolor)
% ax2 = gca
% set(ax2, 'buttonDownFcn', @changecolor)
% 
% 
% 
% function changecolor(hObject, eventData)
% eventData
% hObject
%     hand = findobj('Type','axes')
%     class(hand)
%      hand = flip(hand)
% %     if hObject == hand(1)
%         set(hObject,'color',rand(1,3))
% %     end
% end

















%    






% function buttonPlot
% fig = uifigure;
% 
% ax = uiaxes('Parent',fig,...
%             'Units','pixels',...
%             'Position', [104, 123, 300, 201]);   
% 
% btn = uibutton(fig,'push',...
%                'Position',[420, 218, 100, 22],...
%                'ButtonPushedFcn', @(btn,event) plotButtonPushed(btn,ax));
% end
% 
% % Create the function for the ButtonPushedFcn callback
% function plotButtonPushed(btn,ax)
% I = imread('parkavenue.jpg');
% imshow(I,'Parent', ax);
% 
% end