

folderPath=('../../dataset/nonSpecular/');
outputPath=('../../figures/nonSpecular');

%% Plot Reference S21
%  Ant1 distance 1m, Ant2 distance 3m
subplot 321
hold on

load(fullfile(folderPath,"12.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 1m 0°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on

%% Plot Reference S21
%  Ant1 distance 1.5m, Ant2 distance 3m
subplot 322
hold on

load(fullfile(folderPath,"13.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 1.5m 0°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on

%% Plot Reference S21
%  Ant1 distance 2m, Ant2 distance 3m
subplot 323
hold on

load(fullfile(folderPath,"14.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 2m 0°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on

%% Plot Reference S21
%  Ant1 distance 3m, Ant2 distance 3m
subplot 324
hold on

load(fullfile(folderPath,"15.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 3m 0°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on

%% Plot Reference S21
%  Ant1 distance 5m, Ant2 distance 3m
subplot 325
hold on

load(fullfile(folderPath,"16.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 5m 0°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on

%% Plot Reference S21
%  Ant1 distance 7m, Ant2 distance 3m
subplot 326
hold on

load(fullfile(folderPath,"17.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 7m 0°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on


%% Export Figure
f = gcf; % Get current figure handle
set(gcf,'position',[10,50,1024,769]); % Set dimension of figure window

savefig(f,fullfile(outputPath,'FIG','Ref_ant2_3m.fig')) %Export MAT figure

a = annotation('rectangle',[0 0 1 1],'Color','w'); %Enforce outer margin export
exportgraphics(f,fullfile(outputPath,'PDF','Ref_ant2_3m.pdf'),'Resolution',600) %Export PDF
delete(a)


