function [RANDOM] = rand(I)
I = 2045*I+1;
I = I-(I/1048576)*1048575;
RANDOM = double(I+1)/1048577.0;
end
