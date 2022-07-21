if [ $# -ne 1 ]; then
    echo "please specify a build version in the first argument"
    exit 1
fi

export TAG=$1

docker-compose up --build
