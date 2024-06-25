#!/bin/sh

gcloud compute routers create empathy-router \
    --project=$PROJECT_ID \
    --network=empathy-vpc \
    --region=$REGION

gcloud compute routers nats create empathy-nat \
   --router=empathy-router \
   --project=$PROJECT_ID \
   --region=$REGION \
   --auto-allocate-nat-external-ips \
   --nat-all-subnet-ip-ranges \
   --enable-logging

gcloud container clusters get-credentials gke1 --region $REGION
kubectl delete deployment nginx-1