library(torch)

x_vec <- rnorm(10) # base R numeric vector

x <- torch_tensor(x_vec)
x$dtype
x$abs()  # x.abs()
x$abs_()

y <- torch_tensor(x_vec)

x + y
torch_dot(x, y) # inner product

as.numeric(x) %*% as.numeric(y)

W <- torch_randn(4, 3)
# just like ...
matrix(rnorm(12), nrow=4, ncol=3)

x <- torch_randn(3)

W$mv(x) # inner/dot product

# A two-layer neural net
I <- 3
H <- 5
K <- 3

W1 <- torch_randn(H, I) # input to hidden weights
W2 <- torch_randn(K, H) # hidden to output weights
b1 <- torch_randn(H)
b2 <- torch_randn(K)

x_input <- torch_randn(I)

hidden_values_b4_activation <- W1$mv(x_input) + b1
hidden_values <- nnf_relu(hidden_values_b4_activation)

output_values_b4_activation <- W2$mv(hidden_values) + b2
output_values <- nnf_softmax(output_values_b4_activation, 1)

# Using nn_module

TwoLayerNet <- nn_module(
 initialize = function(n_input, n_hidden, n_output){
   self$layer1 <- nn_linear(n_input, n_hidden)
   self$layer2 <- nn_linear(n_hidden, n_output)
 },
 forward = function(x){
  h <- nnf_relu(self$layer1(x)) # essentially nnf_relu(W1$mv(x) + b1)
  nnf_softmax(self$layer2(h), 2)
 }
)

my_model <- TwoLayerNet(n_input = 3, n_hidden = 5, n_output = 2)
my_model2 <- TwoLayerNet(n_input = 5, n_hidden = 2, n_output = 10)

x <- torch_randn(3)

my_model(x)

X <- torch_randn(10, 3)
my_model(X)
