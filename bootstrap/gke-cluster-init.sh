# Creates 3 GKE autopilot clusters
# Initializes APIS, sets up the Google Cloud Deploy pipeline
# bail if PROJECT_ID is not set
if [[ -z "${PROJECT_ID}" ]]; then
  echo "The value of PROJECT_ID is not set. Be sure to run export PROJECT_ID=YOUR-PROJECT first"
  return
fi
if [[-z "${JFROG_API_KEY}"]]; then
  echo "Provide jfrog API key"
  return
fi

# Test cluster
echo "creating testcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "testcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async
# Staging cluster
echo "creating stagingcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "stagingcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async
# Prod cluster
echo "creating prodcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "prodcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async
echo "Creating clusters! Check the UI for progress"

gcloud container clusters get-credentials testcluster --project=$PROJECT_ID --zone=$ZONE
kubectl create secret docker-registry regcred --docker-server=$JFROG_SERVER_NAME --docker-username=$JFROG_USER --docker-password=$JFROG_API_KEY
# Stage
gcloud container clusters get-credentials stagingcluster --project=$PROJECT_ID --zone=$ZONE
kubectl create secret docker-registry regcred --docker-server=$JFROG_SERVER_NAME --docker-username=$JFROG_USER --docker-password=$JFROG_API_KEY
#prod
gcloud container clusters get-credentials prodcluster --project=$PROJECT_ID --zone=$ZONE
kubectl create secret docker-registry regcred --docker-server=$JFROG_SERVER_NAME --docker-username=$JFROG_USER --docker-password=$JFROG_API_KEY