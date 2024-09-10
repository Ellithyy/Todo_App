import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:todo_app_c9_sun_4pm/model/task_model.dart';

import '../utils/extract_data.dart';

class FirestoreUtils {


  static CollectionReference<TaskModel> getCollection() {

    // we get imstance from firestore then we get collection reference
    return FirebaseFirestore.instance
        .collection("TasksCollection")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) =>
          TaskModel.fromFirestore(snapshot.data()!),
      toFirestore: (value, _) => value.toFirestore(),
    );

    // convert map to object
    // convert object to  map<String, dynamic>
  }

  static Future<void> addDataToFirestore(TaskModel model) {


    var collectionRef = getCollection();
    var docRef = collectionRef.doc();


    //
    model.id = docRef.id;


    return docRef.set(model);


  }





  static Future<void> deleteDataFromFirestore(TaskModel model) {
    var collectionRef = getCollection();
    return collectionRef.doc(model.id).delete();
  }




  static Future<List<TaskModel>> getDataFromFirestore() async {
    var snapshot = await getCollection().get();
    return snapshot.docs.map((element) => element.data()).toList();
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeDataFromFirestore(DateTime dateTime) {
    var snapshot = getCollection().where("dateTime", isEqualTo: ExtractDate.extractDate(dateTime).millisecondsSinceEpoch).snapshots();
    return snapshot;
  }
}