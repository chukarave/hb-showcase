#!/bin/bash

cd ../..
git submodule update --init --recursive
cd applications/cms/honeybee
make install
echo ''
echo 'You may now create your master admin account from the honeybee folder:'
echo ''
echo 'bin/cli user.create -username admin -email admin@example.com'
echo ''

