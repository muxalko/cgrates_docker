export CGRATES_VERSION_TAG=$(cat ./devel/CGRATES_VERSION_TAG)
export HOSTNAME=$(hostname -s)
cd ./env/$HOSTNAME
docker-compose down
