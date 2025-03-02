#!/bin/sh

docker run \
        -p 1313:1313 \
        -v ${PWD}:/src \
        -v ${PWD}/hugo_cache:/tmp/hugo_cache \
        hugomods/hugo:exts-0.145.0 "$@"

