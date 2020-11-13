if [ ! -d logs ] ; then
   mkdir logs
fi
docker build . --tag devops > logs/build.log
