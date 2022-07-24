#!/bin/bash

while [[ $# -gt 0 ]] && [[ "$1" == "--"* ]] ;
do
    opt="$1";
    shift;
    case "$opt" in
        "--" ) break 2;;
        "--version_service1" )
           VERSION_SERVICE1="$1"; shift;;
        "--version_service1="* )
           VERSION_SERVICE1="${opt#*=}";;
        "--version_service2" )
           VERSION_SERVICE2="$1"; shift;;
        "--version_service2="* )
           VERSION_SERVICE2="${opt#*=}";;
        *) echo >&2 "Invalid option: $@"; exit 1;;
   esac
done

if [[ -z $VERSION_SERVICE1 || -z $VERSION_SERVICE2 ]]; then
    echo "Missing deploy arguments 'version_service1' or 'version_service2'"
    exit 1
fi

echo "Deploying service 1 using version: ${VERSION_SERVICE1}"
echo "Deploying service 2 using version: ${VERSION_SERVICE2}"

export VERSION_SERVICE1
export VERSION_SERVICE2

docker-compose pull && docker-compose up -d
