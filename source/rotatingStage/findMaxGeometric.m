function S21 = findMaxGeometric(results, freqPoints, fOpt)
%FINDMAXGEOMETRIC
%   This function returns the S21 for the highest logMagnitude at the
%   specified fOpt frequency from all geometric approaches.

    [~,idx]=min(abs(freqPoints-fOpt)); % Get closest frequency bin to fOpt

    % ST - Geometric approaches
    ST = cellfun(@(a) a.logmagDataPoints(idx),results.ST,'UniformOutput',false);
    [maxBuff(1),idxBuff(1)]=max(cell2mat(ST));

    % KW - Geometric approaches
    KW = cellfun(@(a) a.logmagDataPoints(idx),results.KW,'UniformOutput',false);
    [maxBuff(2),idxBuff(2)]=max(cell2mat(KW));

   
    [~,idx]=max(maxBuff);

    if idx==1 % ST
        S21=results.ST{idxBuff(1)};
   elseif idx==2 % KW
        S21=results.KW{idxBuff(2)};        
    end



end

