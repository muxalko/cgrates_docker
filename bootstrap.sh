export CGRATES_VERSION_TAG=$(cat ./devel/CGRATES_VERSION_TAG)
export HOSTNAME=$(hostname)
docker-compose up -d
