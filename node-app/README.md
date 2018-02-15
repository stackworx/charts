# Read Me

## Install

    helm install --namespace app-durf ./ --name durf --set imageCredentials.password=actualpassword

## Delete

    helm delete --purge durf
