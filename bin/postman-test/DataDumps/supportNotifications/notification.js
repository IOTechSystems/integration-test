var dbName = 'notifications';
var collectionName = 'notification' ;
var documents =[];

// Test case : Fail to create a normal notification , cause slug already exist .
documents.push(
    {
        "slug": "notice-001",
        "sender": "System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ]
    }
);

try {

    var operationStatus = db[collectionName].insertMany(documents);

    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collectionName + ' , imported ' + operationStatus.insertedIds.length +' documents');


} catch (e) {
    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collectionName + ' , imported fail !! ');
    var wErrors = e.getWriteErrors();
    wErrors.forEach(function(doc){
        print(doc.errmsg);
    });

}
