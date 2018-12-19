function [relEntropy] = relativeEntropy(inp1, inp2)
%relativeEntropy Computes the relative entropy of two signals

% Computing the relatives entropies
relativeEntropies = inp1.*log2(inp1 ./ inp2);

relEntropy = sum(relativeEntropies);

end

