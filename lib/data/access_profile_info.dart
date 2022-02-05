/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_info.dart';

class AccessProfInfo {

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Profile Info');
  
  void saveInfo(ProfileInfo info) {
    collection.add(info.toJson());
  }

  Stream<QuerySnapshot> getInfoStream() {
    return collection.snapshots();
  }
}*/
