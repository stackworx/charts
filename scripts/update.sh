#!/bin/bash
set -e
helm package ./app/


helm repo index .