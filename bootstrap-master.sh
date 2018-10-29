export CGRATES_VERSION_TAG=$(cat ./devel/CGRATES_VERSION_TAG)
cd master
docker-compose up -d
