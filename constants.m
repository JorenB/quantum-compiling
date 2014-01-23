classdef constants
	properties (Constant = true)
		% rounding error tolerance
		RE = 0.00000000005;

		I = sqrt(-1);
		TAU = (sqrt(5) - 1)/2;
		IPI = sqrt(-1) * pi;
		
		ID = [1 0; 0 1];
		X = [0 1; 1 0];
		Y = [0 -constants.I; constants.I 0];
		Z = [1 0; 0 -1];
		H = [1 1; 1 -1]/sqrt(2);
		T = [1 0; 0 exp(constants.IPI/4)];
		
		%MATRICES = {[exp(-2*1i*pi/3), 0, 0; 0, exp(2*1i*pi/3), 0; 0, 0, exp(1i*pi/3)], [1/2*(-1)^(2/3), 1/sqrt(2)*(-1)^(1/3), -1/2 * (-1)^(2/3); 1/sqrt(2) * (-1)^(1/3), 0, 1/sqrt(2) * (-1)^(1/3); -1/2 * (-1)^(2/3), 1/sqrt(2) * (-1)^(1/3), 1/2 * (-1)^(2/3)], [exp(2*i*pi/3), 0, 0; 0, exp(-2*i*pi/3), 0; 0, 0, exp(-i*pi/3)], [1/2*(-1)^(-2/3), 1/sqrt(2)*(-1)^(-1/3), -1/2 * (-1)^(-2/3); 1/sqrt(2) * (-1)^(-1/3), 0, 1/sqrt(2) * (-1)^(-1/3); -1/2 * (-1)^(-2/3), 1/sqrt(2) * (-1)^(-1/3), 1/2 * (-1)^(-2/3)] };
		MATRICES = {[exp(4 * constants.IPI / 5) 0; 0 -exp(-2 * constants.IPI / 5) ] , [(-constants.TAU*exp(-constants.IPI/5)) (-constants.I * sqrt(constants.TAU) * exp(-constants.IPI / 10)) ; (-constants.I * sqrt(constants.TAU) *exp(-constants.IPI/10)) (-constants.TAU)], [exp(-4 * constants.IPI / 5) 0 ; 0 -exp(2 * constants.IPI / 5)], [(-constants.TAU*exp(constants.IPI/5)) (constants.I * sqrt(constants.TAU) * exp(constants.IPI / 10)) ; (constants.I * sqrt(constants.TAU) *exp(constants.IPI/10)) (-constants.TAU)]};

		%MATRICES = {[exp(4 * constants.IPI / 5) 0 0; 0 -exp(-2 * constants.IPI / 5) 0; 0 0 -exp(-2 * constants.IPI / 5)], [(-constants.TAU*exp(-constants.IPI/5)) (-constants.I * sqrt(constants.TAU) * exp(-constants.IPI / 10)) 0; (-constants.I * sqrt(constants.TAU) *exp(-constants.IPI/10)) (-constants.TAU) 0; 0 0 (-exp(2*constants.IPI/5))], [exp(-4 * constants.IPI / 5) 0 0; 0 -exp(2 * constants.IPI / 5) 0; 0 0 -exp(2 * constants.IPI / 5)], [(-constants.TAU*exp(constants.IPI/5)) (constants.I * sqrt(constants.TAU) * exp(constants.IPI / 10)) 0; (constants.I * sqrt(constants.TAU) *exp(constants.IPI/10)) (-constants.TAU) 0; 0 0 (-exp(-2*constants.IPI/5))]};

%MATRICES = {[0 1 0; 1 0 0; 0 0 1], [1 0 0; 0 0 1; 0 1 0], [0 0 1; 1 0 0; 0 1 0]};

     %MATRICES = {[exp(4 * constants.IPI / 5) 0 ; 0 -exp(-2 * constants.IPI / 5)], ...
%         [(-constants.TAU*exp(-constants.IPI/5)) ...
%         (-constants.I * sqrt(constants.TAU) * exp(-constants.IPI / 10)) ; ...
%         (-constants.I * sqrt(constants.TAU) *exp(-constants.IPI/10)) ...
%         (-constants.TAU)], ...
%         [exp(-4 * constants.IPI / 5) 0 ; 0 -exp(2 * constants.IPI / 5)], ...
%         [(-constants.TAU*exp(constants.IPI/5)) ...
%         (constants.I * sqrt(constants.TAU) * exp(constants.IPI / 10)) ; ...
%         (constants.I * sqrt(constants.TAU) *exp(constants.IPI/10)) ...
%         (-constants.TAU) ]};

	end
end
