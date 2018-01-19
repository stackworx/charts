
#!/bin/bash
helm install --dry-run --debug --name debug ./ > debug.yaml 2>&1