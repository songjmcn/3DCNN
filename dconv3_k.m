function [ dk ] = dconv3_k( dout,in,k,mode )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
switch mode
    case 'valid'
        dk=conv3(in,dout,'valid');
    case 'full'
        dk=conv3(in,dout,'valid');
    otherwise
        error('The Wrong convolution type !');
end
end

