#!/bin/bash
set -e
helm package ./app/
helm package ./postgresql-s3-backup/


helm repo index .