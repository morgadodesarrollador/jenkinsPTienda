
echo "Desplegando la app rde gdfaspTienda"

docker-compose -f ./build/docker-compose.yml down

docker-compose -f ./build/docker-compose.yml build
docker-compose -f ./build/docker-compose.yml up -d

