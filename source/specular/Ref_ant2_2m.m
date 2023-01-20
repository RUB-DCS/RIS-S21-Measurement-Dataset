

folderPath=('../../dataset/specular/');
outputPath=('../../figures/specular');

%% Plot Reference S21
%  Ant1 distance 1m, Ant2 distance 2m
subplot 311
hold on

load(fullfile(folderPath,"21.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 1m 45°; Ant2 2m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on

%% Plot Reference S21
%  Ant1 distance 2m, Ant2 distance 2m
subplot 312
hold on

load(fullfile(folderPath,"22.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 2m 45°; Ant2 2m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on

%% Plot Reference S21
%  Ant1 distance 23, Ant2 distance 2m
subplot 313
hold on

load(fullfile(folderPath,"23.mat"))   
plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
plot(freqPoints/1e9,reference.Plate.logmagDataPoints); 
plot(freqPoints/1e9,reference.noPlate.logmagDataPoints); 

legend('All On', 'All Off', 'Reference Plate', 'Empty')
title('Reference Ant1 3m 45°; Ant2 2m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-80 0])
grid on


%% Export Figure
f = gcf; % Get current figure handle
set(gcf,'position',[10,50,1024,769]); % Set dimension of figure window

savefig(f,fullfile(outputPath,'FIG','Ref_ant2_2m.fig')) %Export MAT figure

a = annotation('rectangle',[0 0 1 1],'Color','w'); %Enforce outer margin export
exportgraphics(f,fullfile(outputPath,'PDF','Ref_ant2_2m.pdf'),'Resolution',600) %Export PDF
delete(a)


