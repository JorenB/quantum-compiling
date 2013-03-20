function m = refGates(id) 
switch id
	case 'I'
		m = [1 0; 0 1];
	case 'H'
		m = 1/sqrt(2) * [1 1; 1 -1];
end

end
