function b = fem2d_tri_lin_global_load(coords, ien)
% Generate the right hand side for $-\nabla^2 u = f$ in 2D case
% using linear basis functions and triangular elements
% [IN]  coords : n * 2 matrix, n is the number of grid points,
%                each row has the x and y coordinate of a grid point
% [IN]  ien    : m * 3 matrix, m is the number of triangular elements,
%                each row has 3 vertex point ids of the element, in 
%                counter clockwise order
% [OUT] n      : n * 1 RHS vector
	
	n = size(coords, 1);
	m = size(ien, 1);
	
	b = zeros(n, 1);
	
	for i_elem = 1 : m
		elem_vertex_ids = ien(i_elem, :);
		vertex_coords = coords(elem_vertex_ids, :)';
		
		ub = fem2d_tri_lin_unit_load(vertex_coords);
		b(elem_vertex_ids) = b(elem_vertex_ids) + ub;
	end
end