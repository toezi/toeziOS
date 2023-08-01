docker build --no-cache --tag "toezi-image:latest" $PWD/docker/

mdkir $PWD/out

docker run -it --rm -v $PWD/out:/home/visionfive_yocto/yocto/output  toezi-image:latest