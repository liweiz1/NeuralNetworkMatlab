 classdef Net
     
 properties
        num_layer; % number of hidden layers
        num_node; % number of nodes in hidden layer a row vector
        num_input ;
        num_output;
        bias;
        weights; % 1 by n cells weights{1,1} is the weight between input layer and first hidden, the last cell is the weights of outputs
        nodesValue; % in nodesValue, each row contains values of a node 
  end
   methods
      function this = Net(NLayer,NNodes,NInput, NOutput)
      	this.num_layer = NLayer;
      	this.num_node = NNodes;
      	this.num_input = NInput;
      	this.num_output = NOutput;
      	
        for i = 1 : NLayer
            this.bias{1,i} = ones(NNodes(1,i),1);
        end
        this.bias{1,this.num_layer + 1} = ones(NOutput,1);
      	this.weights = {};
      	this.weights{1} = rand(NInput , NNodes(1,1));
      	for i = 1 : this.num_layer - 1
      		this.weights{i + 1} = (rand(this.num_node(1,i) , this.num_node(1,i + 1)));
        end
      	this.weights{1 + this.num_layer} = (rand(this.num_node(this.num_layer) , this.num_output));
        
        this.nodesValue ={};
         
        for i = 1 : this.num_layer
            this.nodesValue{i} = zeros(1,this.num_node(1,i));
        end
        this.nodesValue{this.num_layer + 1} = zeros(1, this.num_output);
      end
      end
 end
       
     
      
      
    
