

folderPath=('../../dataset/specular/');
outputPath=('../../figures/specular');
%% Plot S21 logMag for converged SEmax algorithm
%  Ant1 distance 1-3m, Ant2 distance 3m
subplot 221
hold on
for i=24:26
    load(fullfile(folderPath,sprintf("%02i.mat",i)))
    p(i-23)=plot(freqPoints/1e9,results.algoSEmax{256}.logmagDataPoints);
end
datatip(p(1),'DataIndex',76); % Datatip at 5.375GHz dist 1m
legend('1m','2m','3m')
title('Max SE; Ant1 1-3m 45°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-50 10])
grid on

%% Plot S21 logMag for converged GreedyMax algorithm
%  Ant1 distance 1-3m, Ant2 distance 3m
subplot 222
hold on
for i=24:26
    load(fullfile(folderPath,sprintf("%02i.mat",i)))
    p(i-23)=plot(freqPoints/1e9,results.algoGreedyMax{100}.logmagDataPoints);
end
datatip(p(1),'DataIndex',76); % Datatip at 5.375GHz dist 1m
legend('1m','2m','3m')
title('Max Greedy; Ant1 1-3m 45°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-50 10])
grid on


%% Plot best S21 from geometric approaches
%  Ant1 distance 1-3m, Ant2 distance 3m
subplot 223
hold on
for i=24:26
    load(fullfile(folderPath,sprintf("%02i.mat",i)))
    S21=findMaxGeometric(results,freqPoints,5.375e9);
    p(i-23)=plot(freqPoints/1e9,S21.logmagDataPoints); %Plot handles
end
datatip(p(1),'DataIndex',76); % Datatip at 5.375GHz dist 1m
legend('1m','2m','3m')
title('Max Geometric; Ant1 1-3m 45°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-50 10])
grid on


%% Plot Reference S21
%  Ant1 distance 1-3m, Ant2 distance 3m
subplot 224
hold on
for i=24:26
    load(fullfile(folderPath,sprintf("%02i.mat",i)))   
    p(i-23)=plot(freqPoints/1e9,reference.RISallOn.logmagDataPoints); 
end
datatip(p(1),'DataIndex',76); % Datatip at 5.375GHz dist 1m
legend('1m','2m','3m')
title('RIS all elements on; Ant1 1-3m 45°; Ant2 3m 45°')
xlabel('Frequency [GHz]')
ylabel('S21 [dB]')
ylim([-50 10])
grid on


%% Export Figure
f = gcf; % Get current figure handle
set(gcf,'position',[10,50,1024,769]); % Set dimension of figure window

savefig(f,fullfile(outputPath,'FIG','MaxLogMag_ant2_3m.fig')) %Export MAT figure

a = annotation('rectangle',[0 0 1 1],'Color','w'); %Enforce outer margin export
exportgraphics(f,fullfile(outputPath,'PDF','MaxLogMag_ant2_3m.pdf'),'Resolution',600) %Export PDF
delete(a)


