#!/bin/bash
gcloud compute instances create reddit-app --image-family=reddit-full --image-project=devopslearn --machine-type=g1-small --tags puma-server --restart-on-failure --zone=us-west2-b
