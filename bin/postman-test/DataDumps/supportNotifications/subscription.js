var dbName = 'notifications';
var collectionName = 'subscription' ;
var subscriptions =[];
var operationStatus;

// Test case : Fail to create a subscription , cause slug already exist.
subscriptions.push(
    {
        "slug": "group-a-member",
        "receiver": "Group A Member",
        "subscribedCategories": [
            "SECURITY"
        ],
        "subscribedLabels": [
            "temperature",
            "humidity"
        ],
        "channels": [
            {
                "type": "EMAIL",
                "mailAddresses": [
                    "andy@abc.def",
                    "tom@abc.def"
                ]
            }
        ]
    }
);



try {

    operationStatus = db[collectionName].insertMany(subscriptions);

    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collectionName + ' , imported ' + operationStatus.insertedIds.length +' documents');


} catch (e) {
    print('[mongo js script] DB: '+ dbName + ' , collecation: ' + collectionName + ' , imported fail !! ');
    var wErrors = e.getWriteErrors();
    wErrors.forEach(function(doc){
        print(doc.errmsg);
    });

}