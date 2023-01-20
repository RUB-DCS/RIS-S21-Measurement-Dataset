figure

folderPath=('../../dataset/rotatingStage/');
outputPath=('../../figures/rotatingStage');

%% Plot Reference S21
%  Ant1 distance 3m 45°, Ant2 distance 3m 45°
subplot 211
hold on

load(fullfile(folderPath,"30.mat"))
f_opt=5.375e9;% Carrier Frequency to optimize for
[~,idx]=min(abs(freqPoints-f_opt)); % Get closest frequency bin to f_opt

refFopt=zeros(length(geometry.rotStageAngles),4);
for i=1:length(geometry.rotStageAngles)
     refFopt(i,1)=reference.noPlate{i}.logmagDataPoints(idx);
     refFopt(i,2)=reference.Plate{i}.logmagDataPoints(idx);
     refFopt(i,3)=reference.RISallOff{i}.logmagDataPoints(idx);
     refFopt(i,4)=reference.RISallOn{i}.logmagDataPoints(idx);
end

plot(geometry.rotStageAngles,refFopt(:,1)) % no Plate
plot(geometry.rotStageAngles,refFopt(:,2)) % Plate
plot(geometry.rotStageAngles,refFopt(:,3)) % RISallOff
plot(geometry.rotStageAngles,refFopt(:,4)) % RISallOn

legend( 'Empty', 'Reference Plate', 'All Off','All On')
title('Reference Ant1 3m 45°; Ant2 3m 45°; f=5.375GHz')
xlabel('RIS angle [°]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on


%% Plot Reference S21
%  Ant1 distance 3m 45°, Ant2 distance 3m 45°
subplot 212
hold on

load(fullfile(folderPath,"30.mat"))
f_opt=5.375e9;% Carrier Frequency to optimize for
[~,idx]=min(abs(freqPoints-f_opt)); % Get closest frequency bin to f_opt

resFopt=zeros(length(geometry.rotStageAngles),4);
for i=1:length(geometry.rotStageAngles)
     resFopt(i,1)=results.algoSEmax{i,256}.logmagDataPoints(idx);
     resFopt(i,2)=results.algoSEmin{i,256}.logmagDataPoints(idx);

     resTemp.ST=results.ST(i,:);
     %resTemp.KW=results.KW(i,:);
   %  resFopt(i,4)=findMinGeometric(resTemp,freqPoints,f_opt).logmagDataPoints(idx);
end

plot(geometry.rotStageAngles,resFopt(:,1)) % SEmax
%plot(geometry.rotStageAngles,resFopt(:,2)) % SEmin
%plot(geometry.rotStageAngles,resFopt(:,3)) % GeometricMax
%plot(geometry.rotStageAngles,resFopt(:,4)) % GeometricMin
plot(geometry.rotStageAngles,refFopt(:,2)) % Plate

legend('SEmax','Reference Plate')
title('Reference Ant1 3m 45°; Ant2 3m 45°; f=5.375GHz')
xlabel('RIS angle [°]')
ylabel('S21 [dB]')
ylim([-60 0])
grid on

% %% Export Figure
% f = gcf; % Get current figure handle
% set(gcf,'position',[10,50,1024,769]); % Set dimension of figure window
% 
% savefig(f,fullfile(outputPath,'FIG','MaxLogStaticSpecular.fig')) %Export MAT figure
% 
% a = annotation('rectangle',[0 0 1 1],'Color','w'); %Enforce outer margin export
% exportgraphics(f,fullfile(outputPath,'PDF','MaxLogStaticSpecular.pdf'),'Resolution',600) %Export PDF
% delete(a)


