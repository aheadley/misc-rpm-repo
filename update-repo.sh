#!/bin/bash

for repo_dir in rpm/{i686,x86_64,noarch,source}/; do
    createrepo -v --update \
        "$repo_dir"
done

aws s3 sync \
    --exclude '.git*' \
    --exclude '.git/*' \
    --exclude 'update-repo.sh' \
    ./ s3://aheadley-repo/
