function S21 = findMaxGeometric(results, freqPoints, fOpt)
%FINDMAXGEOMETRIC
%   This function returns the S21 for the highest logMagnitude at the
%   specified fOpt frequency from all geometric approaches.

    [~,idx]=min(abs(freqPoints-fOpt)); % Get closest frequency bin to fOpt

    % ST - Geometric approaches
    ST = cellfun(@(a) a.logmagDataPoints(idx),results.ST,'UniformOutput',false);
    [maxBuff(1),idxBuff(1)]=max(cell2mat(ST));

    % MH - Geometric approaches
    MH = cellfun(@(a) a.logmagDataPoints(idx),results.MH,'UniformOutput',false);
    [maxBuff(2),idxBuff(2)]=max(cell2mat(MH));

    % KW - Geometric approaches
    KW = cellfun(@(a) a.logmagDataPoints(idx),results.KW,'UniformOutput',false);
    [maxBuff(3),idxBuff(3)]=max(cell2mat(KW));

   
    [~,idx]=max(maxBuff);

    if idx==1 % ST
        S21=results.ST{idxBuff(1)};
    elseif idx==2 % MH
        S21=results.MH{idxBuff(2)};
    elseif idx==3 % KW
        S21=results.KW{idxBuff(3)};        
    end



end

