#!/bin/bash

# LOCATION: The Azure region. Use the "az account list-locations -o table" command to find a region near you.
# RESOURCE_GROUP_NAME: The resource group name. Can contain underscores, hyphens, periods, parenthesis, letters, and numbers.
# ACCOUNT_NAME: The Azure Cosmos DB for MongDB account name. Can contain lowercase letters, hyphens, and numbers.
# az login --use-device-code
$LOCATION='westeurope'
$RESOURCE_GROUP_NAME='msdocs-web-app-rg'
$ACCOUNT_NAME='flaskcontainerappdb'

# Create a resource group
echo "Creating resource group $RESOURCE_GROUP_NAME in $LOCATION..."
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create a Cosmos account for MongoDB API
echo "Creating $ACCOUNT_NAME. This command may take a while to complete."
az cosmosdb create --name $ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --kind MongoDB

# Create a MongoDB API database
echo "Creating database restaurants_reviews"
az cosmosdb mongodb database create --account-name $ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --name restaurants_reviews

# Create a MongoDB API collection
echo "Creating collection restaraunts_reviews"
az cosmosdb mongodb collection create --account-name $ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --database-name restaurants_reviews --name restaurants_reviews

# Get the connection string for the MongoDB database
echo "Get the connection string for the MongoDB account"
az cosmosdb keys list --name $ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --type connection-strings

echo "Copy the Primary MongoDB Connection String from the list above"