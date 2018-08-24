var exportConfigurationsToBeRemoved = [
    ObjectId("5b0eb384fd4ca80001df4fa9"),
    ObjectId("5b0eb384fd4ca80001df4fa2"),
    ObjectId("5b0eb384fd4ca80001df4fa3")
];

db.logEntry.remove({
    _id: {
        $in: exportConfigurationsToBeRemoved
    }
});

