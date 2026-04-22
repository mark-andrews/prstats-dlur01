library(torch)

CNN <- nn_module(
  initialize = function(){
    # define the components and architecture    
    self$conv1 <- nn_conv2d(1, 32, kernel_size = 3, padding = 1)
    self$bn1 <- nn_batch_norm2d(32)
    self$conv2 <- nn_conv2d(32, 64, kernel_size = 3, padding = 1)
    self$bn2 <- nn_batch_norm2d(64)
    self$pool <- nn_max_pool2d(2)
    self$fc <- nn_linear(64 * 7 * 7, 10)
  },
  forward = function(x){
    # defines the forward dynamics
    x <- self$pool(nnf_relu(self$bn1(self$conv1(x))))
    x <- self$pool(nnf_relu(self$bn2(self$conv2(x))))
    x <- x$flatten(start_dim=2)
    self$fc(x)
  }
)

cnn <- CNN() 

train_loader <- dataloader(train_data, batch_size = 64, shuffle = TRUE)

criterion <- nn_cross_entropy_loss()
optimizer <- optim_adam(cnn$parameters)


epochs <- 5
losses <- c()
for (epoch in seq_len(epochs)){
  epoch_loss <- 0
  coro::loop(
    for (batch in train_loader){
    optimizer$zero_grad() # zero the gradient
    loss <- criterion(cnn(batch$x$unsqueeze(2)), batch$y) # STEP 1: CALCULATE THE LOSS FUNCTION
    loss$backward() # gradient calculation: Autograd. STEP 2: CALCULATE THE GRADIENT
    optimizer$step() # step following the gradient. STEP 3. CHANGE THE PARAMETERS
    epoch_loss <- epoch_loss + loss$item() # aggregate the loss within each epoch
  }
)
  print(epoch_loss)
  losses <- c(losses, epoch_loss)
}

cnn$eval()
accuracy <- 0
for (i in seq_along(test_data)) {
  output <- cnn(test_data[i]$x$unsqueeze(2))
  accuracy <- accuracy + (output$argmax(dim=2) == test_data[i]$y)
} 
accuracy <- accuracy / length(test_data)

kernels <- as.array(cnn$conv1$weight$detach())
image(kernels[1,1,,])
image(kernels[2,1,,])
image(kernels[3,1,,])
