sudo docker login -u hienvannguyen0408 Hien04080408
docker pull hienvannguyen0408/doantotngiep-app:1.0
docker rm -f datnwebapp
docker run --rm -d --name datnwebapp  --publish "8082:80" -v /app/node_modules -v /app --user root --privileged=true -d hienvannguyen0408/doantotngiep-app:1.0
docker pull hienvannguyen0408/doantotngiep-api:1.0
docker rm -f datnwebapi
docker run --rm -d --name datnwebapi  --publish "5001:80" -v /app/publish  --user root --privileged=true -d hienvannguyen0408/doantotngiep-api:1.0
