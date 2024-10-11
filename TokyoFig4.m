% 2024-10-11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tokyo fig 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NonCompCh1 = NonComp(1:1024);
figure
hist(NonCompCh1, max(NonCompCh1))
xlabel('Number of equations with Tol_{i} < 0')
ylabel('Count')
xlim([-0.2 9.2])
set(gca, 'fontsize', 14);
xticks(0:max(NonCompCh1))
titlestr=strcat("HIST Number of non-compatible data internal Q1-Q3 Channel =", num2str(ch))
title("")
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

