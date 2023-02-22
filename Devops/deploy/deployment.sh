sudo docker login -u hienvannguyen0408 Hien04080408
docker pull hienvannguyen0408/doantotngiep-app:1.0
docker rm -f datnwebapp
docker run --rm -d --name datnwebapp  --publish "8082:80" -v /app/node_modules -v /app --user root --privileged=true -d hienvannguyen0408/doantotngiep-app:1.0
docker pull hienvannguyen0408/doantotngiep-api:1.0
docker rm -f datnwebapi
docker run --rm -d --name datnwebapi  --publish "5001:80" -v /app/publish  --user root --privileged=true -d hienvannguyen0408/doantotngiep-api:1.0


docker run --name pgadmin -p 82:80 -e 'PGADMIN_DEFAULT_EMAIL=hienvannguyen@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=nvhien123' --user root --privileged=true -d dpage/pgadmin4
docker run -d -p 9000:9000 -p 9090:9090 --name minio_container  -v  ~/minio/data:/data -e "MINIO_ROOT_USER=NVHIEN123" -e "MINIO_ROOT_PASSWORD=NVHIEN123"  --user root --privileged=true quay.io/minio/minio server /data --console-address ":9090" 
docker run -d -it --name rabbitmq -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=nvhien -e RABBITMQ_DEFAULT_PASS=nvhien -v /home/rabbitmq/:/var/lib/rabbitmq --user root --privileged=true rabbitmq:3.11-management
