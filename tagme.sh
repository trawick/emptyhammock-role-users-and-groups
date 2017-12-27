#!/usr/bin/env bash
VERSION=`cat VERSION`
if git tag -a ${VERSION} -m "version ${VERSION}"; then
    exec git push --tags
fi
