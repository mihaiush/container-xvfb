#!/bin/bash

TAG=$(awk -F'[:"]' '/XVFB_VERSION=/{print $3}' Dockerfile | head -1)
echo "TAG=${TAG}"
