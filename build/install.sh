
echo "Desplegando la app rde sgdsfgsdfggdfaspTienda"

docker-compose -f ./build/docker-compose.yml down 

docker-compose -f ./build/docker-compose.yml build --no-cache
docker-compose -f ./build/docker-compose.yml up -d --remove-orphans

