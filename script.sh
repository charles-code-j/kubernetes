#!/bin/bash

echo "Criando build das imagens docker..."

docker build -t charleszt/web-service-php:1.0 k8s-projeto1-app-base/backend/.
docker build -t charleszt/mysql-database:1.0 k8s-projeto1-app-base/database/.

echo "Mandando imagens docker para o repositório do Docker Hub..."

docker push charleszt/web-service-php:1.0
docker push charleszt/mysql-database:1.0

echo "Criando deploys..."

kubectl apply -f k8s-projeto1-app-base/deployment/backend-php-deployment.yaml
kubectl apply -f k8s-projeto1-app-base/deployment/mysql-database-deployment.yaml

echo "Criando services..."

kubectl apply -f k8s-projeto1-app-base/service/backend-php-service.yaml
kubectl apply -f k8s-projeto1-app-base/service/mysql-database-service.yaml

echo "Tudo pronto!!!"