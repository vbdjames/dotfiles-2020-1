#!/usr/bin/env bash

#brew install sqlite
brew install mu

mu init --maildir=~/Maildir
mu index

brew install isync
brew install msmtp
