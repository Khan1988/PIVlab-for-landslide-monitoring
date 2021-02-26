function [u, v] = Cosine_Filter(x,y,u1,u2,u3,v1,v2,v3)
Similarity = zeros(size(u2));
for i = 1:1:size(u2,1)
    for j = 1:1:size(u2,2)
        vec1 = [u2(i,j);v2(i,j)];
        vec2 = [u3(i,j);v3(i,j)];
        Similarity(i,j) = getCosineSimilarity(vec1,vec2);
    end
end
%%%%%%%%%%%%%%%%%%%%%

uf = u3;
vf = v3;
uf(Similarity<0.5) = 0;
vf(Similarity<0.5) = 0;
uf(uf<0.2);
vf(vf<0.2);
% figure(2);
% subplot(2,2,1);
% quiver(x,y,u1,v1);
% subplot(2,2,2);
% quiver(x,y,u2,v2)
% subplot(2,2,3);
% quiver(x,y,u3,v3);
% subplot(2,2,4);
% quiver(x,y,uf,vf)
%%%%%%%%%%%%%%%%%%%%%
u = u3;
v = v3;
u(Similarity<0.5) = 0;
v(Similarity<0.5) = 0;
% figure(2)
% quiver(x,y,u,v)
% figure(2);
% subplot(1,3,1);
% quiver(x,y,u2,v2);
% subplot(1,3,2);
% quiver(x,y,u3,v3);
% subplot(1,3,3);
% quiver(x,y,un,vn);
% set(0, 'currentfigure', figHandles(1)); % give handles back to GUI

