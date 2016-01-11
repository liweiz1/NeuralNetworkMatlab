% input is a row vector
function neuralNetwork = neuralNetwork_forward(input, neuralNetwork)
    numHiddenLayers = neuralNetwork.num_layer;
    neuralNetwork.nodesValue{1,1} = sigmoid((input * neuralNetwork.weights{1,1} + neuralNetwork.bias{1,1}')');
    for i = 1 :  numHiddenLayers
        neuralNetwork.nodesValue{1,i + 1} = sigmoid((neuralNetwork.nodesValue{1,i}' * neuralNetwork.weights{1,i+1} + neuralNetwork.bias{1,i + 1}')');
    end
   
end
