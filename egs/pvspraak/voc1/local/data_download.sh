#!/bin/bash

# Copyright 2019 Tomoki Hayashi
#  MIT License (https://opensource.org/licenses/MIT)

download_dir=$1

# check arguments
if [ $# != 1 ]; then
    echo "Usage: $0 <download_dir>"
    exit 1
fi

set -euo pipefail

cwd=$(pwd)
download_path="${download_dir}/ljspeech_parallel_wavegan.v3"
if [ ! -e "${download_path}" ]; then
    mkdir -p "${download_path}"
    cd "${download_path}"
    gdown --id 1OE4q4pYMQDrh1UhmVu0TDISqT5AwNVpl  # checkpoint.pkl
    gdown --id 1G5p4wY8ueNimeN6leQPHZM2CVkQKKPjc  # config.yml
    gdown --id 1DgaESpYID95yU9OjPIY_Mh13pBz1-nDm  # stats.h5
    cd "${cwd}"
    echo "Successfully downloaded data."
else
    echo "Already exists. Skipped."
fi
