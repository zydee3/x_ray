clc; close all;
addpath(genpath('./'))

%% Domain.build
d0 = Domain.build();

dc0 = Domain.build('circle', 'radius', 1);
dcs0 = Domain.build('cosine', 'radius', 4, 'amplitude', 1, 'cycles', 4, 'origin', [2,1], 'theta', -12);
dp0 = Domain.build('polygon', 'radius', 4, 'sides', 8);
dsp0 = Domain.build('smoothpoly', 'radius', 3, 'sides', 3, 'bevelRadius', 0.3);
de0 = Domain.build('ellipse', 'radiusA', 3, 'radiusB', 2);


d5star0 = Domain.build('spline', 'cycles', 5, 'theta', 0.1*pi, 'verticies', ...
                    [0,      3, 0.5;...
                     pi*0.2, 1.2, 0;...
                     pi*0.4, 3, 0.5]);
dsaw0 = Domain.build('spline', 'cycles', 30, 'verticies', ...
                    [0,     1.7, 0;...
                     pi/60, 1.7, 0;...
                     pi/30, 1.85, 1;...
                     pi/15, 1.9, 0]);
dsaw1 = Domain.build('spline', 'cycles', 30, 'verticies', ...
                    [0,     1.5, 0;...
                     pi/15, 2, 0]);
darrow0 = Domain.build('spline', 'origin', [2,0], 'theta', 2.3, 'verticies', ...
                    [0                    ,0.5              , 0;...
                     pi*0.75              ,sqrt(2)          , 0;...
                     atan2(0.5,-0.9)      ,sqrt(0.9^2+0.5^2), 0;...
                     atan2(0.5,-3)        ,sqrt(3^2+0.5^2)  , 0;...
                     2*pi-atan2(0.5,-3)   ,sqrt(3^2+0.5^2)  , 0;...
                     2*pi-atan2(0.5,-0.9) ,sqrt(0.9^2+0.5^2), 0;...
                     pi*1.25              ,sqrt(2)          , 0;...
                     2*pi                 ,0.5              , 0]);
                 
%% Metric.build
m0 = Metric.build();

me0 = Metric.build('euclid');
mh0 = Metric.build('hyperbolic', 'radius', 2);
mp0 = Metric.build('polynomial', 'coeffs', [0.5,0.43,-0.5,1,-1,5000]);
ms0 = Metric.build('sphere', 'radius', 1);
meat0 = Metric.build('eaton');
examp0 = Metric.build('myexample1');

%% Metric (do not use)

%m1 = Metric();
%m2 = Metric(@(x,y) exp(x.^2 + y.^2));
    % Same as: m2 = Metric.build('poly', 'coeffs', [1,0,1,0,0,0]);

    
%% RiemannSuface
rs0 = RiemannSurface();
rs1 = RiemannSurface(dcs0,mh0);
rs2 = RiemannSurface(d5star0,ms0);
rs3 = RiemannSurface(darrow0,ms0);
rs4 = RiemannSurface(dsp0,mp0);
rs5 = RiemannSurface(darrow0,mh0);


%% InFunction
if0 = InMap([2,2,2,2;...
                  2,1,0,2;...
                  2,2,2,2]);
    if0 = if0.transform(0,1,3,1,0);
if1 = InMap([2,2,2,2;...
                  2,1,0,2;...
                  2,0,1,2;...
                  2,2,2,2]);
    if1 = if1.transform(0,1,1,1,0.3);
if2 = InMap(repelem(...
                 [1,2,3,4;...
                 12,13,0,5;...
                 11,0,13,6;...
                 10,9,8,7], 1,1));     
    if2 = if2.transform(0,0,1,1,0.2);
    

    func = @(x,y) (sin(x)*2+cos(y)) + 5*(cos(x/5)+sin(y/5));
    scale = 1;
    [X,Y] = meshgrid(-6:scale:6); 
if31 = InMap(func);     
    if31 = if31.transform(0,0,1,1,0.2);
if32 = InMap(repelem(func(X,Y), 1,1));     
    if32 = if32.transform(0,0,scale,scale,0.2);  
    clear X Y func scale;