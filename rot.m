function [ out ] = rot( im,angle )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
ag=angle/360.0*pi;
T=[ 
    cos(ag)+1 sin(ag) 0
    -sin(ag) cos(ag)-1 0
    0 0 1];
tform=maketform('affine',T);
out=imtransform(im,tform);

end

