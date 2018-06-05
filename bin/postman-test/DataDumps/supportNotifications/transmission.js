var dbName = 'notifications';
var collectionName = 'transmission' ;
var documents =[];

// Test case : Can query the Transmissions associating a specific Notification by the Notification slug.
documents.push(
    {
        "notification": {
            "$ref": "notification",
            "$id": ObjectId("57ba04a1189b95b8afcdafd1")
        },
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 1472439915730,
        "modified": 1472439915730
    }
);

// Test case : Can query the Transmissions by creation timestamp between start date and end date.
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100010,
        "modified": 100010
    }
);

// Test case : Can query the Transmissions by creation timestamp after start date.
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 150000,
        "modified": 150000
    }
);

// Test case : Can query the Transmissions by creation timestamp before end date.
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "SENT",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 99000,
        "modified": 99000
    }
);

// Test case : Can query the escalated Transmissions (status = ESCALATED) .
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "ESCALATED",
        "resendCount": 0,
        "records": [
            {
                "status": "SENT",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100000,
        "modified": 100000
    }
);

// Test case : Can query the failed Transmissions (status = FAILED) .
documents.push(
    {
        "receiver": "Jack",
        "channel": {
            "type": "REST",
            "url": "http://localhost:5566/test",
            "httpMethod": "POST",
            "_class" : "org.edgexfoundry.support.domain.notifications.RESTfulChannel" ,
        },
        "status": "FAILED",
        "resendCount": 0,
        "records": [
            {
                "status": "FAILED",
                "response": "true",
                "sent": 1472439914709
            }
        ],
        "created": 100000,
        "modified": 100000
    }
);

try {

    var operationStatus = db[collectionName].insertMany(documents);

    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collectionName + ' , imported ' + operationStatus.insertedIds.length +' documents');


} catch (e) {
    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collectionName + ' , imported fail !! ');
    if("name" in e && e.name == 'BulkWriteError'){
        var wErrors = e.getWriteErrors();
        wErrors.forEach(function(doc){
            print(doc.errmsg);
        });
    }else{
        print(e);
    }
}
