# nginx-git-html
```
version: "3.3"
services:
  build-html:
    image: bdhwan/git-nginx-angular-deploy-html:0.1
    environment:
    - GIT_URL=some_git_url_with_id_pw_if_need
    ports:
    - "8010:80"
```

GIT_URL: 앵귤러 js 소스파일의 레파지토리  



과정  
1. 소스코드 클론  
2. npm install  
3. ng build --prod --aot  
4. 생성된 결과물을 nginx html 폴더에 이동  



**angular.json 의 outputPath를 반드시 www로 해야함**  
"outputPath": "www",


