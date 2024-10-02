% 2024-10-02
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
%ir_plotbeta(irp_T2025_ex)
 [V,P1,P2,P3,P4]=EqnTol2D(xx,xx,b_ex_left,b_ex_rigth)
 p1 =  fill(P1(:,1),P1(:,2),2*Pantone)
%      plot(P1(:,1),P1(:,2),'o','MarkerFaceColor','k','MarkerSize',3)
 [V,P1,P2,P3,P4]=EqnTol2D(xx,xx,b_easy_left,b_easy_rigth)
 p2 = fill(P1(:,1),P1(:,2),OxfordBlue)
%H2 = Part_SSW_color(P1,P2,P3,P4, OxfordBlue)
 [V,P1,P2,P3,P4]=EqnTol2D(xx4opt,xx4opt,b_opt_left4,b_opt_rigth4)
 p3 = fill(P1(:,1),P1(:,2), RoyalMail)
 %
 lgd123 = legend( [p1 p2 p3],   {'ex', 'easy', 'opt'})
set(lgd123, 'location', 'north')
set(lgd123, 'fontsize', 14)
%
grid on
set(gca, 'fontsize', 14)
xlabel('\beta_0')
ylabel('\beta_1')
titlestr=strcat('Information sets', ' icamp2025v2')
title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

