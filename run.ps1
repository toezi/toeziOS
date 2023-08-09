docker build --tag "toezi-image:latest" $PWD/docker/
if (-not $?) {throw "Failed to doSomething"}

mkdir -p $PWD/out -ErrorAction SilentlyContinue

$BUILD_PATH = "C:\yocto"

docker run -it --rm `
    -v ${BUILD_PATH}:/home/build/output `
    -v $PWD/docker:/home/build/start `
    -u 30000:30000 `
    toezi-image:latest `
#    bash start/build.sh `
    
    