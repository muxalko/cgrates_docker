export CGRATES_VERSION_TAG=$(cat ./devel/CGRATES_VERSION_TAG)
export HOSTNAME=$(hostname)
cd master
docker-compose up -d
