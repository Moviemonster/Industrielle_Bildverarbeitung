clear;
I = [3 4 7 6; 2 5 5 4; 7 9 8 5; 1 5 7 3];

%Mittelwertfilter
h_M = [1 1 1; 1 1 1; 1 1 1]/9;

%Gaußfilter
h_G = [0 1 0; 1 2 1; 0 1 0]/6;

%Laplacefilter
h_L = [0 -1 0; -1 4 -1; 0 -1 0];

I_m = round(imfilter(I, h_M));
I_G = round(imfilter(I, h_G));
I_L = round(imfilter(I, h_L));

