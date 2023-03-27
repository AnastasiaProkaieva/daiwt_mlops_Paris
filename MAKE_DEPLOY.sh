#!/usr/bin/env zsh
echo "Deploying dbx scripts on the Development ENV"
dbx deploy --workflows=daiwt-DEV-telco-churn-demo-setup-Paris -e dev
sleep 5
dbx deploy --workflows=daiwt-DEV-telco-churn-feature-table-creation-Paris -e dev
sleep 5
dbx deploy --workflows=daiwt-DEV-telco-churn-model-train-Paris -e dev
sleep 5
dbx deploy --workflows=daiwt-DEV-telco-churn-model-deployment-Paris -e dev
sleep 5
dbx deploy --workflows=daiwt-DEV-telco-churn-model-inference-batch-Paris -e dev
#sleep 10
# error on quota exeed sometimes 
#dbx deploy --workflows=daiwt-DEV-telco-churn-sample-integration-test-Paris -e dev
sleep 10
echo "Deploying dbx scripts on the Staging ENV"
dbx deploy --workflows=daiwt-STAGING-telco-churn-sample-integration-test-Paris -e staging
sleep 5
echo "Deploying dbx scripts on the Production ENV"
dbx deploy --workflows=daiwt-PROD-telco-churn-demo-setup-Paris -e prod
sleep 5
dbx deploy --workflows=daiwt-PROD-telco-churn-initial-model-train-register-Paris -e prod
sleep 5
dbx deploy --workflows=daiwt-PROD-telco-churn-train-deploy-inference-workflow-Paris -e prod