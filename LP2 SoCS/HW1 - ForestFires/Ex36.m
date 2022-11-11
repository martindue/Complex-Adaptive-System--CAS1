%% 36
clf, clc
N=256;
p=0.01;
f=0.2;
T = 10000;

[fireSizes, forestSizes] = SimulateForestFire(N,p,f,T);
n = (1:size(fireSizes,2))/size(fireSizes,2);
sortedFireSizes = sort(fireSizes, 'descend')./N^2;
%%
clf, clc
loglog(sortedFireSizes,n,'b')
hold on
index = sortedFireSizes <0.2;
x = sortedFireSizes(index);
y = n(index);
c = polyfit(log10(x),log10(y),1);

loglog(sortedFireSizes, 10^(c(2))*sortedFireSizes.^c(1))

alpha=1-c(1)


% Settings for alpha
%alpha = 1.169;
% x=linspace(1/N^2, 1,N^2);
% a = (x.^(1-alpha));
% a=a./a(1);
% plot(x,a,'r')