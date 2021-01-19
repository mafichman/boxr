## This code block is written by Dave Buckler

install.packages('boxr')
library(boxr)

## Setup Vignette - https://cran.r-project.org/web/packages/boxr/vignettes/boxr.html

## Once you havr created and App within Box, copy the keys below from the webpage.
## Make sure you set the redirect_url to http://localhost

box_auth(client_id = "", 
         client_secret = "")

## The Box API uses id numbers to identify files and directory.

box_getwd() ## returns the id number for top level (i.e. "0")
 
box_ls() ## returns a summary of the first 10 files in the top level of the directory

## To create a list of all files in the current directory run:
list <- box_ls() %>% as.data.frame()

## To change working directory, use box_setwd('id_number')
box_setwd(1234567890)

## read in a csv
dat <- box_read_csv(1234)

## write out a csv
box_write(dat, "test_write1.csv")

