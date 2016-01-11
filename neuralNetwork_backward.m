% output is a colum vector which is the true output 
% input is a row vector 
function neuralNetwork = neuralNetwork_backward(input,output, neuralNetwork)
    stepsize = 0.01;
    upgradeWeight = neuralNetwork.weights;
    bias = neuralNetwork.bias;
    value = neuralNetwork.nodesValue;
    input = sum(input,1)';
    target = zeros(10,1);
    target(output+1) = 1;
    
    value{1,neuralNetwork.num_layer + 1} =  value{1,neuralNetwork.num_layer + 1} .* (1 - value{1,neuralNetwork.num_layer + 1}).* (target - value{1,neuralNetwork.num_layer + 1}) ;
    bias{1,neuralNetwork.num_layer + 1} = value{1,neuralNetwork.num_layer + 1};
    for i = neuralNetwork.num_layer : -1 : 1
        value{1,i} = value{1,i} .*  (1 - value{1,i}) .* (upgradeWeight{i + 1} * value{1,i + 1});
        bias{1,i} = value{1,i} .*  (1 - value{1,i}) .* (upgradeWeight{i + 1} * value{1,i + 1});
    end
   % update the weight of output layer
    upgradeWeight{1,neuralNetwork.num_layer + 1} = stepsize * (repmat(value{1,neuralNetwork.num_layer + 1}',neuralNetwork.num_node(1,neuralNetwork.num_layer),1).*repmat(value{1,neuralNetwork.num_layer},1,neuralNetwork.num_output));
    neuralNetwork.bias{1,neuralNetwork.num_layer + 1} = neuralNetwork.bias{1,neuralNetwork.num_layer + 1} + stepsize * neuralNetwork.bias{1,neuralNetwork.num_layer + 1} .* value{1,neuralNetwork.num_layer + 1};
   % update the weight of hidden layer 
   for i = neuralNetwork.num_layer : -1 : 2
       upgradeWeight{1,i} = stepsize * (repmat(value{1,i - 1},1, neuralNetwork.num_node(1,i)) .* repmat(value{1,i}',neuralNetwork.num_node(1,i - 1),1));
       neuralNetwork.bias{1,i} = neuralNetwork.bias{1,i} + stepsize * neuralNetwork.bias{1,i}.* value{1,i};
   end
   %update the weight of input layer
    upgradeWeight{1,1} = stepsize * (repmat(input,1, neuralNetwork.num_node(1,1)) .* repmat(value{1,1}',neuralNetwork.num_input,1));
    neuralNetwork.bias{1,1} = neuralNetwork.bias{1,1} + stepsize * neuralNetwork.bias{1,1}.* value{1,1};
    % update weights
    for i = 1 : neuralNetwork.num_layer + 1
        neuralNetwork.weights{1,i} = neuralNetwork.weights{1,i} + upgradeWeight{1,i};
         neuralNetwork.bias{1,i} = neuralNetwork.bias{1,i} + bias{1,i};
    end
end
