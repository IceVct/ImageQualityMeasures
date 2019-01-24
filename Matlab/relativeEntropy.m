function [relEntropy] = relativeEntropy(inputSignal1, inputSignal2)
%relativeEntropy Computes the relative entropy of two signals

% Computing the relative entropies
relativeEntropies = inputSignal1.*log2(inputSignal1 ./ inputSignal2);

relEntropy = sum(relativeEntropies);

end

