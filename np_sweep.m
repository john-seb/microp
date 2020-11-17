%the number of microparticles is increased from 1 to full coverage with
%random distribution of particles. Capacitance is calculated for each
%configuration. 
%Created by John Sebastian

%save code as np_sweep.m
%the same loop can be used for other parameters

tic;


c = 0.5;
d = 1.5;
l = 75;

max_np = l*d/c.^2;
cap_mat = zeros(1,max_np);
np_count = 1:1:max_np;

for np = 1:1:max_np
    cap_mat(np) = capac(c,d,l,np);
end

figure()
np_fig = plot(np_count,cap_mat);
ylabel ('Effective Capacitance (Farads)')
xlabel ('number of microplastic particles')
title(['c = ' ,num2str(c), newline 'd =  ',num2str(d),newline 'l = ',num2str(l)])
% saveas(np_fig, 'np_sweep1.png')

writematrix(vertcat(np_count,cap_mat)','c_0.5-l_75-d_1.5-dielectric-film-0.1c_sellotape.csv');

cap_mat_p = 100.*(cap_mat./cap_mat(1));
np_vol = 100*(1:1:max_np)./max_np;
figure()
np_vol_fig = plot(np_vol,cap_mat_p);
ylabel ('Capacitance % of water')
xlabel ('volume occupied by microplastics (%)')
title(['c = ' ,num2str(c), newline 'd =  ',num2str(d),newline 'l = ',num2str(l)])
% saveas(np_fig, 'np_sweep2.png')

writematrix(vertcat(np_vol,cap_mat_p)','c_0.5-l_75-d_1.5-dielectric-film-0.1c_sellotape_percent.csv')



toc;