%d - sweep for np - C graphs
% diff values of d/c

a1 = readmatrix('c_0.5-l_75-d_0.5_percent.csv');
a1_1 = readmatrix('c_0.5-l_75-d_0.75_percent.csv'); 
a2 = readmatrix('c_0.5-l_75-d_1.0_percent.csv');
a3 = readmatrix('c_0.5-l_75-d_1.5_percent.csv');
a4 = readmatrix('c_0.5-l_75-d_2.0_percent.csv');
a5 = readmatrix('c_0.5-l_75-d_2.25_percent.csv');
a6 = readmatrix('c_0.5-l_75-d_2.5_percent.csv');

figure()
plot(a1(:,1),a1(:,2))
hold on
plot(a1_1(:,1),movmean(a1_1(:,2),15))
hold on
plot(a2(:,1),movmean(a2(:,2),15))
hold on
plot(a3(:,1),movmean(a3(:,2),15))
hold on
plot(a4(:,1),movmean(a4(:,2),15))
hold on
plot(a5(:,1),movmean(a5(:,2),15))
hold on
plot(a6(:,1),movmean(a6(:,2),15))
hold on

xlabel('microplastic occupation (%)')
ylabel('Effective Capacitance (% of full water enclosure)')

legend('d/c = 1','d/c = 1.5','d/c = 2','d/c = 3','d/c = 4','d/c = 4.5','d/c = 5')



%% Effect of dielectric film

%film of thickness = c; film of same dielectric const as microp

b1 = readmatrix('c_0.5-l_75-d_1.5_percent.csv');
b2 = readmatrix('c_0.5-l_75-d_1.5-dielectric-film-c_percent.csv');
b3 = readmatrix('c_0.5-l_75-d_1.5-dielectric-film-10c_percent.csv');


figure()
plot(b1(:,1),movmean(b1(:,2),15))
hold on
plot(b2(:,1),movmean(b2(:,2),15))
hold on
plot(b3(:,1),movmean(b3(:,2),15))
hold on

xlabel('microplastic occupation (%)')
ylabel('Effective Capacitance (% of full water enclosure)')

legend('film thickness = 0','film thickness = c','film thickness = 10*c')

%% Dielectric film thickness and Material 

% 1 mm thickness rubber vs glass
c1 = readmatrix('c_0.5-l_75-d_1.5-dielectric-film-2c_rubber_percent.csv');
c2 = readmatrix('c_0.5-l_75-d_1.5-dielectric-film-2c_glass_percent.csv');
c3 = readmatrix('c_0.5-l_75-d_1.5-dielectric-film-0.1c_sellotape_percent.csv');


figure()
plot(c1(:,1),movmean(c1(:,2),15))
hold on
plot(c2(:,1),movmean(c2(:,2),15))
hold on
plot(c3(:,1),movmean(c3(:,2),15))
hold on

xlabel('microplastic occupation (%)')
ylabel('Effective Capacitance (% of full water enclosure)')

legend('rubber 1 mm thick','glass 1 mm (microscopic slide)','50 micron sellotape')





