
echo "Desplegando la app rde gdfaspTienda"

docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d

