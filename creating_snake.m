clc
clear all
close all
locx=[50 50 50 50 50 50 50 50 50];
locy=[60 61 62 63 64 65 66 67 68];

r=zeros(100,100);
g=zeros(100,100);
b=zeros(100,100);
r(locx(1),locy(1))=255;
g(locx(1),locy(1))=0;
b(locx(1),locy(1))=0;
   
for i=2:length(locx)
     r(locx(i),locy(i))=0;
     g(locx(i),locy(i))=255;
     b(locx(i),locy(i))=0;
end
subimage(uint8(cat(3,r,g,b)));