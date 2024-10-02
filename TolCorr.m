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
% 2024-08-22

% 2024-08-23
% HomePC
##dirroot = 'D:\ST\2024\T\'
##dirki = 'D:\ST\2024\T\kinterval-0.0.1'
##dirData = 'D:\ST\2024\T\icamp2025\'
##dir2023 =  'd:\ST\2023\T\'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath(dirroot)
addpath(dir2023)
addpath(dirki)

cd(dirData), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bin ch %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load interval
dirlinprog = 'e:\Users\Public\Documents\ST\2024\T\octave-interval\m'
%dirlinprog = 'D:\ST\2024\T\octave-interval\m'
addpath(dirlinprog)
dirlinprogpoly = 'e:\Users\Public\Documents\ST\2024\T\octave-interval\m\polytopes\'
%dirlinprogpoly = 'D:\ST\2024\T\octave-interval\m\polytopes\'
addpath(dirlinprogpoly)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
icamp2025data

 [V,P1,P2,P3,P4]=EqnTol2D(xx4opt,xx4opt,b_opt_left4,b_opt_rigth4)
 Part_SSW_color(P1,P2,P3,P4, [ 0 1 0])
hold on
%
POS = [ inf(xBeck(1)),inf(xBeck(2)), 2*rad(xBeck(1)),  2*rad(xBeck(2)) ]
rectangle( "Position", POS, "EdgeColor", [0 0 1] )
POS = [ -theta, -theta, 2*theta, 2*theta ]
rectangle( "Position", POS,  "EdgeColor", [1 0 0]  )
xlabel('\it x_1')
ylabel('\it x_2')
set(gca, "Fontsize", 14)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[tolmax,argmax, env] = tolsolvty(xx,xx,b_ex_left,b_ex_rigth,1);
[tolmax,argmax_in, env_in] = tolsolvty(xx,xx,b_in_left,b_in_rigth,1)
[tolmax,argmax, env] = tolsolvty(xx,xx,b_easy_left,b_easy_rigth,1);

[tolmax,argmax, env] = tolsolvty(xx4,xx4,b_left4,b_rigth4,1);
[tolmax,argmax, env] = tolsolvty(xx4opt,xx4opt,b_opt_left4,b_opt_rigth4,1);

##Figures:
##1) ext (A, b_ex), in (A4_opt, b4_opt) simple (A, b_easy).
##2) corridor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% internal
y_in = (b_in_left + b_in_rigth)/2;
epsilon_in = (-b_in_left + b_in_rigth)/2;
irp_T2025_in = ir_problem(xx, y_in, epsilon_in);
b_in = ir_outer(irp_T2025_in)

% external
y_ex = (b_ex_left + b_ex_rigth)/2;
epsilon_ex = (-b_ex_left + b_ex_rigth)/2;
irp_T2025_ex = ir_problem(xx, y_ex, epsilon);
b_ex = ir_outer(irp_T2025_ex);

figure
ir_plotbeta(irp_T2025_ex)
hold on
%ir_plotrect(b_ex,'r-')
grid on
set(gca, 'fontsize', 12)
xlabel('\beta_0')
ylabel('\beta_1')
title('Information set external')
titlestr=strcat('Information set external', ' icamp2025')
title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd
% external

% easy
y_easy = (b_easy_left + b_easy_rigth)/2;
epsilon_easy = (-b_easy_left + b_easy_rigth)/2;
irp_T2025_easy = ir_problem(xx, y_easy, epsilon_easy);
ir_plotbeta(irp_T2025_easy)

% opt
y_opt = (b_opt_left4 + b_opt_rigth4)/2;
epsilon_opt= (-b_opt_left4 + b_opt_rigth4)/2;
irp_T2025_opt = ir_problem(xx4opt, y_opt, epsilon_opt);
ir_plotbeta(irp_T2025_opt)
titlestr=strcat('Information set', ' icamp2025=', ' ex', ' easy', ' opt')
title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
xlimits = [0 10];
hold on
pcolor = [0.7 0.9 0.7]
[px,py]= ir_plotmodelset_c(irp_T2025_ex, xlimits, pcolor)
 h1 =  patch(px,py,pcolor);
##   plot(px,py(:,1),"m-","LineWidth",1, "color", 0.5*pcolor);
##   plot(x,yp(:,2),"m-","LineWidth",1, "color", 0.5*pcolor);


%
pcolor = [0.9 0.7 0.7]
[px,py]= ir_plotmodelset_c(irp_T2025_easy, xlimits, pcolor)
 h2 =  patch(px,py,pcolor);
pcolor = [0.7 0.7 0.9]
[px,py]=  ir_plotmodelset_c(irp_T2025_opt, xlimits, pcolor)
 h3 =  patch(px,py,pcolor);


##
## %
##ir_scatter(irp_T2025_in,'b.')
##ir_scatter(irp_T2025_ex,'bo')

h4 = errorbar(xx(:,1), y_ex, epsilon_ex,'.r');
h5 = errorbar(xx(:,1), y_in, epsilon_in,'.b');


lgd123 = legend([h1 h2 h3 h4 h5], ...
  {'ex', 'easy', 'opt', 'ex dots', 'in dots'})
set(lgd123, 'location', 'north')
set(lgd123, 'fontsize', 12)




xticks([1:9])

%ir_scatter(irp_T2025_easy,'bs')
%ir_scatter(irp_T2025_opt,'kx')

grid on
set(gca, 'fontsize', 12)
xlabel('number')
ylabel('data')
titlestr = 'Set of models compatible with data and constraints'
title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd
