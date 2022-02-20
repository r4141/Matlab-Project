clc
clear all
close all

r=zeros(100,100);
g=zeros(100,100);
b=zeros(100,100);
c=255;
for i=1:20
    g(26,i+7)=c;%x
    g(26,i+29)=c;
    g(26,i+73)=c;
    g(26,i+7)=c;
    g(25+i,8)=c;%y
    g(45,i+7)=c;
    g(i+25,30)=c;
    g(i+25,49)=c;
    g(35,i+29)=c;
    g(36,i+73)=c;
    g(45,i+73)=c;
    g(25+i,73)=c;
    g(25+i,51)=c;
    g(25+i,71)=c;
    r(55+i,8)=c;
    r(55+i,27)=c;
    r(56,7+i)=c;
    r(75,7+i)=c;
    r(56,50+i)=c;
    r(66,50+i)=c;
    r(75,50+i)=c;%x
    r(55+i,51)=c;%y
    r(66,73+i)=c;
    r(56,73+i)=c;%x
    r(55+i,73)=c;
    
    
    
    
end
for i=1:10
    g(i+35,27)=c;
    g(35,i+17)=c;
    g(25+i,51+i)=c;
    g(36-i,61+i)=c;
    r(55+i,93)=c;
    r(65+i,73+i)=c;
    r(55+i,30)=c;
    r(55+i,49)=c;
    r(65+i,29+i)=c;
    r(76-i,39+i)=c;
    
end
    
im=cat(3,r,g,b);
subimage(uint8(im));