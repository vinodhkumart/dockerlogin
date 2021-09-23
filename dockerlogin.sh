#!/bin/bash

function checkDockerLogin()
{
    is_login=`sudo cat ~/.docker/config.json | jq -r ".auths[].auth"`
    if [ -z $is_login ]
    then
        docker login -u username -p password
        if [ $? -ne 0 ]
        then
            echo "Unable to login to docker registry. Please try again."
            exit 1
        fi
    else
            echo "Already logged in. Pushing docker image"
    fi
}     
