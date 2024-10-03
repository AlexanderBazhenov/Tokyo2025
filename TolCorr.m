
% 2024-09-27
% Tokyo icamp2025
clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2024-08-14
dirroot ='e:\Users\Public\Documents\ST\2024\T\'
dir2023 ='e:\Users\Public\Documents\ST\2023\T\'
dirki ='e:\Users\Public\Documents\ST\2024\T\kinterval-0.0.1\'
% 2024-08-12
dirData = 'e:\Users\Public\Documents\ST\2024\T\icamp2025\'
% 2024-10-02
dirData = 'e:\Users\Public\Documents\ST\2024\T\icamp2025v2\'

% 2024-08-23
% HomePC
##dirroot = 'D:\ST\2024\T\'
##dirki = 'D:\ST\2024\T\kinterval-0.0.1'
##dirData = 'D:\ST\2024\T\icamp2025\'
##dirData = 'd:\ST\2023\T\icamp2025v2\'
##dir2023 =  'd:\ST\2023\T\'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath(dirroot)
addpath(dir2023)
addpath(dirki)

cd(dirroot), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bin ch %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load interval
dirlinprog = 'e:\Users\Public\Documents\ST\2024\T\octave-interval\m'
dirlinprog = 'D:\ST\2024\T\octave-interval\m'
addpath(dirlinprog)
dirlinprogpoly = 'e:\Users\Public\Documents\ST\2024\T\octave-interval\m\polytopes\'
dirlinprogpoly = 'D:\ST\2024\T\octave-interval\m\polytopes\'
addpath(dirlinprogpoly)
%
dir2D = 'e:\Users\Public\Documents\ST\2024\T\IntLinInc2D\'
dir2D = 'D:\ST\2024\T\IntLinInc2D\'
%dirlinprogpoly = 'D:\ST\2024\T\octave-interval\m\polytopes\'
addpath(dir2D)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2024-09-30
% icamp2025data
% 2024-10-02
icamp2025datav2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Colors_special

## [V,P1,P2,P3,P4]=EqnTol2D(xx4opt,xx4opt,b_opt_left4,b_opt_rigth4)
## Part_SSW_color(P1,P2,P3,P4, [ 0 1 0])
##hold on
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##[tolmax,argmax, env] = tolsolvty(xx,xx,b_ex_left,b_ex_rigth,1);
##[tolmax,argmax_in, env_in] = tolsolvty(xx,xx,b_in_left,b_in_rigth,1)
##[tolmax,argmax, env] = tolsolvty(xx,xx,b_easy_left,b_easy_rigth,1);
##
##[tolmax,argmax, env] = tolsolvty(xx4,xx4,b_left4,b_rigth4,1);
##[tolmax,argmax, env] = tolsolvty(xx4opt,xx4opt,b_opt_left4,b_opt_rigth4,1);

##Figures:
##1) ext (A, b_ex), in (A4_opt, b4_opt) simple (A, b_easy).
##2) corridor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##% internal
##y_in = (b_in_left + b_in_rigth)/2;
##epsilon_in = (-b_in_left + b_in_rigth)/2;
##irp_T2025_in = ir_problem(xx, y_in, epsilon_in);
##b_in = ir_outer(irp_T2025_in)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2024-10-02
InfoSet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2024-10-03
ForecastCorridor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


##% external
##y_ex = (b_ex_left + b_ex_rigth)/2;
##epsilon_ex = (-b_ex_left + b_ex_rigth)/2;
##irp_T2025_ex = ir_problem(xx, y_ex, epsilon_ex);
##b_ex = ir_outer(irp_T2025_ex);
##
##% easy
##y_easy = (b_easy_left + b_easy_rigth)/2;
##epsilon_easy = (-b_easy_left + b_easy_rigth)/2;
##irp_T2025_easy = ir_problem(xx, y_easy, epsilon_easy);
##ir_plotbeta(irp_T2025_easy)
##
##% opt
##y_opt = (b_opt_left4 + b_opt_rigth4)/2;
##epsilon_opt= (-b_opt_left4 + b_opt_rigth4)/2;
##irp_T2025_opt = ir_problem(xx4opt, y_opt, epsilon_opt);
##%
####ir_plotbeta(irp_T2025_opt)
####titlestr=strcat('Information set', ' icamp2025=', ' ex', ' easy', ' opt')
####titlestr=strcat('Information set', ' icamp2025v2=', ' ex', ' easy', ' opt')
####title(titlestr)
####figure_name_out=strcat(titlestr, '.png')
####print('-dpng', '-r300', figure_name_out), pwd
##
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##figure
##xlimits = [0 10];
##hold on
##pcolor = [0.7 0.9 0.7]
##pcolor = 2*Pantone
##[px,py]= ir_plotmodelset_c(irp_T2025_ex, xlimits, pcolor)
## h1 =  patch(px,py,pcolor);
####   plot(px,py(:,1),"m-","LineWidth",1, "color", 0.5*pcolor);
####   plot(x,yp(:,2),"m-","LineWidth",1, "color", 0.5*pcolor);
##
##
##%
##pcolor = [0.9 0.7 0.7]
##pcolor = RoyalMail
##[px,py]= ir_plotmodelset_c(irp_T2025_easy, xlimits, pcolor)
## h2 =  patch(px,py,pcolor);
## set(h2, 'facecolor', 0.9*RoyalMail)
##
##pcolor = [0.7 0.7 0.9]
##pcolor = OxfordBlue
##[px,py]=  ir_plotmodelset_c(irp_T2025_opt, xlimits, pcolor)
## h3 =  patch(px,py,pcolor);
## set(h3, 'facecolor', 1.3*OxfordBlue)
##
####
#### %
####ir_scatter(irp_T2025_in,'b.')
####ir_scatter(irp_T2025_ex,'bo')
##
##h4 = errorbar(xx(:,1)-0.1, y_ex, epsilon_ex,'.g');
##set(h4, 'color', Pantone)
##%h5 = errorbar(xx(:,1), y_in, epsilon_in,'.b');
##h5 = errorbar(xx(:,1), y_easy, epsilon_easy,'.r');
##set(h5, 'color', RoyalMail)
##h6 = errorbar(xx4opt(:,1)+0.1, y_opt, epsilon_opt,'.b');
##set(h6, 'color', OxfordBlue)
##
##
##lgd123 = legend([h1 h2 h3 h4 h5 h6], ...
##  {'ex', 'easy', 'opt', 'ex errors', 'easy errors', 'opt errors'})
##set(lgd123, 'location', 'north')
##set(lgd123, 'fontsize', 14)
##
##xticks([1:9])
##
##%ir_scatter(irp_T2025_easy,'bs')
##%ir_scatter(irp_T2025_opt,'kx')
##
##grid on
##set(gca, 'fontsize', 14)
##xlabel('number')
##ylabel('data')
##titlestr = strcat('Set of models compatible with data and constraints', ' Tokyo2025 v2')
##title(titlestr)
##figure_name_out=strcat(titlestr, '.png')
##print('-dpng', '-r300', figure_name_out), pwd

