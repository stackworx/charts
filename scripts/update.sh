#!/bin/bash
set -e
helm package ./node-app/
helm package ./nginx-static/
helm package ./app/


helm repo index .