#!/bin/bash

read -rp 'Please enter the path to the folder:' path
read -rp 'Please enter the word you are looking for:' key_word

grep -r "$key_word" $path | wc -l
