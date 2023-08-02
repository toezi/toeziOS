docker build --tag "toezi-image:latest" $PWD/docker/

mkdir -p $PWD/out -ErrorAction SilentlyContinue

docker run -it --rm `
    -v $PWD/out:/home/build/output `
    -v $PWD/docker:/home/build/start `
    -u 30000:30000 `
    toezi-image:latest `
    
    