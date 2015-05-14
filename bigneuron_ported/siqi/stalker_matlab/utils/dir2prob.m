function P = dir2prob(gtth, gtphi, template_th, template_phi, d)
% Convert the ground truth output spherical directions to a spherical propagation distribution
% sampling according to the template sampling spherical angles
%
% The propagation probabiltiy along a template sampling spherical angle is obtained by 
% convoluting the gaussian distribution generated by each ground truth direction
% 
% The probability along a template angle i considering a ground truth direction j :
% $ e^{cos(angle_ij)/d^2} / sum_i{cos(angle_ij)/d^2} $
 
% PARA: 
% gtth - the array of ground truth theta
% gtphi - the array of ground truth phi 
% template_th - the array of template theta in a sphere
% template_phi - the array of template phi in a sphere
% d - gaussian density
% 
% OUT:
% P - The convolved multi-peak propagation

assert(numel(gtth) == numel(gtphi), 'Input ground truth angles arrays have different lengths');
assert(numel(gtth) == numel(gtphi), 'Input template arrays have different lengths');
P = zeros(numel(template_th), numel(gtth));

for i = 1 : numel(gtth)
    cgtth = repmat(gtth(i),  numel(template_th), 1);
    cgtphi = repmat(gtphi(i), numel(template_phi), 1);
    
    % Dot Product
    cosalpha = sphveccos(cgtth, cgtphi, template_th, template_phi);
    cosalpha = sum(cosalpha, 2);
    p = exp(cosalpha ./ d^2);
    P(:, i) = p ./ sum(p, 1); % Normalise to be stochastic
end

P = sum(P, 2);
P = P ./ sum(P, 1); %Normalise to be stochastic

end