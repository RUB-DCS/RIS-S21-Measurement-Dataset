function S21 = findMinGeometric(results, freqPoints, fOpt)
%FINDMAXGEOMETRIC
%   This function returns the S21 for the highest logMagnitude at the
%   specified fOpt frequency from all geometric approaches.

    [~,idx]=min(abs(freqPoints-fOpt)); % Get closest frequency bin to fOpt

    % ST - Geometric approaches
    ST = cellfun(@(a) a.logmagDataPoints(idx),results.ST,'UniformOutput',false);
    [minBuff(1),idxBuff(1)]=min(cell2mat(ST));

    % MH - Geometric approaches
    MH = cellfun(@(a) a.logmagDataPoints(idx),results.MH,'UniformOutput',false);
    [minBuff(2),idxBuff(2)]=min(cell2mat(MH));

    % KW - Geometric approaches
    KW = cellfun(@(a) a.logmagDataPoints(idx),results.KW,'UniformOutput',false);
    [minBuff(3),idxBuff(3)]=min(cell2mat(KW));

   
    [~,idx]=min(minBuff);

    if idx==1 % ST
        S21=results.ST{idxBuff(1)};
    elseif idx==2 % MH
        S21=results.MH{idxBuff(2)};
    elseif idx==3 % KW
        S21=results.KW{idxBuff(3)};        
    end



end

