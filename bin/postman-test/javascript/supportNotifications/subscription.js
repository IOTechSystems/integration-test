var datasToBeRemoved = [

];

db.subscription.remove({
    _id: {
        $in: datasToBeRemoved
    }
});
db.subscription.remove({'slug': "sys-admin"});
