#!/bin/bash
set -e
helm package ./node-app/
helm package ./nginx-static/

helm repo index .