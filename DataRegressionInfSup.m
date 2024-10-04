function [b_in_left, b_in_right, b_ex_left, b_ex_right] = DataRegressionInfSup(yarrayint, yarrayout)
% 2024-10-04
b_in_left = inf(yarrayint)';
b_in_right = sup(yarrayint)';
b_ex_left = inf(yarrayout)';
b_ex_right = sup(yarrayout)';
end
