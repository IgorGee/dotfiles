#!/usr/bin/env bash

ssh-keygen -t rsa -b 4096 -C "goldvekht.igor@gmail.com"
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_rsa.pub"
