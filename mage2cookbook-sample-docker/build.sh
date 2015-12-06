#!/bin/bash

docker build -t mage2cookbook-sample-docker .

echo To publish use:
echo docker tag mage2cookbook-sample-docker raybogman/mage2cookbook-sample-docker
echo docker tag mage2cookbook-sample-docker raybogman/mage2cookbook-sample-docker:2.0.0
echo docker push raybogman/mage2cookbook-sample-docker:latest
