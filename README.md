# Demo: Google Cloud CI/CD for GKE
This repo demostrates CI/CD for GKE with Google Cloud tools Google Cloud Deploy, Cloud Build, Jfrog Artifact Registry and Jfrog Xray. The example app is based on a simple Python Flask example app named "Population Stats" and uses Kustomize overlays to enable configuration differences across three different environments: test, staging, and prod. 

[![Demo flow](https://github.com/avnit/Jfrog-demo/blob/main/Untitled-2022-05-16-1206.png)](https://github.com/avnit/Jfrog-demo/blob/main/Untitled-2022-05-16-1206.png)

## Fork this repo
This demo relies on you making git check-ins to simulate a developer workflow. So you'll need your own copy of these files in your own Github.com repo.

[Fork this repo on Github](https://github.com/vszal/pop-kustomize/fork)

If you've already done that, you can start the setup tutorial below.


## About the Sample app - Population stats

Simple web app that pulls population data based on U.S. address queries. Note, other countries are currently not supported.

Population data gathered from the U.S. Census Bureau [Population Estimate API](https://www.census.gov/data/developers/data-sets/popest-popproj/popest.html). 

Feedback and contributions welcomed!
