% 2024-10-03
% forecast corridor
% external
y_ex = (b_ex_left + b_ex_rigth)/2;
epsilon_ex = (-b_ex_left + b_ex_rigth)/2;
irp_T2025_ex = ir_problem(xx, y_ex, epsilon_ex);
b_ex = ir_outer(irp_T2025_ex);

% easy
y_easy = (b_easy_left + b_easy_rigth)/2;
epsilon_easy = (-b_easy_left + b_easy_rigth)/2;
irp_T2025_easy = ir_problem(xx, y_easy, epsilon_easy);
%ir_plotbeta(irp_T2025_easy)

% opt
y_opt = (b_opt_left4 + b_opt_rigth4)/2;
epsilon_opt= (-b_opt_left4 + b_opt_rigth4)/2;
irp_T2025_opt = ir_problem(xx4opt, y_opt, epsilon_opt);
%
##ir_plotbeta(irp_T2025_opt)
##titlestr=strcat('Information set', ' icamp2025=', ' ex', ' easy', ' opt')
##titlestr=strcat('Information set', ' icamp2025v2=', ' ex', ' easy', ' opt')
##title(titlestr)
##figure_name_out=strcat(titlestr, '.png')
##print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
xlimits = [0 10];
% xlimits = [0 3];
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pcolor = [0.7 0.9 0.7]
%pcolor = 2*Pantone
[px,py]= ir_plotmodelset_c(irp_T2025_ex, xlimits, pcolor)
 h1 =  patch(px,py,pcolor);
##   plot(px,py(:,1),"m-","LineWidth",1, "color", 0.5*pcolor);
##   plot(x,yp(:,2),"m-","LineWidth",1, "color", 0.5*pcolor);


%
pcolor = [0.9 0.7 0.7]
%pcolor = RoyalMail
[px,py]= ir_plotmodelset_c(irp_T2025_easy, xlimits, pcolor)
 h2 =  patch(px,py,pcolor);
% set(h2, 'facecolor', 0.9*RoyalMail)

pcolor = [0.7 0.7 0.9]
%pcolor = OxfordBlue
[px,py]=  ir_plotmodelset_c(irp_T2025_opt, xlimits, pcolor)
 h3 =  patch(px,py,pcolor);
% set(h3, 'facecolor', 1.3*OxfordBlue)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h4 = errorbar(xx(:,1)-0.1, y_ex, epsilon_ex,'.g');
pcolor = [0.7 0.9 0.7]
set(h4, 'color', 0.5*pcolor )
%h5 = errorbar(xx(:,1), y_in, epsilon_in,'.b');
h5 = errorbar(xx(:,1), y_easy, epsilon_easy,'.r');
pcolor = [0.9 0.35 0.35]
set(h5, 'color', pcolor)
% seek min eps
minind_array = zeros(length(xx),1)
xx4eq = xx4opt(:, 1)
for ii=1:length(xx)
  [indnow, indnow2]  = find(xx4eq == ii)
  xxnow = xx4eq(indnow)
  epsilonnow = epsilon_opt(indnow)
  [mineps, minind ] = min(epsilonnow)
  minind_array (ii) =  indnow(minind )
end
% seek min eps
%h6 = errorbar(xx4opt(:,1)+0.1, y_opt, epsilon_opt,'.b');
h6 = errorbar(xx4opt(minind_array,1)+0.1, y_opt(minind_array), epsilon_opt(minind_array),'.b');
pcolor = [ 0.7 0.7 0.9]
set(h6, 'color', 0.2*pcolor)


lgd123 = legend([h1 h2 h3 h4 h5 h6], ...
  {'external', 'method1', 'method2', 'external errors', 'method1 errors', 'method2 errors'})
set(lgd123, 'location', 'north')
set(lgd123, 'fontsize', 14)

xticks([1:9])
grid on
set(gca, 'fontsize', 14)
xlabel('\it x')
ylabel('Data')
titlestr = strcat('Set of models compatible with data and constraints', ' Tokyo2025 v2')
%title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2024-10-11
figure
xlimits = [0 10];
hold on

ForecastBands

hin = errorbar(xx(:,1), y_ex, epsilon_ex/5,'.k');
pcolor = [0 0 0]
set(hin, 'color', pcolor )
hex = errorbar(xx(:,1), y_ex, epsilon_ex,'.k');

lgd1234 = legend([h1 h2 h3 hex ], ...
  {'external', 'method1', 'method2', 'twin data'})
set(lgd1234, 'location', 'north')
set(lgd1234, 'fontsize', 14)


xticks([1:9])
grid on
set(gca, 'fontsize', 14)
xlabel('\it x')
ylabel('\it y')
titlestr = strcat('Set of models compatible with data and constraints', ' Tokyo2025 v2')
%title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2024-10-16

figure
xlimits = [0 10];
% xlimits = [0 3];
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pcolor = [0.7 0.9 0.7]
[px,py]= ir_plotmodelset_c(irp_T2025_ex, xlimits, pcolor)
 h1 =  patch(px,py,pcolor);
%
pcolor = [0.9 0.7 0.7]
[px,py]= ir_plotmodelset_c(irp_T2025_easy, xlimits, pcolor)
 h2 =  patch(px,py,pcolor);

hin = errorbar(xx(:,1), y_ex, epsilon_easy,'.k');
pcolor = [0 0 0]
set(hin, 'color', pcolor )
hex = errorbar(xx(:,1), y_ex, epsilon_ex,'.k');

lgd123 = legend([h1 h2 hex ], ...
  {'external', 'internal', 'twin data'})
set(lgd123, 'location', 'north')
set(lgd123, 'fontsize', 14)

xticks([0:3])
grid on
set(gca, 'fontsize', 14)
xlabel('\it x')
ylabel('\it y')
titlestr = strcat('Set of models compatible with data and constraints', ' SimpleTwinData')
%title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd

