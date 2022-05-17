 export PROJECT_ID=elevated-surge-287013
 export ZONE=us-central1
 export JFROG_USER=abambah@google.com
 export JFROG_SERVER_NAME=swampup.jfrog.io
 export JFROG_API_KEY=AKCp8mYob6tpwgg6z4ytoWjH52E1vNny42RVJoWVjJHHt1CdWo6r1zRiRfQeQYRE1sWJyMQgs
 gcloud container clusters get-credentials testcluster --project=$PROJECT_ID --zone=$ZONE
 kubectl delete secret regcred
 kubectl create secret docker-registry regcred --docker-server=$JFROG_SERVER_NAME --docker-username=$JFROG_USER --docker-password=$JFROG_API_KEY