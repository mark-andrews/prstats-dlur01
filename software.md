# Software Requirements and Installation

All software required for this course is free and open-source.
R 4.0 or later is required.

## Installing R

Download and install R from <https://cran.r-project.org>.

## Choosing an IDE

You need an editor that lets you run R interactively.
RStudio is the most widely used option and an excellent choice: download it from <https://posit.co/download/rstudio-desktop>.
Positron is a newer data science IDE from the same company and is equally capable: download it from <https://positron.posit.co>.
Either will work well for this course.

## R Packages

Once R is installed, open R or your IDE and run the following to install the required packages:

```r
install.packages(c("torch", "torchvision", "luz", "coro"))
install.packages(c("tok", "hfhub", "safetensors"))
```

## LibTorch Backend

The `torch` package requires a compiled C++ backend (LibTorch) that is not bundled with the CRAN package.
After the packages are installed, run this once to download and install the backend:

```r
torch::install_torch()
```

This downloads several hundred megabytes and takes a few minutes.
You only need to do it once per machine.

## Verifying the Installation

Run the following to confirm everything is working:

```r
library(torch)
x <- torch_tensor(c(1.0, 2.0, 3.0))
x
```

If that prints a tensor without error, the installation is complete and you are ready for the course.
