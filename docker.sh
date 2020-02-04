#!/bin/bash
docker build  --no-cache --tag bdhwan/git-nginx-angular-deploy-html:0.1 .
docker push bdhwan/git-nginx-angular-deploy-html:0.1