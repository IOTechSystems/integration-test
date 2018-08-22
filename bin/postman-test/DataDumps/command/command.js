var dbName = 'metadata';
var collectionName = 'command' ;
var documents =[];


documents.push(
    {
      "_id": {
        "$oid": "57fef1d5e4b060e2364c2e2f"
      },
      "_class": "org.edgexfoundry.domain.meta.Command",
      "name": "coolingpoint",
      "get": {
        "path": "/telxsicooling"
      },
      "put": {
        "parameters": [
          {
            "name": "coolingpoint",
            "value": "float"
          }
        ],
        "path": "/telxsicooling"
      },
      "created": 1476325845735,
      "modified": 1476325845735,
      "origin": 1471806386919
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57fef1dbe4b060e2364c2e30"
      },
      "_class": "org.edgexfoundry.domain.meta.Command",
      "name": "telxsi cooling point",
      "get": {
        "path": "/telxsicooling"
      },
      "put": {
        "parameters": [
          {
            "name": "coolingpoint",
            "value": "float"
          }
        ],
        "path": "/telxsicooling"
      },
      "created": 1476325851338,
      "modified": 1476325851338,
      "origin": 1471806386919
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57fb3067e4b060e22bd8c1b6"
      },
      "_class": "org.edgexfoundry.domain.meta.Command",
      "name": "living room command",
      "get": {
        "path": "/cooling"
      },
      "put": {
        "parameters": [
          {
            "name": "coolingpoint",
            "value": "float"
          }
        ],
        "path": "/cooling"
      },
      "created": 1476079719916,
      "modified": 1476079719916,
      "origin": 1471806386919
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57f73d6ce4b060e27309e45b"
      },
      "_class": "org.edgexfoundry.domain.meta.Command",
      "name": "min revelutions ",
      "get": {
        "path": "/aeroplaneenginerevelutionsperminute"
      },
      "put": {
        "parameters": [
          {
            "name": "min revelutions",
            "value": "float"
          }
        ],
        "path": "/aeroplaneenginerevelutionsperminute"
      },
      "created": 1475820908242,
      "modified": 1475820908242,
      "origin": 1471806386924
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57f5e077e4b060e2071a5c36"
      },
      "_class": "org.edgexfoundry.domain.meta.Command",
      "name": "cooling point",
      "get": {
        "path": "/cooling",
        "response": {
          "code": "200",
          "errorDescription": "not a float",
          "expectedValues": "temperature"
        }
      },
      "put": {
        "parameters": [
          {
            "name": "coolingpoint",
            "value": "float"
          }
        ],
        "path": "/cooling",
        "response": {
          "code": "200",
          "errorDescription": "not a float",
          "expectedValues": "temperature"
        }
      },
      "created": 1475731575402,
      "modified": 1475731575402,
      "origin": 1471806386919
    }
);
documents.push(
    {
      "_id": {
        "$oid": "57fef1fbe4b060e2364c2e30"
      },
      "_class": "org.edgexfoundry.domain.meta.Command",
      "name": "percentage",
      "get": {
        "path": "/oxygenpercentage"
      },
      "put": {
        "parameters": [
          {
            "name": "percentage",
            "value": "float"
          }
        ],
        "path": "/oxygenpercentage"
      },
      "created": 1476325851339,
      "modified": 1476325851339,
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
