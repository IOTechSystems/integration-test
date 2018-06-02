var dbName = 'notifications';
var collections = ['transmission' ,'notification' ,'subscription' ];
var operationStatus;

collections.forEach(function(collection) {
    operationStatus = db[collection].remove({});
    print('DB:'+ dbName + ' , collecation:' + collection + ' , data flushed . ');
    printjson(operationStatus);

});

