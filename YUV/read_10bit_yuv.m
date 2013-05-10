function [Y,U,V] = read_10bit_yuv(filename,width,height)
% This function reads a non-ASCII .yuv file and outputs the Y,U,V matrices

fid = fopen(filename,'r');
% Read each pixel value into 'buf' as a 32bit input
buf = fread(fid, width*height,'uint32'); 

% Extract bits 00 to 09 as U data
% Extract bits 10 to 19 as Y data
% Extract bits 20 to 29 as V data

Ydata = bitshift(bitand(buf,hex2dec('3FF00000')),-20);
Y = reshape(Ydata,[width,height])';
Udata = bitshift(bitand(buf,hex2dec('000FFC00')),-10);
U = reshape(Udata,[width,height])';
Vdata = bitand(buf,hex2dec('000003FF'));
V = reshape(Vdata,[width,height])';

end