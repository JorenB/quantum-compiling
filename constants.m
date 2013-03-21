classdef constants
	properties (Constant = true)
		I = sqrt(-1);
		TAU = (sqrt(5) - 1)/2;
		IPI = sqrt(-1) * pi;
		
		MATRICES = {[exp(4 * constants.IPI / 5) 0 0; 0 -exp(-2 * constants.IPI / 5) 0; 0 0 -exp(-2 * constants.IPI / 5)], [(-constants.TAU*exp(-constants.IPI/5)) (-constants.I * sqrt(constants.TAU) * exp(-constants.IPI / 10)) 0; (-constants.I * sqrt(constants.TAU) *exp(-constants.IPI/10)) (-constants.TAU) 0; 0 0 (-exp(2*constants.IPI/5))], [exp(-4 * constants.IPI / 5) 0 0; 0 -exp(2 * constants.IPI / 5) 0; 0 0 -exp(2 * constants.IPI / 5)], [(-constants.TAU*exp(constants.IPI/5)) (constants.I * sqrt(constants.TAU) * exp(constants.IPI / 10)) 0; (constants.I * sqrt(constants.TAU) *exp(constants.IPI/10)) (-constants.TAU) 0; 0 0 (-exp(-2*constants.IPI/5))]};
%		MATRICES{2} = Inv(MATRICES{1});
%		MATRICES{4} = Inv(MATRICES{3});
	end
end
