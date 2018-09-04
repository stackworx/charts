#!/bin/bash
set -e
helm lint ./app/
helm package ./app/

helm lint ./postgresql-s3-backup/ --values ./postgresql-s3-backup/test.values.yaml
helm package ./postgresql-s3-backup/


helm repo index .