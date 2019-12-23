#!/usr/bin/env bash

_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${_dir}/common.sh"

pushd "${_dir}/../client"
npm run build

aws s3 sync build s3://${SITE_DOMAIN} && \
aws s3 cp build/index.html s3://${SITE_DOMAIN}/index.html --cache-control max-age=0
popd