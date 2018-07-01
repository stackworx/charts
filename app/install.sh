#!/bin/bash
helm install ./ --name debug --debug -f test.values.yaml --namespace default