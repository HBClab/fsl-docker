#!/bin/sh

set -e

# Generate Dockerfile or Singularity recipe.
generate() {
  docker run --rm  kaczmarj/neurodocker:0.6.0 generate "$1" \
    --base=neurodebian:stretch-non-free \
    --pkg-manager=apt \
    --fsl version=6.0.1 \
    --user=neuro \
    --workdir='/home/neuro'
}

generate docker > Dockerfile
