% 2024-10-02
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
% 2024-10-11
% External - Green
 [V,P1,P2,P3,P4]=EqnTol2D(xx,xx,b_ex_left,b_ex_rigth)
 pcolor = [0.7 0.9 0.7]
 p1 =  fill(P1(:,1),P1(:,2), pcolor)
%  Easy = method 1 - RED
 [V,P1,P2,P3,P4]=EqnTol2D(xx,xx,b_easy_left,b_easy_rigth)
 pcolor = [0.9 0.7 0.7]
 p2 = fill(P1(:,1),P1(:,2),pcolor)
% Method 2 - Blue
 [V,P1,P2,P3,P4]=EqnTol2D(xx4opt,xx4opt,b_opt_left4,b_opt_rigth4)
 pcolor = [0.7 0.7 0.9]
 p3 = fill(P1(:,1),P1(:,2), pcolor)
 %
 lgd123 = legend( [p1 p2 p3],   {'external', 'method 1', 'method 2'})
set(lgd123, 'location', 'north')
set(lgd123, 'fontsize', 14)
%
grid on
set(gca, 'fontsize', 14)
xlabel('\it \beta_1')
ylabel('\it \beta_0')
titlestr=strcat('Information sets', ' icamp2025v2')
%title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

