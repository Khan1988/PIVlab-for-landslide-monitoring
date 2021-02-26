function [sectioned_roi,sectioned_vecs] = gererate_sections(x,y,u,v,roirect,columns,rows)
rec_height = roirect(4)/rows; %Length of one cell
rec_len = roirect(3)/columns;    %Width of one cell
sectioned_roi = cell(rows,columns);
sectioned_vecs = cell(rows,columns);
U = sqrt(u.^2 + v.^2);
tu = U((size(U,1)-rem(size(U,1),rows)+1):size(U,1),:);
tv = U(:,(size(U,2)-rem(size(U,2),columns)+1):size(U,2));
U((size(U,1)-rem(size(U,1),rows)+1):size(U,1),:)=[]; % remove trailing rows
U(:,(size(U,2)-rem(size(U,2),columns)+1):size(U,2))=[]; % romove trailing columns
ch = size(U,1)/rows;  % number of rows of vecs in one cell
cl = size(U,2)/columns;  % number of columns of vecs in one cell
for i=0:1:rows-1
    starty = roirect(2) + i*rec_height;
    for j=0:1:columns-1
        startx = roirect(1) + j*rec_len;
        Rect = [startx, starty, rec_len, rec_height];
        sectioned_roi{i+1,j+1} = Rect;
        sectioned_vecs{i+1,j+1} = U(i*ch+1:(i+1)*ch,j*cl+1:(j+1)*cl); 
        rec = rectangle('position',[Rect],'edgecolor', 'k', 'linewidth',1);
    end
end






