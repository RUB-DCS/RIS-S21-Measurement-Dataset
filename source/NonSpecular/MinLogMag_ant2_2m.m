

folderPath=('../../dataset/nonSpecular/');
outputPath=('../../figures/nonSpecular');
%% Plot S21 logMag for converged SEmin algorithm
%  Ant1 distance 1-7m, Ant2 distance 2m
subplot 221
hold on
for i=6:11
    load(fullfile(folderPath,sprintf("%02i.mat",i)))
    p(i-5)=plot(freqPoints/1e9,results.algoSEmin{256}.logmagDataPoints);
end
datatip(p(1),'DataIndex',76); % Datatip at 5.375GHz dist 1m
legend('1m','1,5m','2m','3m','5m','7m')
title('Min SE; Ant1 1-7m 0°; Ant2 2m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-70 -10])
grid on

%% Plot S21 logMag for converged GreedyMin algorithm
%  Ant1 distance 1-7m, Ant2 distance 2m
subplot 222
hold on
for i=6:11
    load(fullfile(folderPath,sprintf("%02i.mat",i)))
    p(i-5)=plot(freqPoints/1e9,results.algoGreedyMin{100}.logmagDataPoints);
end
datatip(p(1),'DataIndex',76); % Datatip at 5.375GHz dist 1m
legend('1m','1,5m','2m','3m','5m','7m')
title('Min Greedy; Ant1 1-7m 0°; Ant2 2m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-70 -10])
grid on


%% Plot best S21 from geometric approaches
%  Ant1 distance 1-7m, Ant2 distance 2m
subplot 223
hold on
for i=6:11
    load(fullfile(folderPath,sprintf("%02i.mat",i)))
    S21=findMinGeometric(results,freqPoints,5.375e9);
    p(i-5)=plot(freqPoints/1e9,S21.logmagDataPoints); %Plot handles
end
datatip(p(1),'DataIndex',76); % Datatip at 5.375GHz dist 1m
legend('1m','1,5m','2m','3m','5m','7m')
title('Min Geometric; Ant1 1-7m 0°; Ant2 2m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-70 -10])
grid on


%% Plot Reference S21
%  Ant1 distance 1-7m, Ant2 distance 2m
subplot 224
hold on
for i=6:11
    load(fullfile(folderPath,sprintf("%02i.mat",i)))   
    p(i-5)=plot(freqPoints/1e9,reference.RISallOff.logmagDataPoints); 
end
datatip(p(1),'DataIndex',76); % Datatip at 5.375GHz dist 1m
legend('1m','1,5m','2m','3m','5m','7m')
title('RIS all elements off; Ant1 1-7m 0°; Ant2 2m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-70 -10])
grid on


%% Export Figure
f = gcf; % Get current figure handle
set(gcf,'position',[10,50,1024,769]); % Set dimension of figure window

savefig(f,fullfile(outputPath,'FIG','MinLogMag_ant2_2m.fig')) %Export MAT figure

a = annotation('rectangle',[0 0 1 1],'Color','w'); %Enforce outer margin export
exportgraphics(f,fullfile(outputPath,'PDF','MinLogMag_ant2_2m.pdf'),'Resolution',600) %Export PDF
delete(a)


