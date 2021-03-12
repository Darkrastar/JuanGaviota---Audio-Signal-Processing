function [ val ] = normalValueCor( x,y )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
        cor=xcorr(x,y);
        corrX = xcorr(x,0);
        corrY=xcorr(y,0);
        corN= cor./sqrt(corrX.*corrY);
        val = max(abs(corN))*100;

end

