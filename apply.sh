#!/bin/sh
kubectl delete svc -n istio-system istio-ingressgateway
while ! kustomize build example | kubectl apply -f -; do echo "Retrying to apply resources"; sleep 20; done
kubectl patch svc -n istio-system istio-ingressgateway -p '{"spec":{"externalIPs":["10.100.4.40"]}}'
