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

// Test case : Can delete a specific Notification by slug.
documents.push(
    {
        "slug": "notice-003",
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

// Test case : Can delete a specific Notification by slug.
documents.push(
    {
        "slug": "notice-004",
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

// Test case : Can query the Notifications by sender name with limited returned records.
documents.push(
    {
        "slug": "notice-005",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ]
    }
);

documents.push(
    {
        "slug": "notice-006",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's relative humidity is 60 %",
        "labels": [
            "room",
            "humidity"
        ]
    }
);

documents.push(
    {
        "slug": "notice-007",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ]
    }
);

// Test case : Can query the Notifications by creation timestamp between start date and end date.
documents.push(
    {
        "slug": "notice-008",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ],
        "created":1300000
    }
);

documents.push(
    {
        "slug": "notice-009",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's relative humidity is 60 %",
        "labels": [
            "room",
            "humidity"
        ],
        "created":1300100
    }
);

documents.push(
    {
        "slug": "notice-010",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ],
        "created":1300200
    }
);

// Test case : Can query the Notifications by creation timestamp after start date.
documents.push(
    {
        "slug": "notice-011",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ],
        "created":1500001
    }
);

// Test case : Can query the Notifications by creation timestamp before end date.
documents.push(
    {
        "slug": "notice-012",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Room's temperature is 82 °F",
        "labels": [
            "room",
            "temperature"
        ],
        "created":1599999
    }
);

// Test case : Can query the Notifications by labels matching any one of them.
documents.push(
    {
        "slug": "notice-013",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ]
    }
);

// Test case : Can query the unprocessed Notifications (status = NEW).
documents.push(
    {
        "slug": "notice-014",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"NEW"
    }
);

// Test case : Can query the Transmissions associating a specific Notification by the Notification slug.
documents.push(
    {
        "_id" : ObjectId("57ba04a1189b95b8afcdafd1"),
        "slug": "notice-015",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"NEW"
    }
);
documents.push(
    {
        "_id" : ObjectId("57ba04a1189b95b8afcdafd1"),
        "slug": "notice-015",
        "sender": "Room System Management",
        "category": "HW_HEALTH",
        "severity": "NORMAL",
        "content": " [ Notification ] Power meter's counter value is 356 kWh",
        "labels": [
            "room",
            "power-meter"
        ],
        "status":"NEW"
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
