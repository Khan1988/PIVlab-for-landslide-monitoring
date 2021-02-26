function [u, v] = CF(x,y,u1,u2,v1,v2)
%%%%%%%%%% frame 1 (u1,v1) %%%%%%%%%%%%%%
u1(isnan(u1)) = 1;    % to increase dissimlarity with frame 2
v1(isnan(v1)) = 1;    % to increase dissimlarity with frame 2
v1(v1<0.2)=1;         % remove small vectors
u1(v1==0)=1;
%%%%%%%%%% frame 2 (u2,v2) %%%%%%%%%%%%%%%
u2(isnan(u2)) = -1;
v2(isnan(v2)) = -1;
v2(v2<0.2)=-1;
u2(v2==0)=-1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Similarity = zeros(size(u2));
for i = 1:1:size(u1,1)
    for j = 1:1:size(u1,2)
        vec1 = [u1(i,j);v1(i,j)];
        vec2 = [u2(i,j);v2(i,j)];
        Similarity(i,j) = getCosineSimilarity(vec1,vec2);
    end
end
Similarity(isnan(Similarity)) = 0;     % if any
u = u2; v = v2;
u(Similarity<0.98) = 0;
v(Similarity<0.98) = 0;
% figure(2);
% subplot(1,3,1);
% quiver(x,y,u1,v1);
% subplot(1,3,2);
% quiver(x,y,u2,v2)
% subplot(1,3,3);
% quiver(x,y,u,v);
 %set(0, 'currentfigure', figHandles(1)); % give handles back to GUI