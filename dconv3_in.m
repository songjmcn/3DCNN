function [ din ] = dconv3_in( dout,in,k,mode )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
switch mode
    case 'valid'
        din=convn(dout,k,'full');
    case 'full'
        din=convn(dout,k,'valid');
    case 'same'
        din=convn(dout,k,'same')
    otherwise
        error('The Wrong convolution type !')
end


end

