#!/bin/bash

read -r -p "Please enter the file type that you want to look for: " file_type
read -r -p "Please enter the absolute path of the directory you would like to search in: " dir_path

find $dir_path -type f -name "*.$file_type" | wc -l
