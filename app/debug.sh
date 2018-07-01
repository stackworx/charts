#!/bin/bash
helm install ./ --name debug --dry-run --debug -f test.values.yaml --namespace default