#!/bin/bash
helm template debug ./ -f  test.values.yaml
# helm template debug ./ -f test.values-traefikv2.yaml