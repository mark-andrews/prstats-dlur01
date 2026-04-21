# Deep Learning Using R

This intensive two-day workshop provides a comprehensive introduction to deep learning and its implementation in R using the torch package.
The course is designed for participants who are new to deep learning, covering both the theoretical foundations and practical implementation of modern neural network architectures.
Starting with the biological and mathematical basis of artificial neural networks, the course progresses through multilayer perceptrons and convolutional neural networks, and culminates in transformer architectures and large language models.
Through hands-on coding with torch for R and real-world datasets, participants gain both conceptual understanding and practical skills in building, training, and applying deep learning models to research problems.

### Topics

**Introduction to Artificial Neural Networks**

- Biological neurons vs artificial neurons: history and motivation
- The perceptron: weighted sums, bias, activation functions
- From perceptrons to multilayer networks: the need for non-linearity
- Activation functions: sigmoid, tanh, ReLU, GELU
- Network architecture: input layers, hidden layers, output layers
- Forward propagation: computing predictions
- The universal approximation theorem
- History of neural networks: perceptrons, AI winters, the deep learning revolution

**Training Neural Networks**

- Loss functions: mean squared error, cross-entropy
- Backpropagation: computing gradients through the network
- Gradient descent and optimisation: SGD, momentum, Adam
- Batch training: mini-batches, epochs, iterations
- Learning rates and convergence
- Overfitting and regularisation: dropout, weight decay, early stopping
- Train/validation/test splits for deep learning
- Introduction to torch for R: tensors, autograd, computational graphs

**Multilayer Perceptrons with torch**

- torch fundamentals: tensors, devices (CPU/GPU), data types
- Building networks with nn_module
- Defining layers, forward passes, and network architecture
- Training loops: forward pass, loss computation, backward pass, parameter updates
- MNIST digit classification: a complete MLP example
- Monitoring training: loss curves, validation accuracy
- Using luz: high-level training interface for torch

**Convolutional Neural Networks**

- Limitations of MLPs for images: parameter explosion, lack of spatial structure
- Convolutional layers: filters, kernels, feature maps
- Convolution operation: local connectivity, parameter sharing, translation invariance
- Pooling layers: max pooling, average pooling, dimensionality reduction
- CNN architectures: stacking conv layers, increasing depth
- Building CNNs in torch: nn_conv2d, nn_max_pool2d, nn_batch_norm2d
- Image classification with CNNs
- Visualising learned features and filters

**Language Models and Transformers**

- The language modelling task: predicting the next word/token
- Tokenisation: character-level, byte-pair encoding (BPE), subword tokens
- Embeddings: representing words as vectors
- Self-attention mechanism: queries, keys, values
- Multi-head attention: learning multiple attention patterns
- Positional encodings: incorporating sequence order
- Causal masking: autoregressive generation
- Transformer blocks: attention + feedforward networks
- The GPT architecture: decoder-only transformers

**Implementing a GPT Language Model**

- Building a minimal GPT from scratch in torch
- Training a character-level language model
- Text generation: sampling, temperature, top-k, top-p
- Understanding LLMs: scale, emergence, capabilities and limitations
- Current landscape: GPT-4, Claude, LLaMA, and the open-source ecosystem

### Format

- Intensive hands-on workshop with extensive live coding
- All examples implemented in Quarto documents
- Real datasets: MNIST digits, text corpora
- Mix of conceptual explanations and practical implementation
- From-scratch implementations to understand fundamentals, torch for R for practical applications
- All code and materials provided for independent learning after the course

### Materials

Workshop guides and slides for this training course can be found [here](https://courses.mjandrews.org/deep-learning-r/).

### Software

Software requirements and installation instructions are in [software.md](software.md).
