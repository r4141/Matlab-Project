clc
clear all
close all
r=255*ones(100,100);
g=zeros(100,100);
b=zeros(100,100);
im=uint8(cat(3,r,g,b))

subimage(uint8(cat(3,r,g,b)));