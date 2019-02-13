function [relativeEntropies] = relativeEntropy(inputSignal1, inputSignal2)
%relativeEntropy Computes the relative entropy of two signals

% Computing the relative entropies
relativeEntropies =  sum(inputSignal1.*log2(inputSignal1 ./ inputSignal2));

end

