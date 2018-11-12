export CGRATES_VERSION_TAG=$(cat ./devel/CGRATES_VERSION_TAG)
export HOSTNAME=$(hostname)
cd ./env/$HOSTNAME
docker-compose up -d
