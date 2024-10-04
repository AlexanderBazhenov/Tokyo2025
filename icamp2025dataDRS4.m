% 2024-10-04
% Tokyo icamp2025 DATA v2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [b_in_left, b_in_right, b_ex_left, b_ex_right] = DataRegressionInfSup(yarrayint, yarrayout)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = [ -0.027	-0.205	-0.471	-0.492	0.061	0.225	0.43	0	0 ]
[Xs, inds] = sort(X);
inds = [4 3 2 1 8 9 5 6 7]
xx = Xs'
xx = [xx.^0 xx]
b_ex_left = [1579 1807 5290 7597 7952 7957 8746 10875 13555]'
b_ex_left = sort (b_ex_left)
b_ex_rigth = [1659 1937 5362 7665 8012 8027 8802 10938 13631]'
b_ex_rigth = sort(b_ex_rigth)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b_in_left = [7649	5346	1918	1638	8783	10916	13607	8004	7995]'
b_in_left = sort( b_in_left)
b_in_rigth = [ 7649	5346	1918	1638	8783	10916	13607	8004	7995 ]'
b_in_rigth = sort(b_in_rigth)
%
 indtoout = [ 9 7 2]
b_easy_left = b_in_left
b_easy_left(indtoout) = b_ex_left(indtoout)
b_easy_rigth = b_in_rigth
b_easy_rigth(indtoout) = b_ex_rigth(indtoout)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx4opt = [ xx', xx', xx', xx' ]'
b_opt_left4 = [ b_in_left', b_in_left', b_ex_left', b_ex_left' ]'
b_opt_rigth4 = [ b_in_rigth', b_ex_rigth', b_in_rigth', b_ex_rigth']'
[tolmax,argmax, env] = tolsolvty(xx4opt,xx4opt,b_opt_left4,b_opt_rigth4,1)
  [envnegind, envneg] = find(env(:,2) < 0);
  indtoout = env(envnegind,1);
xx4opt (indtoout, :) = []
b_opt_left4  (indtoout, :) = []
b_opt_rigth4  (indtoout, :) = []
[tolmax,argmax, env] = tolsolvty(xx4opt,xx4opt,b_opt_left4,b_opt_rigth4,1)
