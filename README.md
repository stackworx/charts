# Read Me

## Deployment

After making any changes to the repo run `./scripts/update.sh` and then push the changes
Any changes should include a chart version bump

## Sample Chart

Sample `requirements.yaml`.

This contains a frontend, backend, scheduler, postgres database and redis instance

    dependencies:
    - name: app
      version: "0.1.0"
      repository: "https://raw.githubusercontent.com/stackworx/charts/master"
      alias: app-backend
    - name: app
      version: "0.1.0"
      repository: "https://raw.githubusercontent.com/stackworx/charts/master"
      alias: app-frontend
    - name: app
      version: "0.1.0"
      repository: "https://raw.githubusercontent.com/stackworx/charts/master"
      alias: app-scheduler
    - name: redis
      version: "3.3.2"
      repository: "https://kubernetes-charts.storage.googleapis.com"
    - name: postgresql
      version: "0.13.1"
      repository: "https://kubernetes-charts.storage.googleapis.com"

Sample `values.yaml`

    app-backend:
      image:
        repository: registry.gitlab.com/stackworx.io/<image>
        tag: develop
        pullPolicy: IfNotPresent
      imageCredentials:
        registry: registry.gitlab.com
      service:
        enabled: true
        type: ClusterIP
        externalPort: 80
        internalPort: 80
      ingress:
        enabled: true
        hosts:
          - <hostname>
        annotations:
          kubernetes.io/ingress.class: traefik
      resources: {}
      probes: {
        enabled: true,
        liveness: {
          path: /health
        },
        readiness: {
          path: /health
        }
      }
      migration:
        enabled: true
        # If custom image is required
        # image: ""
        command: ['yarn']
        args: ['migrate']
      env: {}
      nodeSelector:
        type: apps

    app-scheduler:
      image:
        repository: registry.gitlab.com/stackworx.io/<image>
        tag: develop
        pullPolicy: IfNotPresent
      imageCredentials:
        registry: registry.gitlab.com
      service:
        enabled: false
      ingress:
        enabled: false
      resources: {}
      probes: {
        enabled: false
      }
      env: {}
      nodeSelector:
        type: apps

    app-frontend:
      image:
        repository: registry.gitlab.com/stackworx.io/<image>
        tag: develop
        pullPolicy: IfNotPresent
      imageCredentials:
        registry: registry.gitlab.com
      service:
        enabled: true
        type: ClusterIP
        externalPort: 80
        internalPort: 80
      ingress:
        enabled: true
        hosts:
          - <hostname>
        annotations:
          kubernetes.io/ingress.class: traefik
      resources: {}
      env: {}
      nodeSelector:
        type: apps

    postgresql:
      imageTag: 9.6.2
      postgresUser: postgres
      postgresDatabase: postgres
      postgresInitdbArgs: --data-checksums
      persistence:
        size: 2Gi
      metrics:
        enabled: true
      nodeSelector:
        type: apps

    redis:
      tag: 4.0.6-r1
      # TODO enable password
      usePassword: false
      persistence:
        size: 1Gi
      metrics:
        enabled: true
      nodeSelector:
        type: apps

When the values.yaml set is finished run the following command:

    helm install ./ --namespace <namespace> --name <name>
