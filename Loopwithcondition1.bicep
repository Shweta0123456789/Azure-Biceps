param rgLocation string = resourceGroup().location
param storageCount int = 0
param createNewStorage bool = true

resource createStorages 'Microsoft.Storage/storageAccounts@2021-06-01' = [for i in range(3, storageCount): if(createNewStorage) {
  name: '${i}storage${uniqueString(resourceGroup().id)}'
  location: rgLocation
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}]
