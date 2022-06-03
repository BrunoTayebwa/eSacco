/*import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileInfo {
  final String text;
  final DateTime date;
  final String? email;
  DocumentReference? reference;

  ProfileInfo({
  required this.text,
  required this.date,
  this.email,
  this.reference
});

factory ProfileInfo.fromJson(Map<dynamic, dynamic> json) => ProfileInfo(
    text: json['text'] as String,
    date: DateTime.parse(json['date'] as String),
    email: json['email'] as String?);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'date': date.toString(),
    'text': text,
    'email': email,
  };

factory ProfileInfo.fromSnapshot(DocumentSnapshot snapshot) {
    final info = ProfileInfo.fromJson(snapshot.data() as Map<String, dynamic>);
    info.reference = snapshot.reference;
    return info;
  }
}*/