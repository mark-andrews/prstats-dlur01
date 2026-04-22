library(torch)
library(torchvision)

# Get MNIST data ---------------------------------------------------------

train_data <- mnist_dataset(
  root = 'data', train = TRUE, download = TRUE,
  transform = transform_to_tensor)

s <- as.matrix(train_data[[4567]]$x[1,])
grid::grid.raster(s, interpolate = F)
train_data[[4567]]$y

# images are 28 by 28

# define the network
# mlp: multilayer perceptron
mlp <- nn_sequential(
  nn_flatten(),
  nn_linear(784, 128), # input to hidden layer 1
  nn_relu(),
  nn_linear(128, 64),  # hidden layer 1 to hidden layer 2
  nn_relu(),
  nn_linear(64, 10) # hidden layer 2 to output
)



criterion <- nn_cross_entropy_loss()
optimizer <- optim_adam(mlp$parameters)

train_loader <- dataloader(train_data, batch_size = 64, shuffle = TRUE)

epochs <- 5
losses <- c()
for (epoch in seq_len(epochs)){
  epoch_loss <- 0
  coro::loop(
    for (batch in train_loader){
    optimizer$zero_grad() # zero the gradient
    loss <- criterion(mlp(batch$x), batch$y) # STEP 1: CALCULATE THE LOSS FUNCTION
    loss$backward() # gradient calculation: Autograd. STEP 2: CALCULATE THE GRADIENT
    optimizer$step() # step following the gradient. STEP 3. CHANGE THE PARAMETERS
    epoch_loss <- epoch_loss + loss$item() # aggregate the loss within each epoch
  }
)
  print(epoch_loss)
  losses <- c(losses, epoch_loss)
}
p <- nnf_softmax(mlp(train_data[1]$x), dim=2) |> as.numeric()