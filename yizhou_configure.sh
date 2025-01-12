#!/bin/bash
set -e

BASEDIR=$(dirname "$0")
echo "$BASEDIR"
base_dir=$(realpath "${BASEDIR}")

build_dir=${base_dir}/build
echo "build_dir: ${build_dir}"

install_dir=${build_dir}/install
echo "install_dir: ${install_dir}"

# Configure, disable corba
./configure --prefix "${install_dir}" --disable-corba

# Make and install
cd "${build_dir}"
make -j4 && make install

# Copy scripts
cp "${build_dir}"/orocos_toolchain/env.sh "${install_dir}"/env.sh
cp "${build_dir}"/orocos_toolchain/setup.sh "${install_dir}"/setup.sh