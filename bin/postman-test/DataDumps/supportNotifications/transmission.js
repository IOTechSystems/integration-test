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
        "status": "FAILED",
        "resendCount": 0,
        "records": [
            {
                "status": "FAILED",
                "response": "I/O error on POST request for \"http://localhost:5566/test\": Connection refused: connect; nested exception is java.net.ConnectException: Connection refused: connect",
                "sent": 1472439914709
            }
        ],
        "created": 1472439915730,
        "modified": 1472439915730
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
