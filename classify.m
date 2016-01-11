function label = classify(input, neuralNetwork)
    numHiddenLayers = neuralNetwork.num_layer;
    neuralNetwork.nodesValue{1,1} = 1 ./ (1 + exp(-(input * neuralNetwork.weights{1,1})'));
    for i = 1 :  numHiddenLayers-1
        neuralNetwork.nodesValue{1,i + 1} = 1 ./ (1 + exp(-(neuralNetwork.nodesValue{1,i}' * neuralNetwork.weights{1,i+1})'));
    end
    label = -(neuralNetwork.nodesValue{1,numHiddenLayers}' * neuralNetwork.weights{1,numHiddenLayers+1})';
end
