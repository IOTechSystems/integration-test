var dbName = 'metadata';
var collectionName = 'deviceService' ;
var documents =[];


documents.push(
    {
  "_id": {
    "$oid": "57f73d4ee4b060e27309e46e"
  },
  "_class": "org.edgexfoundry.domain.meta.DeviceService",
  "adminState": "LOCKED",
  "operatingState": "ENABLED",
  "name": "aeroplane tachometer device service",
  "description": "manage aeroplane tachometer",
  "lastConnected": 0,
  "lastReported": 0,
  "labels": [
    "aeroplane",
    "tachometer"
  ],
  "created": 1475820878623,
  "modified": 1475820878623,
  "origin": 1471806386924,
  "addressable": {
    "$ref": "addressable",
    "$id": {
      "$oid": "57f73cd2e4b060e27309e458"
    }
  }
}
);
documents.push(
    {
  "_id": {
    "$oid": "57fef1e6e4b060e2364c2e32"
  },
  "_class": "org.edgexfoundry.domain.meta.DeviceService",
  "adminState": "UNLOCKED",
  "operatingState": "ENABLED",
  "name": "home telxsi thermostat device service",
  "description": "manage home thermostats",
  "lastConnected": 0,
  "lastReported": 0,
  "labels": [
    "hvac",
    "thermostat"
  ],
  "created": 1476325862687,
  "modified": 1476325862687,
  "origin": 1471806386920,
  "addressable": {
    "$ref": "addressable",
    "$id": {
      "$oid": "57fef1cce4b060e2364c2e2d"
    }
  }
}
);
documents.push(
    {
  "_id": {
    "$oid": "57f79ff6e4b060e22bd8c1a8"
  },
  "_class": "org.edgexfoundry.domain.meta.DeviceService",
  "adminState": "UNLOCKED",
  "operatingState": "ENABLED",
  "name": "Test update thermostat deviceservice",
  "description": "manage homethermostats",
  "lastConnected": 0,
  "lastReported": 0,
  "labels": [
    "hvac",
    "thermostat"
  ],
  "created": 1475846134054,
  "modified": 1475846134054,
  "origin": 1471806386921,
  "addressable": {
    "$ref": "addressable",
    "$id": {
      "$oid": "57f74398e4b060e2730a58de"
    }
  }
}
);
documents.push(
    {
  "_id": {
    "$oid": "57f5df95e4b060e2071a5c35"
  },
  "_class": "org.edgexfoundry.domain.meta.DeviceService",
  "adminState": "UNLOCKED",
  "operatingState": "ENABLED",
  "name": "test service for core command",
  "description": "manage home thermostats",
  "lastConnected": 0,
  "lastReported": 0,
  "labels": [
    "hvac",
    "thermostat"
  ],
  "created": 1475731349802,
  "modified": 1475731349802,
  "origin": 1471806386920,
  "addressable": {
    "$ref": "addressable",
    "$id": {
      "$oid": "57f5df3ce4b060e2071a5c34"
    }
  }
}
);
documents.push(
    {
  "_id": {
    "$oid": "57fef1e6e4b070e2374f2e32"
  },
  "_class": "org.edgexfoundry.domain.meta.DeviceService",
  "adminState": "UNLOCKED",
  "operatingState": "ENABLED",
  "name": "home telxsi thermostat device service #2",
  "description": "manage home thermostats",
  "lastConnected": 0,
  "lastReported": 0,
  "labels": [
    "hvac",
    "thermostat"
  ],
  "created": 1476325862687,
  "modified": 1476325862687,
  "origin": 1471806386920,
  "addressable": {
    "$ref": "addressable",
    "$id": {
      "$oid": "57fef1cce4b060e2364c2e3d"
    }
  }
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
