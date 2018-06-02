var dbName = 'notifications';
var collectionName = 'subscription';
var operationStatus = db[collectionName].remove({});

print('DB:'+ dbName + ' , collecation:' + collectionName + ' , data flushed . ');
printjson(operationStatus);
