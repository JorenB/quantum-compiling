function vector = unitaryTo4Vector(matrix)

block = matrix(1,1:2);

vector = [real(block(1)); imag(block(1)); -real(block(2)); imag(block(2))];

end

