function warn = ShowTimeLapse(x,y,u,v,sectioned_roi,sectioned_vecs,filepath,i1,i2,warn)
alert_win=[];
%%%% Check detect windows that captured movement%%%
for i = 1:1:size(sectioned_vecs,1)
   for j = 1:1:size(sectioned_vecs,2)
       ind = find(sectioned_vecs{i,j}>0);
       if ~isempty(ind)  %not empty
            alert_win = [alert_win;[i,j]]
       end
    end
end
%%%% Check if Time-lapse instance of matlab is already running
[status, str] = system('tasklist');  % Assuming Windows, use 'ps -eaf' on Linux
List    = strsplit(str, '\n');
nMatlab = sum(strncmp(List, 'MATLAB.exe', 10))
save('C:\Users\Khan\OneDrive - Northumbria University - Production Azure AD\Documents\MATLAB\SharedMemory.mat','alert_win','sectioned_roi','sectioned_vecs','i1','i2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~isempty(alert_win)   %Check for movement
    if nMatlab == 1     %Check for inspection screen (1 = OFF, 2=ON)
        !matlab  -batch func2 &
        %!matlab -batch  func2 &
        warn = true;
    end
end
[status, str] = system('tasklist');  % Assuming Windows, use 'ps -eaf' on Linux
List    = strsplit(str, '\n');
nMatlab = sum(strncmp(List, 'MATLAB.exe', 10))
%save('C:\Users\Khan\OneDrive - Northumbria University - Production Azure AD\Documents\MATLAB\SharedMemory.mat','alert_win','sectioned_roi','sectioned_vecs','i1','i2');
% if warn == true && nMatlab == 2
%      save('SharedMemory11.mat','alert_win','sectioned_roi','sectioned_vecs','i1','i2');
% else 
% %     delete('SharedMemory.mat') 
% end



    























% figHandles = findobj('Type', 'figure');
% set(0, 'CurrentFigure', figHandles(1)) ; % give handles back to pivlab
% set(0, 'currentfigure', f);  %# for figures
% set(f, 'currentaxes', axs);
%     for i=1:1:length(alert_win)
%         subplot()
        
        
    
    
% end
   
    
    
    
    







