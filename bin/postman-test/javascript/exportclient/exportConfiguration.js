var exportConfigurationsToBeRemoved = [
    ObjectId("5b0eb384fd4ca80001df4fa9")
];

db.exportConfiguration.remove({
    _id: {
        $in: exportConfigurationsToBeRemoved
    }
});
