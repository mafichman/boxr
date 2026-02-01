# Introduction --------------------------------------------------------------------------------

# This document walks you through how to set up your computer to use boxr and demonstrates basic usage of boxr.

# Written by Dave Buckler, Michael Fichman (mfichman@upenn.edu), and Chi-Hyun Kim
# Last updated January 28, 2026

# Documentation for the boxr package is available here: https://r-box.github.io/boxr/index.html
# This vignette gives an overview of the setup process: https://r-box.github.io/boxr/articles/boxr.html

# Step-by-step setup instructions -------------------------------------------------------------

# 0. Install boxr by running the following command:

install.packages('boxr')

# 1. Go to https://upenn.app.box.com/developers/console (you may be prompted to log in with your PennKey)
# 2. Click on the blue 'New App +' button
# 3. Enter an app name (e.g., 'boxr_access'), and choose 'OAuth 2.0' under 'App Type'
# 4. After you create the app, the browser will show you the app configuration page. There, scroll down to 'Application Scopes', check 'Write all files and folders stored in Box', and click the blue 'Save Changes' button. (Do not set up administrative actions - they will likely trigger permissions problems with your app.)
# 5. Scroll up on the same page to the 'Redirect URI' box. Paste in 'http://localhost:1410/' (without quotes) and Add.
# 6. Scroll up further to find the Client ID and Client Secret fields
# 7. Copy the client keys to the command below and run it. You'll be asked to authenticate your app through the web browser if this is your first time using it. 

boxr::box_auth(client_id = "", client_secret = "")

# 8. In the R console window, you will receive a response like this:

# Waiting for authentication in browser...
# Press Esc/Ctrl + C to abort
# Authentication complete.
# boxr: Authenticated using OAuth2 as [...]
# ● You may wish to add to your `.Renviron` file:
#   BOX_CLIENT_ID=your_client_id
# BOX_CLIENT_SECRET=your_client_secret
# [Copied to clipboard]
# ● To edit your `.Renviron` file:
#   - `usethis::edit_r_environ()`
# - check that `.Renviron` ends with a newline

# 9. Follow the directions in that message to add your Box client ID and client secret to your .Renviron file. 
# 10. Save the .Renviron file and restart R.
# 11. Setup is done!

# Basic usage ---------------------------------------------------------------------------------

library(boxr)

## At the beginning of each R session, you need to authenticate. 
## Simply include the following command in the setup section of your code:

box_auth()

## The Box API uses id numbers to identify files and directories. You can
## find the unique ID name of the folder you're working on at the end of
## the folder's URL on your browser, e.g.: https://upenn.app.box.com/folder/1234567890

## Make sure you have permissions from the owner of the folder to access it!

## You can also search among files and directories you have access to via box_search_files() and box_search_folders()

## To change the Box working directory, use box_setwd('id_number')
box_setwd(1234567890)

box_getwd() ## returns the id number for top level (i.e. "0")
 
box_ls() ## returns a summary of the first 10 files/folders in the top level of the directory

## To get a dataframe of all files in the current directory, run the following. 
box_wd_contents <- box_ls() %>% as.data.frame()

## Read in a csv. There are a bunch of `box_read` functions for common file types; 
## See: https://r-box.github.io/boxr/reference/box_read.html)
dat <- box_read_csv(1234)

## Write out a csv to your working directory 
## See: https://r-box.github.io/boxr/reference/box_write.html)
box_write(dat, "test_write1.csv")

