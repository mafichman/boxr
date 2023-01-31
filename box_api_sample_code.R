## This code block is written by Dave Buckler & Michael Fichman
## mfichman@upenn.edu

## last update 31 January, 2023

install.packages('boxr')
library(boxr)

## Setup Vignette - https://cran.r-project.org/web/packages/boxr/vignettes/boxr.html

## Set up instructions:

# 1. Go to your box account and the "dev console" tab
# 2. Create a new app, choose the option for a "custom" app
# 3. Set the content action permissions to read and write all files and folders
# 4. Do not set up administrative actions - they will likely trigger permissions
# problems with your app.
# 5. Set the redirect url to http://localhost
# Note - You may need to change the OAuth uri to http://localhost:1410/
# As per this issue: https://github.com/r-box/boxr/issues/58
# 6. Once you have created and App within Box, copy the client keys below from the web console

box_auth(client_id = "", 
         client_secret = "")

# 7. You might be asked to authenticate your app through the web browser if this is your first
# time using it

## The Box API uses id numbers to identify files and directory. You can
## find the unique ID name of the folder you're working on at the end of
## the folder's URL on your browser:
## the numbers at the ende.g.https://upenn.app.box.com/folder/1234567890

## Make sure you have permissions from the owner of the folder
## to access it!

## To change working directory, use box_setwd('id_number')
box_setwd(1234567890)

box_getwd() ## returns the id number for top level (i.e. "0")
 
box_ls() ## returns a summary of the first 10 files in the top level of the directory

## To create a list of all files in the current directory run:
list <- box_ls() %>% as.data.frame()

## read in a csv (there are a bunch of `box_read` functions for common file types)
dat <- box_read_csv(1234)

## write out a csv
box_write(dat, "test_write1.csv")

