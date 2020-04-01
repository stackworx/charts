#!/bin/bash
set -e
helm lint ./app/ --values ./app/test.values.yaml
helm lint ./app/ --values ./app/test.values-traefikv2.yaml
helm package ./app/

helm lint ./traefikv2-ingress/ --values ./traefikv2-ingress/test.values.yaml
helm package ./traefikv2-ingress/

helm lint ./postgresql-s3-backup/ --values ./postgresql-s3-backup/test.values.yaml
helm package ./postgresql-s3-backup/

# helm lint ./oauth-server/ --values ./oauth-server/test.values.yaml
helm package ./oauth-server/

helm repo index .