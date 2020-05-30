#!/bin/bash
echo "ok"




echo "GIT_URL: "$GIT_URL
echo "DST_FOLDER: "$DST_FOLDER

git config --global user.email "bdhwan@gmail.com"
git config --global user.name "bdhwan"

git clone "$GIT_URL"


SOURCE=''

if [ -z "$DST_FOLDER" ]
then
    echo "not defined DST_FOLDER"
    SOURCE="$(basename "$GIT_URL" .git)"
else 
    echo "defined =" $DST_FOLDER
    cd "$(basename "$GIT_URL" .git)"
	SOURCE=$DST_FOLDER
fi

echo $SOURCE

cd $SOURCE
ng config -g cli.warnings.versionMismatch false

npm install

export NG_CLI_ANALYTICS=ci
ng build --prod --aot


mv www /var/www/html

nginx -g 'daemon off;'
