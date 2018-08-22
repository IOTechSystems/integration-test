var dbName = 'metadata';
var collectionName = 'addressable' ;
var documents =[];


documents.push(
    {
      "_id": {
        "$oid": "57fef1cce4b060e2364c2e2d"
      },
      "_class": "org.edgexfoundry.domain.meta.Addressable",
      "name": "hvac telxsi thermo address",
      "protocol": "HTTP",
      "address": "172.17.0.1",
      "port": 48089,
      "path": "/livingroomthermostat",
      "publisher": "none",
      "user": "none",
      "password": "none",
      "topic": "none",
      "created": 1476325836425,
      "modified": 1476325836425,
      "origin": 1471806386920
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57f74398e4b060e2730a58de"
      },
      "_class": "org.edgexfoundry.domain.meta.Addressable",
      "name": "variableSpeedMeterTest",
      "protocol": "HTTP",
      "address": "172.17.0.1",
      "port": 48089,
      "path": "/variableSpeedMeter",
      "publisher": "none",
      "user": "none",
      "password": "none",
      "topic": "none",
      "created": 1475822488226,
      "modified": 1475822488226,
      "origin": 1471806386921
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57f5df3ce4b060e2071a5c34"
      },
      "_class": "org.edgexfoundry.domain.meta.Addressable",
      "name": "test addressable for command",
      "protocol": "HTTP",
      "address": "172.17.0.2",
      "port": 48089,
      "path": "/livingroomthermostat",
      "publisher": "none",
      "user": "none",
      "password": "none",
      "topic": "none",
      "created": 1475731260298,
      "modified": 1475731260298,
      "origin": 1471806386920
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57f73cd2e4b060e27309e458"
      },
      "_class": "org.edgexfoundry.domain.meta.Addressable",
      "name": "aeroplane tachometer address",
      "protocol": "HTTP",
      "address": "localhost",
      "port": 48082,
      "path": "/aeroplanetachometer",
      "publisher": "none",
      "user": "none",
      "password": "none",
      "topic": "none",
      "created": 1475820754746,
      "modified": 1475820754746,
      "origin": 1471806386924
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57fef1cce4b060e2364c2e3d"
      },
      "_class": "org.edgexfoundry.domain.meta.Addressable",
      "name": "nebulizer address",
      "protocol": "HTTP",
      "address": "172.17.0.1",
      "port": 48089,
      "path": "/personalnebulizer",
      "publisher": "none",
      "user": "none",
      "password": "none",
      "topic": "none",
      "created": 1476325836426,
      "modified": 1476325836426,
      "origin": 1471806386911
    }
);


try {

    var operationStatus = db[collectionName].insertMany(documents);

    print('[mongo js script] DB: '+ dbName + ' , collection: ' + collectionName + ' , imported ' + operationStatus.insertedIds.length +' documents');


} catch (e) {
    print('[mongo js script] DB: '+ dbName + ' , collection: ' + collectionName + ' , imported fail !! ');
    if("name" in e && e.name == 'BulkWriteError'){
        var wErrors = e.getWriteErrors();
        wErrors.forEach(function(doc){
            print(doc.errmsg);
        });
    }else{
        print(e);
    }
}






