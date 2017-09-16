var deviceManagersToBeRemoved = [
    ObjectId("57f227cae4b060e2dd9f759f"),
    ObjectId("57fe02f1e4b060e2c823643e"),
    ObjectId("57fe0c22e4b060e2c8236440"),
    ObjectId("57fe0c28e4b060e2c8236441"),
    ObjectId("57fe0c2de4b060e2c8236442"),
    ObjectId("57fe0c39e4b060e2c8236443")
];

db.deviceManager.remove({
    _id: {
        $in: deviceManagersToBeRemoved
    }
});
db.deviceManager.remove({'name': "livingroomthermostat81"});
db.deviceManager.remove({'name': "livingroomthermostat8"});
//db.deviceManager.remove({'device':"57e8b705e4b060e251231c4f"});
