# github-action-test

## 목적
Github Actions에서 도커 캐시 적용 테스트를 해보는 레파지토리입니다.


## 도커 관련 CLI 정리
```
// 도커 이미지 빌드
docker build -t github-action-test-nestjs .

// 도커 컨테이너 실행 
docker run --rm -it --name nestjs-app github-action-test-nestjs:latest   
```