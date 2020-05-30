#!/bin/bash
docker build  --no-cache --tag bdhwan/git-nginx-angular-deploy-html:0.3 .
docker push bdhwan/git-nginx-angular-deploy-html:0.3