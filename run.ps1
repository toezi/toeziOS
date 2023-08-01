docker build --no-cache --tag "toezi-image:latest" $PWD/docker/

mkdir -p $PWD/out -ErrorAction SilentlyContinue

docker run -it --rm -v $PWD/out:/home/toezios/yocto/output  toezi-image:latest