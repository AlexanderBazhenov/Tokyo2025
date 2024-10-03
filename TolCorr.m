
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
dirroot = 'D:\ST\2024\T\'
dirki = 'D:\ST\2024\T\kinterval-0.0.1'
dirData = 'D:\ST\2024\T\icamp2025\'
dirData = 'd:\ST\2023\T\icamp2025v2\'
dir2023 =  'd:\ST\2023\T\'
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

Ys = infsup(b_ex_left, b_ex_rigth)
##y = mid(Ys)/16384-0.5;
##epsilon = rad(Ys)/16384;
y = mid(Ys); %-16384*0.5;
epsilon = rad(Ys);
[tolmax,argmax, env] = tolsolvty(xx,xx,y-epsilon,y+epsilon,1);
